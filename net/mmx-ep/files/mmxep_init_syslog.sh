#!/bin/sh /etc/rc.common
################################################################################
#
# mmxep_init_syslog.sh
#
# Copyright (c) 2013-2021 Inango Systems LTD.
#
# Author: Inango Systems LTD. <support@inango-systems.com>
# Creation Date: 2013
#
# The author may be reached at support@inango-systems.com
# 
# Redistribution and use in source and binary forms, with or without modification,
# are permitted provided that the following conditions are met:
# 
# 1. Redistributions of source code must retain the above copyright notice,
# this list of conditions and the following disclaimer.
# 
# 2. Redistributions in binary form must reproduce the above copyright notice,
# this list of conditions and the following disclaimer in the documentation
# and/or other materials provided with the distribution.
# 
# Subject to the terms and conditions of this license, each copyright holder
# and contributor hereby grants to those receiving rights under this license
# a perpetual, worldwide, non-exclusive, no-charge, royalty-free, irrevocable
# (except for failure to satisfy the conditions of this license) patent license
# to make, have made, use, offer to sell, sell, import, and otherwise transfer
# this software, where such license applies only to those patent claims, already
# acquired or hereafter acquired, licensable by such copyright holder or contributor
# that are necessarily infringed by:
# 
# (a) their Contribution(s) (the licensed copyrights of copyright holders and
# non-copyrightable additions of contributors, in source or binary form) alone;
# or
# 
# (b) combination of their Contribution(s) with the work of authorship to which
# such Contribution(s) was added by such copyright holder or contributor, if,
# at the time the Contribution is added, such addition causes such combination
# to be necessarily infringed. The patent license shall not apply to any other
# combinations which include the Contribution.
# 
# Except as expressly stated above, no rights or licenses from any copyright
# holder or contributor is granted under this license, whether expressly, by
# implication, estoppel or otherwise.
# 
# DISCLAIMER
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
# USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# 
# NOTE
# 
# This is part of a management middleware software package called MMX that was developed by Inango Systems Ltd.
# 
# This version of MMX provides web and command-line management interfaces.
# 
# Please contact us at Inango at support@inango-systems.com if you would like to hear more about
# - other management packages, such as SNMP, TR-069 or Netconf
# - how we can extend the data model to support all parts of your system
# - professional sub-contract and customization services
# 
################################################################################

START=97
STOP=10

EXTRA_COMMANDS="stop_and_clean stop_and_restore_config restart_with_canddb"
EXTRA_HELP="        stop_and_clean  Stop MMX EP, clean the running and saved DBs"$'\n'"\
        stop_and_restore_config  Stop MMX EP and restore the saved DBs and config files"$'\n'"\
        restart_with_canddb  Restart MMX EP using the candidate database"

if [ -n "$(which tmpovrlctl)" ] ; then
    TMPOVERLAY_SUPPORT="true"
else
    TMPOVERLAY_SUPPORT="false"
fi

REFORMAT_SUCCESS=0
REFORMAT_FAIL=1
REFORMAT_NOT_NEEDED=2
REFORMAT_NO_SRC_DB=3

log() {
  logger -p daemon.info -s "$1"
}

to_log() {
   IFS=
   while read msg; do
    log $msg
   done
}



# The main code of the Entry-Point starting procedure. Includes:
#   - MMX DB reformat,
#   - decision of which DB will be used as MMX "running" data store.
# Arguments:
#    - arg1 is "true", the candidate DB should be used as running DB.
#
mmxep_start_actions()
{
    running_from_cand_db=$1

    mkdir -p $MMX_SYSTEM_LOG_DIR
    #MMXEP_LOGFILE="$MMX_SYSTEM_LOG_DIR/mmx-ep.log"
    #MMXEP_INIT_LOGFILE="$MMX_SYSTEM_LOG_DIR/mmx-init-ep.log"
    MMXEP_LOGFILE=2
    MMXEP_INIT_LOGFILE=2
    # temporary location for DB reformat
    REFORMAT_TMP_PATH="/tmp/db-reformat"
    mkdir -p $REFORMAT_TMP_PATH

    #       Check MMX databases
    #Check if a database exists in the usual running location ($INANGOBASEPATH)
    # If not - check in the saved db path, if DB exist in saved path copy it
    #   to running path (it is last saved DB),
    #   otherwise - copy DB from the default path (i.e. factory default DB)
    mkdir -p $INANGOBASEPATH

    log "Date: `date` "
    log "MMX EP init  (tmp overlay feature support is $TMPOVERLAY_SUPPORT)"

    log "Running MMX DBs: $INANGOBASEPATH/$MMXMETADBNAME $INANGOBASEPATH/$MMXMAINDBNAME"
    local retval=$REFORMAT_FAIL

    # try to perform reformat of the running DB
    perform_reformat $INANGOBASEPATH $MMXDEFAULTDBPATH $REFORMAT_TMP_PATH
    retval=$?
    log "result of running DB reformat is $retval"
    case $retval in
        $REFORMAT_SUCCESS)
            cp $REFORMAT_TMP_PATH/$MMXMAINDBNAME $INANGOBASEPATH/$MMXMAINDBNAME
            cp $MMXDEFAULTDBPATH/$MMXMETADBNAME $INANGOBASEPATH/$MMXMETADBNAME
        ;;
        $REFORMAT_FAIL | $REFORMAT_NO_SRC_DB)
            rm -r $INANGOBASEPATH/* &>/dev/null
        ;;
        *)
        ;;
    esac

    # try to perform reformat of the saved (startup) DB
    perform_reformat $MMXSAVEDDBPATH $MMXDEFAULTDBPATH $REFORMAT_TMP_PATH
    retval=$?
    log "result of saved DB reformat is $retval"
    case $retval in
        $REFORMAT_SUCCESS)
            cp $REFORMAT_TMP_PATH/$MMXMAINDBNAME $MMXSAVEDDBPATH$MMXMAINDBNAME
            cp $MMXDEFAULTDBPATH/$MMXMETADBNAME $MMXSAVEDDBPATH$MMXMETADBNAME
            mmx_update_jffs $MMXSAVEDDBPATH
        ;;
        $REFORMAT_FAIL | $REFORMAT_NO_SRC_DB)
            rm -r $MMXSAVEDDBPATH* &>/dev/null
            mmx_update_jffs $MMXSAVEDDBPATH
        ;;
        *)
        ;;
    esac

    # try to perform reformat of the candidate DB
    perform_reformat $MMXCANDDBPATH $MMXDEFAULTDBPATH $REFORMAT_TMP_PATH
    retval=$?
    log "result of candidate DB reformat is $retval"
    case $retval in
        $REFORMAT_SUCCESS)
            cp $REFORMAT_TMP_PATH/$MMXMAINDBNAME $MMXCANDDBPATH$MMXMAINDBNAME
            cp $MMXDEFAULTDBPATH/$MMXMETADBNAME $MMXCANDDBPATH$MMXMETADBNAME
            mmx_update_jffs $MMXCANDDBPATH
        ;;
        $REFORMAT_FAIL | $REFORMAT_NO_SRC_DB)
            rm -r $MMXCANDDBPATH* &>/dev/null
            mmx_update_jffs $MMXCANDDBPATH
        ;;
        *)
        ;;
    esac

    rm -r $REFORMAT_TMP_PATH/* &>/dev/null

    if [ "$running_from_cand_db" == "true" ] ; then
        # check if candidate DB exist and/or was reformatted successfully
        log "Try to start MMX EP with candidate DB"

        if [ -e $MMXCANDDBPATH$MMXMETADBNAME -a -e $MMXCANDDBPATH$MMXMAINDBNAME ] ; then
            log "MMX meta- and main DB are taken from candidate db path"
            rm $INANGOBASEPATH/* &>/dev/null
            cp $MMXCANDDBPATH* $INANGOBASEPATH/
        else
            log "No meta or main candidate DB found"
            rm $MMXCANDDBPATH* &>/dev/null
            #completely remove cand db from the permanent memory
            mmx_update_jffs $MMXCANDDBPATH
        fi
    fi

    # Check if running DB exist (or candidate DB was installed to running DB)
    # if it doesn't exists, check for saved DB and install it to running DB path
    # if neither running, nor saved DB exist, install the default DB to running DB path
    if [ -e $INANGOBASEPATH/$MMXMETADBNAME -a -e $INANGOBASEPATH/$MMXMAINDBNAME ] ; then
       if [ "$running_from_cand_db" != "true" ] ; then
           log "MMX DBs are taken from the running db path: $INANGOBASEPATH"
       fi
    else
        # no running and/or candidate DB found
        rm $INANGOBASEPATH/$MMXMETADBNAME"-journal" 2>/dev/null
        rm $INANGOBASEPATH/$MMXMAINDBNAME"-journal" 2>/dev/null

        # check if saved DB exist and/or was reformatted successfully
        if [ -e $MMXSAVEDDBPATH$MMXMETADBNAME -a -e $MMXSAVEDDBPATH$MMXMAINDBNAME ] ; then
            log "MMX meta-db and main db are taken from the saved db path"
            cp $MMXSAVEDDBPATH$MMXMETADBNAME $INANGOBASEPATH/$MMXMETADBNAME
            cp $MMXSAVEDDBPATH$MMXMAINDBNAME $INANGOBASEPATH/$MMXMAINDBNAME
        else
            log "MMX meta-db and main db are taken from mmx-defaults"
            cp $MMXDEFAULTDBPATH/$MMXMETADBNAME $INANGOBASEPATH/$MMXMETADBNAME
            cp $MMXDEFAULTDBPATH/$MMXMAINDBNAME $INANGOBASEPATH/$MMXMAINDBNAME
        fi
    fi

    # The MMX saved and cand DB files will survive system upgrade,
    # since they are added to the list under /lib/upgrade/keep.d/

    # Now start mmx entry-point exe
    PATH=$PATH:$MMXBESCRIPTPATH
    #/usr/sbin/mmx-ep >> $MMXEP_LOGFILE 2>&1 &
    /usr/sbin/mmx-ep &

    sleep 1
    pgrep -f mmx-ep &>/dev/null
    if [ $? -eq 0 ]; then
        log "MMX Entry-Point executable has been started"
    fi

    #echo "Save MMX init log file" >> $MMXEP_INIT_LOGFILE
    #cp $MMXEP_INIT_LOGFILE "/etc/mmx/mmx-init-ep.log"
    #mmx_update_jffs "/etc/mmx/mmx-init-ep.log"

}


mmxep_stop_actions()
{
    killall -q mmx-ep

    #Check if mmx-ep threads still run, if yes send KILL signal
    sleep 1
    pgrep -f mmx-ep &>/dev/null
    if [ $? -eq 0 ]; then
        log "MMX Entry-point will be stoped by SIGKILL signal"
        killall -KILL -q mmx-ep
    fi

}

start() {
    . /usr/sbin/mmxep_env.sh

    # Determine DB type: startup (i.e. saved-db) or candidate (cand-db)
    # that MMX Entry-Point will use during the start time
    # This DB will be the "running" DB

    dbtype_for_start=`cat $MMX_START_DBTYPE_FILE 2> /dev/null`

    if [ -z "$dbtype_for_start" ] ; then
        dbtype_for_start="startup"
    else
        if [ "$dbtype_for_start" != "candidate" ] ; then
            dbtype_for_start="startup"
        fi
    fi

    # Reset the start db type
    echo "startup" > $MMX_START_DBTYPE_FILE

    # Now run all needed start actions
    if [ "$dbtype_for_start" == "candidate" ] ; then
        mmxep_start_actions "true"
    else
        mmxep_start_actions
    fi

    log "MMX Entry-Point is started. DB path $INANGOBASEPATH, backend script path $MMXBESCRIPTPATH"

    exit 0
}

stop() {
    . /usr/sbin/mmxep_env.sh

    mmxep_stop_actions

    log "MMX Entry-point stoped"
    exit 0
}

restart() {

   . /usr/sbin/mmxep_env.sh

    mmxep_stop_actions

    sleep 2

    mmxep_start_actions

    log "MMX Entry-point restarted"

    exit 0

}

# stop_and_clean function
# Stop Entry-Point if running and remove runtime and saved DBs (/tmp/db/*)
# This function should be used with caution. For debugging/testing stage only
stop_and_clean() {
    . /usr/sbin/mmxep_env.sh

    if [ "$(ps | grep mmx-ep | grep -v grep | grep -v opkg)" ]; then
        mmxep_stop_actions
        sleep 2
    fi
    log "MMX Entry-point stoped"

    # Remove the running DBs
    rm $INANGOBASEPATH/* &>/dev/null

    # Remove the saved DB
    rm $MMXSAVEDDBPATH* 2>/dev/null

    #completely remove the saved DBs from the permanent memory
    mmx_update_jffs $MMXSAVEDDBPATH

    log "MMX running and saved DBs have been cleaned"

    exit 0
}

# stop_and_restore_config function
# Stop Entry-Point if running, remove runtime DBs (/tmp/db/*) and
# then start again.
# The saved DB (or default DB if the savedDB does not exists) will be used
# as running DB.
# (By other words the Entry-Point forgets all not saved settings and
#  is started with the "startup" cofiguration.)
stop_and_restore_config() {
    . /usr/sbin/mmxep_env.sh

    if [ "$(ps | grep mmx-ep | grep -v grep | grep -v opkg)" ] ; then
        mmxep_stop_actions
        sleep 2
    fi
    log "MMX Entry-point stoped"

    # Remove the running DBs
    rm $INANGOBASEPATH/* &>/dev/null
    rm $MMXUCICONFIGPATH/*

    # In case of "tmp ovelay fs" feature is supported, forget all not-saved
    # changes in config files,
    # otherwise - replace all config files by the saved config files
    if [ -n $(which tmpovrlctl) ] ; then
         tmpovrlctl clear_upper -f $MMXUCICONFIGPATH
    else
        cp $MMXSAVEDCONFIGPATH/* $MMXUCICONFIGPATH/.
    fi

    log "MMX configuration and DB are restored. System restart is required!"

    exit 0
}

# Restart the Entry-Point using the candidate database as the running DB
restart_with_canddb() {

    . /usr/sbin/mmxep_env.sh

    mmxep_stop_actions

    sleep 2

    mmxep_start_actions "true"

    log "MMX Entry-point restarted with the candidate DB"

    exit 0
}

# DB reformat procedure.
#  Passes data from the "old" format DB to the "new" format DB.
#   Args:
#   - source DB path (the DB of the "old" format that contains data,
#          we need to pass to the dest DB )
#   - template DB path (empty DB that defines format of the
#         "new" db)
#   - dest DB path (the "new" DB where data would be stored)
perform_reformat() {
    # remove trailing whitespaces
    local src_db_path=${1%/}
    local template_db_path=${2%/}
    local temp_db_path=${3%/}

    DB_GET_VERSION=${MMX_LUAUTILS_DIR}/mmx_db_reformat_get_version.lua
    DB_CLEAR=${MMX_LUAUTILS_DIR}/mmx_db_reformat_clear.lua
    DB_PERFORM_REFRMT=${MMX_LUAUTILS_DIR}/mmx_db_reformat_perform.lua

    log "    perform_reformat: Template MMX DB path: $template_db_path"
    log "    perform_reformat: Source DB path: $src_db_path"
    log "    perform_reformat: Dest DB path: $temp_db_path"

    if [ -e $src_db_path/$MMXMETADBNAME -a -e $src_db_path/$MMXMAINDBNAME ] ; then
        # check version of src and template dbs, to decide
        # if we need to perform reformat
        src_ver=$($DB_GET_VERSION $src_db_path/$MMXMETADBNAME)
        template_ver=$($DB_GET_VERSION $template_db_path/$MMXMETADBNAME)
        log "    perform_reformat: Source DB ver: $src_ver; Template DB ver: $template_ver"

        # DB version string looks as "xx.yy.zzz",
        # where "xx.yy" is major version and "zzz" is minor version

        src_major_ver=$(echo $src_ver | cut -d. -f-2)
        template_major_ver=$(echo $template_ver | cut -d. -f-2)

        if [ "$src_major_ver" != "$template_major_ver" ] ; then
            # major version of src and template DBs are different,
            # so DB reformat would be performed
            log "    perform_reformat: DB version mismatch, trying to perform DB reformat"

            # make sure destination DB path exist and is empty
            if [ -e $temp_db_path ] ; then
                rm -r $temp_db_path/* 2>/dev/null
            else
                mkdir -p $temp_db_path
            fi

            # make a copy of template main DB to temporary DB path:
            cp $template_db_path/$MMXMAINDBNAME $temp_db_path/$MMXMAINDBNAME
            # clear all data, that may be stored in a template main DB as an initial configutation
            $DB_CLEAR $temp_db_path/$MMXMAINDBNAME
            clear_res=$?

            if [ $clear_res -eq 0 ] ; then
            # template DB was cleared sucessfully,
            # run pre_reformat script if it exist
                pre_reformat=$template_db_path/../db_reformat/pre_reformat_${src_major_ver}_${template_major_ver}.lua
                if [ -e $pre_reformat ]; then
                    $pre_reformat $src_db_path/$MMXMAINDBNAME $template_db_path/$MMXMAINDBNAME $temp_db_path/$MMXMAINDBNAME
                    reformat_res=$?

                    if [ $reformat_res -ne 0 ]; then
                        log "    perform_reformat: pre_reformat script failed"
                    else
                        log "    perform_reformat: pre_reformat script successfully finished"
                    fi
                else
                    reformat_res=0
                fi
            else
                log "    perform_reformat: failed to clear template db"
                reformat_res=$clear_res
            fi

            if [ $reformat_res -eq 0 ] ; then
            # template DB was cleared sucessfully,
            # DB reformat could  now be performed

                reformat_diff=$template_db_path/../db_reformat/dbdiff_${src_major_ver}_${template_major_ver}.lua
                if [ -e $reformat_diff ]; then
                    $DB_PERFORM_REFRMT $src_db_path/$MMXMAINDBNAME $temp_db_path/$MMXMAINDBNAME $reformat_diff
                    reformat_res=$?
                else
                    log "    perform_reformat: reformat diff was not found: $reformat_diff"
                fi
            fi

            # if reformat was successfull, run post_reformat script if it exists
            if [ $reformat_res -eq 0 ]; then
                post_reformat=$template_db_path/../db_reformat/post_reformat_${src_major_ver}_${template_major_ver}.lua
                if [ -e $post_reformat ]; then
                    $post_reformat $src_db_path/$MMXMAINDBNAME $template_db_path/$MMXMAINDBNAME $temp_db_path/$MMXMAINDBNAME
                    reformat_res=$?

                    if [ $reformat_res -ne 0 ]; then
                        log "    perform_reformat: post_reformat script failed"
                    else
                        log "    perform_reformat: post_reformat script successfully finished"
                    fi
                fi
            fi

            if [ $reformat_res -eq 0 ] ; then
                log "    perform_reformat: DB reformat successfully finished"
                # replace src main DB with reformatted DB and src meta DB with template meta DB

                return "$REFORMAT_SUCCESS"
            else
                log "    perform_reformat: DB reformat failed, saving src DB"

                FAILED_REFORMAT_PATH=/etc/mmx/failed_reformat_db
                FAILED_REFORMAT_DB=$src_db_path/${MMXMAINDBNAME}_$src_ver

                mkdir -p $(dirname $FAILED_REFORMAT_PATH$FAILED_REFORMAT_DB)
                cp $temp_db_path/$MMXMAINDBNAME $FAILED_REFORMAT_PATH$FAILED_REFORMAT_DB
                mmx_update_jffs $FAILED_REFORMAT_PATH$FAILED_REFORMAT_DB

                log "    perform_reformat: src DB saved to $FAILED_REFORMAT_PATH$FAILED_REFORMAT_DB"

                return "$REFORMAT_FAIL"
            fi
        elif [ "$src_ver" != "$template_ver" ] ; then
            # only minor versions of src and template DBs are different,
            # so src meta DB is replaced with template DB, and
            # main DB remains as-is

            # make a copy of src main and template meta DB to temporary DB path:
            cp $src_db_path/$MMXMAINDBNAME $temp_db_path/$MMXMAINDBNAME

            return "$REFORMAT_SUCCESS"
        fi

        log "    perform_reformat: MMX DB reformat is not needed"
        return "$REFORMAT_NOT_NEEDED"
    else
        log "    perform_reformat: No src meta or main DB found"
        return "$REFORMAT_NO_SRC_DB"
    fi
}

# Directory /etc is used by Linux as permanent memory (i.e. those files placed
#  under /etc dir survive power restart of the device.). Usualy /etc was the mounted point
# for jffs2 file system.
# In our latest version /etc may be
#    - mounted as previously on jffs2
#    - or on tmpfs (the new feature "tmp overlay fs")
#  In case the new feature is supported in the image, all permanent saving
#  operations should be performed explicitly by call of tmpovrlctl command.
#   Args:
#     - path to file or directory to be saved in the permanent memory
mmx_update_jffs()
{
    local path=$1

    #echo "We are going to permanently save $path" >> $MMXEP_INIT_LOGFILE

    # use tmpovrlctl if it exists
    if [ -n $(which tmpovrlctl) ] ; then
        tmpovrlctl save -f $path &>/dev/null
    fi
}
