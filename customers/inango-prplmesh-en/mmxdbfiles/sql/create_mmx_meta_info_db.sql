
-- ****************************************
-- MMX service DB table 
-- ****************************************
DROP TABLE IF EXISTS MMX_ServiceInfo; 
CREATE TABLE MMX_ServiceInfo
(
    Name     TEXT,
    Value    TEXT,
    Descr    TEXT,
    PRIMARY KEY(Name)
);
INSERT INTO  MMX_ServiceInfo values('BuildDate', "03/11/2021 5:07:51 AM" ,'Date when this db was generated');
INSERT INTO  MMX_ServiceInfo values('DBVersion', "03.02",'DB version');
INSERT INTO  MMX_ServiceInfo values('DBSubVersion', "000",'DB Sub version'); 
INSERT INTO  MMX_ServiceInfo values ('ResetLastUpdated','0','Flag to reset all last updated time in DB');
INSERT INTO  MMX_ServiceInfo values('DBValueChangeCnt','0','Change counter. Increased after any set operation. 0 in default DB');


-- *************************************************
-- MMX DB table containing backends information 
-- **************************************************
DROP TABLE IF EXISTS MMX_BackendInfo; 
CREATE TABLE MMX_BackendInfo
(
    backendId     INTEGER,
    backendName   TEXT UNIQUE,
    isActive      INTEGER,  -- BOOLEAN: 1 - Active, 0 not-active
    backendType   TEXT,
    installType   TEXT,
    mgmtPort      INTEGER,
    initOrder     INTEGER,
    initScript    TEXT
);


INSERT INTO  MMX_BackendInfo  (backendId, backendName, isActive)  VALUES (2, 'prplmesh_be', 1) ;
-- *************************************************************
-- MMX all management objects meta information  
-- ************************************************************
DROP TABLE IF EXISTS MMX_Objects_InfoTbl; 
CREATE TABLE MMX_Objects_InfoTbl
( 
    ObjName              TEXT UNIQUE NOT NULL,  
    ObjDbStatus          TEXT DEFAULT 'current',  
    Writable             INT, -- BOOLEAN: Shows if the object instance can be created/deleted by user (1) or not (0)
    Configurable         INT, -- BOOLEAN: Shows if the object contains writable parameters
    UserAccessPerm       INT, -- Guest(0), Viewer(1), Config(2), Admin(3)
    ReadFrontEnds        INT, -- access bitmap: 1-WEB, 2-CLI, 4-NETCONF, 8-TR069, 16-SNMP, 0 or NULL - free access
    WriteFrontEnds       INT, -- access bitmap: 1-WEB, 2-CLI, 4-NETCONF, 8-TR069, 16-SNMP, 0 or NULL - free access
    ObjInitOrder         INT,  
    ObjInternalId        INT,  
    PackageName          TEXT,  
    InfoTblName          TEXT,  
    ValuesDBName         TEXT,  
    ValuesTblName        TEXT,  
    BackEndName          TEXT,  
    MinEntNumber         INT,  
    MaxEntNumber         INT,  
    NumOfEntParamName    TEXT,  
    EnableParamName      TEXT,  
    UniKeyParamNames     TEXT, -- Comma-sep list of unique param names
    StyleOfAddObj        TEXT CHECK (StyleOfAddObj IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    AddObjMethod         TEXT,  
    StyleOfDelObj        TEXT CHECK (StyleOfDelObj IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    DelObjMethod         TEXT,  
    StyleOfGet           TEXT CHECK (StyleOfGet IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    GetMethod            TEXT,  
    StyleOfSet           TEXT CHECK (StyleOfSet IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    SetMethod            TEXT,  
    StyleOfGetAll        TEXT CHECK (StyleOfGetAll IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    GetAllMethod         TEXT,  
    AugmentObjects       TEXT, --List of augment objects (those having the same instance numeration)
    ObjDesc              TEXT 
);
  

-- *************************************************************
-- MMX all management objects dependencies meta information  
-- *************************************************************
DROP TABLE IF EXISTS MMX_Objects_Deps_InfoTbl;
CREATE TABLE MMX_Objects_Deps_InfoTbl
(
    ParentObjName        TEXT NOT NULL,
    ChildObjName         TEXT NOT NULL,
    DependencyClass      TEXT CHECK (DependencyClass IN ('autoDelete', 'autoCreate')),
    ParentParamName      TEXT NOT NULL,
    ChildParamName       TEXT NOT NULL
);


-- **************************************************************
-- Meta-information of object Device.Controller.Network.
-- **************************************************************
INSERT INTO MMX_Objects_InfoTbl VALUES( "Device.Controller.Network.", "current", 0, 0, 4, 31, 31, 1, 1, NULL, 
    "Device_Controller_Network_InfoTbl", "mmx_main_db", "Device_Controller_Network_ValuesTbl", 
    "prplmesh_be", NULL, 1, NULL, NULL, NULL, 
    NULL, NULL, 
    NULL, NULL, 
    "script", "prplmesh_get.lua Controller.Network; ", 
    NULL, NULL, 
    NULL, NULL, 
    NULL, NULL );

DROP TABLE IF EXISTS Device_Controller_Network_InfoTbl; 
CREATE TABLE Device_Controller_Network_InfoTbl
( 
    ParamName            TEXT UNIQUE NOT NULL,  
    ParamDbStatus        TEXT DEFAULT 'current',  
    Writable             INT,  --BOOLEAN:  1 - True, 0 - False
    UserAccessPerm       INT, -- Guest(0), Viewer(1), Config(2), Admin(4)
    ReadFrontEnds        INT, -- access bitmap: 1-WEB, 2-CLI, 4-NETCONF, 8-TR069, 16-SNMP, 0 or NULL - free access
    WriteFrontEnds       INT, -- access bitmap: 1-WEB, 2-CLI, 4-NETCONF, 8-TR069, 16-SNMP, 0 or NULL - free access
    ParamType            TEXT,  
    IsIndex              INT,  --BOOLEAN: 1 - True (param is object's index), 0 - False 
    ValueIsList          INT,  --BOOLEAN: 1 - True, 0 - False 
    ParentObject         TEXT,  
    MinValue             TEXT,  
    MaxValue             TEXT,  
    DefValue             TEXT,  
    MinLength            INT,  
    MaxLength            INT,  
    Hidden               INT,  --BOOLEAN:  1 - True, 0 - False 
    NotSaveInDb          INT,  --BOOLEAN:  1 - True, 0 - False 
    ActiveNotify         TEXT,  
    Units                TEXT,  
    EnumValues           TEXT,  
    StyleOfGet           TEXT CHECK (StyleOfGet IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    GetMethod            TEXT,  
    StyleOfSet           TEXT CHECK (StyleOfGet IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    SetMethod            TEXT,  
    ParamDescr           TEXT 
);

INSERT  INTO Device_Controller_Network_InfoTbl VALUES ( "ID", 
    "current", 0, 4, 31, 31, "string", NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_InfoTbl VALUES ( "NumberOfDevices", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_InfoTbl VALUES ( "ControllerID", 
    "current", 0, 4, 31, 31, "string", NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_InfoTbl VALUES ( "TimeStamp", 
    "current", 0, 4, 31, 31, "string", NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_InfoTbl VALUES ( "NumberOfAccessPoints", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_InfoTbl VALUES ('ObjInstSelfRef', 
    'current', 0, 0, 32, 0, 'string', NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

INSERT  INTO Device_Controller_Network_InfoTbl VALUES ('CfgOwner', 
    'current', 0, 0, 32, 0, 'unsignedInt', NULL, 
    NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

INSERT  INTO Device_Controller_Network_InfoTbl VALUES ('CreateOwner', 
    'current', 0, 0, 32, 0, 'unsignedInt', NULL, 
    NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

-- **************************************************************
-- Meta-information of object Device.Controller.Network.AccessPoint.{i}.
-- **************************************************************
INSERT INTO MMX_Objects_InfoTbl VALUES( "Device.Controller.Network.AccessPoint.{i}.", "current", 1, 1, 4, 31, 31, 51, 2, NULL, 
    "Device_Controller_Network_AccessPoint_InfoTbl", "mmx_main_db", "Device_Controller_Network_AccessPoint_ValuesTbl", 
    "prplmesh_be", NULL, NULL, "Device.Controller.Network.NumberOfAccessPoints", NULL, "AccessPointIndex", 
    "script", "prplmesh_add.lua Controller.Network.AccessPoint; ; idx = AccessPointIndex", 
    "script", "prplmesh_del.lua Controller.Network.AccessPoint.$$; AccessPointIndex", 
    "script", "prplmesh_get.lua Controller.Network.AccessPoint.$$; AccessPointIndex", 
    "script", "prplmesh_set.lua Controller.Network.AccessPoint.$$; AccessPointIndex", 
    "script", "prplmesh_getall.lua Controller.Network.AccessPoint.{i}; idx = AccessPointIndex", 
    "Device.Controller.Network.AccessPoint.{i}.Security.", NULL );

DROP TABLE IF EXISTS Device_Controller_Network_AccessPoint_InfoTbl; 
CREATE TABLE Device_Controller_Network_AccessPoint_InfoTbl
( 
    ParamName            TEXT UNIQUE NOT NULL,  
    ParamDbStatus        TEXT DEFAULT 'current',  
    Writable             INT,  --BOOLEAN:  1 - True, 0 - False
    UserAccessPerm       INT, -- Guest(0), Viewer(1), Config(2), Admin(4)
    ReadFrontEnds        INT, -- access bitmap: 1-WEB, 2-CLI, 4-NETCONF, 8-TR069, 16-SNMP, 0 or NULL - free access
    WriteFrontEnds       INT, -- access bitmap: 1-WEB, 2-CLI, 4-NETCONF, 8-TR069, 16-SNMP, 0 or NULL - free access
    ParamType            TEXT,  
    IsIndex              INT,  --BOOLEAN: 1 - True (param is object's index), 0 - False 
    ValueIsList          INT,  --BOOLEAN: 1 - True, 0 - False 
    ParentObject         TEXT,  
    MinValue             TEXT,  
    MaxValue             TEXT,  
    DefValue             TEXT,  
    MinLength            INT,  
    MaxLength            INT,  
    Hidden               INT,  --BOOLEAN:  1 - True, 0 - False 
    NotSaveInDb          INT,  --BOOLEAN:  1 - True, 0 - False 
    ActiveNotify         TEXT,  
    Units                TEXT,  
    EnumValues           TEXT,  
    StyleOfGet           TEXT CHECK (StyleOfGet IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    GetMethod            TEXT,  
    StyleOfSet           TEXT CHECK (StyleOfGet IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    SetMethod            TEXT,  
    ParamDescr           TEXT 
);

INSERT  INTO Device_Controller_Network_AccessPoint_InfoTbl VALUES ('AccessPointIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_AccessPoint_InfoTbl VALUES ( "SSID", 
    "current", 1, 4, 31, 31, "string", NULL, 
    NULL, NULL, NULL, NULL, "prplMesh", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_AccessPoint_InfoTbl VALUES ( "MultiApMode", 
    "current", 1, 4, 31, 31, "string", NULL, 
    NULL, NULL, NULL, NULL, "Fronthaul", NULL, NULL, NULL, NULL, 
    NULL, NULL, "Fronthaul, Backhaul, Fronthaul+Backhaul", 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_AccessPoint_InfoTbl VALUES ( "Band2_4G", 
    "current", 1, 4, 31, 31, "boolean", NULL, 
    NULL, NULL, NULL, NULL, "false", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_AccessPoint_InfoTbl VALUES ( "Band5GL", 
    "current", 1, 4, 31, 31, "boolean", NULL, 
    NULL, NULL, NULL, NULL, "false", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_AccessPoint_InfoTbl VALUES ( "Band5GH", 
    "current", 1, 4, 31, 31, "boolean", NULL, 
    NULL, NULL, NULL, NULL, "false", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_AccessPoint_InfoTbl VALUES ( "Band6G", 
    "current", 1, 4, 31, 31, "boolean", NULL, 
    NULL, NULL, NULL, NULL, "false", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_AccessPoint_InfoTbl VALUES ('ObjInstSelfRef', 
    'current', 0, 0, 32, 0, 'string', NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

INSERT  INTO Device_Controller_Network_AccessPoint_InfoTbl VALUES ('CfgOwner', 
    'current', 0, 0, 32, 0, 'unsignedInt', NULL, 
    NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

INSERT  INTO Device_Controller_Network_AccessPoint_InfoTbl VALUES ('CreateOwner', 
    'current', 0, 0, 32, 0, 'unsignedInt', NULL, 
    NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

-- **************************************************************
-- Meta-information of object Device.Controller.Network.AccessPoint.{i}.Security.
-- **************************************************************
INSERT INTO MMX_Objects_InfoTbl VALUES( "Device.Controller.Network.AccessPoint.{i}.Security.", "current", 0, 1, 4, 31, 31, 52, 3, NULL, 
    "Device_Controller_Network_AccessPoint_Security_InfoTbl", "mmx_main_db", "Device_Controller_Network_AccessPoint_Security_ValuesTbl", 
    "prplmesh_be", NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, 
    NULL, NULL, 
    "script", "prplmesh_get.lua Controller.Network.AccessPoint.$$.Security; Device.Controller.Network.AccessPoint.{i}.AccessPointIndex", 
    "script", "prplmesh_set.lua Controller.Network.AccessPoint.$$.Security; Device.Controller.Network.AccessPoint.{i}.AccessPointIndex", 
    NULL, NULL, 
    NULL, NULL );

DROP TABLE IF EXISTS Device_Controller_Network_AccessPoint_Security_InfoTbl; 
CREATE TABLE Device_Controller_Network_AccessPoint_Security_InfoTbl
( 
    ParamName            TEXT UNIQUE NOT NULL,  
    ParamDbStatus        TEXT DEFAULT 'current',  
    Writable             INT,  --BOOLEAN:  1 - True, 0 - False
    UserAccessPerm       INT, -- Guest(0), Viewer(1), Config(2), Admin(4)
    ReadFrontEnds        INT, -- access bitmap: 1-WEB, 2-CLI, 4-NETCONF, 8-TR069, 16-SNMP, 0 or NULL - free access
    WriteFrontEnds       INT, -- access bitmap: 1-WEB, 2-CLI, 4-NETCONF, 8-TR069, 16-SNMP, 0 or NULL - free access
    ParamType            TEXT,  
    IsIndex              INT,  --BOOLEAN: 1 - True (param is object's index), 0 - False 
    ValueIsList          INT,  --BOOLEAN: 1 - True, 0 - False 
    ParentObject         TEXT,  
    MinValue             TEXT,  
    MaxValue             TEXT,  
    DefValue             TEXT,  
    MinLength            INT,  
    MaxLength            INT,  
    Hidden               INT,  --BOOLEAN:  1 - True, 0 - False 
    NotSaveInDb          INT,  --BOOLEAN:  1 - True, 0 - False 
    ActiveNotify         TEXT,  
    Units                TEXT,  
    EnumValues           TEXT,  
    StyleOfGet           TEXT CHECK (StyleOfGet IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    GetMethod            TEXT,  
    StyleOfSet           TEXT CHECK (StyleOfGet IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    SetMethod            TEXT,  
    ParamDescr           TEXT 
);

INSERT  INTO Device_Controller_Network_AccessPoint_Security_InfoTbl VALUES ('AccessPointIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_AccessPoint_Security_InfoTbl VALUES ( "ModeEnabled", 
    "current", 1, 4, 31, 31, "string", NULL, 
    NULL, NULL, NULL, NULL, "None", NULL, NULL, NULL, NULL, 
    NULL, NULL, "WPA2-Personal, WPA3-Personal, None", 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_AccessPoint_Security_InfoTbl VALUES ( "PreSharedKey", 
    "current", 1, 4, 31, 31, "string", NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_AccessPoint_Security_InfoTbl VALUES ( "KeyPassphrase", 
    "current", 1, 4, 31, 31, "string", NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_AccessPoint_Security_InfoTbl VALUES ( "SAEPassphrase", 
    "current", 1, 4, 31, 31, "string", NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_AccessPoint_Security_InfoTbl VALUES ('ObjInstSelfRef', 
    'current', 0, 0, 32, 0, 'string', NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

INSERT  INTO Device_Controller_Network_AccessPoint_Security_InfoTbl VALUES ('CfgOwner', 
    'current', 0, 0, 32, 0, 'unsignedInt', NULL, 
    NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

INSERT  INTO Device_Controller_Network_AccessPoint_Security_InfoTbl VALUES ('CreateOwner', 
    'current', 0, 0, 32, 0, 'unsignedInt', NULL, 
    NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

-- **************************************************************
-- Meta-information of object Device.Controller.Network.Device.{i}.
-- **************************************************************
INSERT INTO MMX_Objects_InfoTbl VALUES( "Device.Controller.Network.Device.{i}.", "current", 0, 0, 4, 31, 31, 53, 4, NULL, 
    "Device_Controller_Network_Device_InfoTbl", "mmx_main_db", "Device_Controller_Network_Device_ValuesTbl", 
    "prplmesh_be", NULL, NULL, "Device.Controller.Network.NumberOfDevices", NULL, "DeviceIndex", 
    NULL, NULL, 
    NULL, NULL, 
    "script", "prplmesh_get.lua Controller.Network.Device.$$; DeviceIndex", 
    NULL, NULL, 
    "script", "prplmesh_getall.lua Controller.Network.Device.{i}; idx = DeviceIndex", 
    NULL, NULL );

DROP TABLE IF EXISTS Device_Controller_Network_Device_InfoTbl; 
CREATE TABLE Device_Controller_Network_Device_InfoTbl
( 
    ParamName            TEXT UNIQUE NOT NULL,  
    ParamDbStatus        TEXT DEFAULT 'current',  
    Writable             INT,  --BOOLEAN:  1 - True, 0 - False
    UserAccessPerm       INT, -- Guest(0), Viewer(1), Config(2), Admin(4)
    ReadFrontEnds        INT, -- access bitmap: 1-WEB, 2-CLI, 4-NETCONF, 8-TR069, 16-SNMP, 0 or NULL - free access
    WriteFrontEnds       INT, -- access bitmap: 1-WEB, 2-CLI, 4-NETCONF, 8-TR069, 16-SNMP, 0 or NULL - free access
    ParamType            TEXT,  
    IsIndex              INT,  --BOOLEAN: 1 - True (param is object's index), 0 - False 
    ValueIsList          INT,  --BOOLEAN: 1 - True, 0 - False 
    ParentObject         TEXT,  
    MinValue             TEXT,  
    MaxValue             TEXT,  
    DefValue             TEXT,  
    MinLength            INT,  
    MaxLength            INT,  
    Hidden               INT,  --BOOLEAN:  1 - True, 0 - False 
    NotSaveInDb          INT,  --BOOLEAN:  1 - True, 0 - False 
    ActiveNotify         TEXT,  
    Units                TEXT,  
    EnumValues           TEXT,  
    StyleOfGet           TEXT CHECK (StyleOfGet IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    GetMethod            TEXT,  
    StyleOfSet           TEXT CHECK (StyleOfGet IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    SetMethod            TEXT,  
    ParamDescr           TEXT 
);

INSERT  INTO Device_Controller_Network_Device_InfoTbl VALUES ('DeviceIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_InfoTbl VALUES ( "ID", 
    "current", 0, 4, 31, 31, "string", NULL, 
    NULL, NULL, NULL, NULL, "00:00:00:00:00:00", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_InfoTbl VALUES ( "CollectionInterval", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_InfoTbl VALUES ( "NumberOfRadios", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_InfoTbl VALUES ( "NumberOfInterfaces", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_InfoTbl VALUES ('ObjInstSelfRef', 
    'current', 0, 0, 32, 0, 'string', NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

INSERT  INTO Device_Controller_Network_Device_InfoTbl VALUES ('CfgOwner', 
    'current', 0, 0, 32, 0, 'unsignedInt', NULL, 
    NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

INSERT  INTO Device_Controller_Network_Device_InfoTbl VALUES ('CreateOwner', 
    'current', 0, 0, 32, 0, 'unsignedInt', NULL, 
    NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

-- **************************************************************
-- Meta-information of object Device.Controller.Network.Device.{i}.Interface.{i}.
-- **************************************************************
INSERT INTO MMX_Objects_InfoTbl VALUES( "Device.Controller.Network.Device.{i}.Interface.{i}.", "current", 0, 0, 4, 31, 31, 54, 5, NULL, 
    "Device_Controller_Network_Device_Interface_InfoTbl", "mmx_main_db", "Device_Controller_Network_Device_Interface_ValuesTbl", 
    "prplmesh_be", NULL, NULL, "Device.Controller.Network.Device.{i}.NumberOfInterfaces", NULL, "InterfaceIndex", 
    NULL, NULL, 
    NULL, NULL, 
    "script", "prplmesh_get.lua Controller.Network.Device.$$.Interface.$$; Device.Controller.Network.Device.{i}.DeviceIndex, InterfaceIndex", 
    NULL, NULL, 
    "script", "prplmesh_getall.lua Controller.Network.Device.{i}.Interface.{i}; idx1 = Device.Controller.Network.Device.{i}.DeviceIndex, idx2 = InterfaceIndex", 
    "Device.Controller.Network.Device.{i}.Interface.{i}.Stats.", NULL );

DROP TABLE IF EXISTS Device_Controller_Network_Device_Interface_InfoTbl; 
CREATE TABLE Device_Controller_Network_Device_Interface_InfoTbl
( 
    ParamName            TEXT UNIQUE NOT NULL,  
    ParamDbStatus        TEXT DEFAULT 'current',  
    Writable             INT,  --BOOLEAN:  1 - True, 0 - False
    UserAccessPerm       INT, -- Guest(0), Viewer(1), Config(2), Admin(4)
    ReadFrontEnds        INT, -- access bitmap: 1-WEB, 2-CLI, 4-NETCONF, 8-TR069, 16-SNMP, 0 or NULL - free access
    WriteFrontEnds       INT, -- access bitmap: 1-WEB, 2-CLI, 4-NETCONF, 8-TR069, 16-SNMP, 0 or NULL - free access
    ParamType            TEXT,  
    IsIndex              INT,  --BOOLEAN: 1 - True (param is object's index), 0 - False 
    ValueIsList          INT,  --BOOLEAN: 1 - True, 0 - False 
    ParentObject         TEXT,  
    MinValue             TEXT,  
    MaxValue             TEXT,  
    DefValue             TEXT,  
    MinLength            INT,  
    MaxLength            INT,  
    Hidden               INT,  --BOOLEAN:  1 - True, 0 - False 
    NotSaveInDb          INT,  --BOOLEAN:  1 - True, 0 - False 
    ActiveNotify         TEXT,  
    Units                TEXT,  
    EnumValues           TEXT,  
    StyleOfGet           TEXT CHECK (StyleOfGet IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    GetMethod            TEXT,  
    StyleOfSet           TEXT CHECK (StyleOfGet IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    SetMethod            TEXT,  
    ParamDescr           TEXT 
);

INSERT  INTO Device_Controller_Network_Device_Interface_InfoTbl VALUES ('DeviceIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Interface_InfoTbl VALUES ('InterfaceIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Interface_InfoTbl VALUES ( "NumberOfNeighbors", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Interface_InfoTbl VALUES ( "Status", 
    "current", 0, 4, 31, 31, "string", NULL, 
    NULL, NULL, NULL, NULL, "Down", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Interface_InfoTbl VALUES ( "MACAddress", 
    "current", 0, 4, 31, 31, "string", NULL, 
    NULL, NULL, NULL, NULL, "00:00:00:00:00:00", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Interface_InfoTbl VALUES ( "Name", 
    "current", 0, 4, 31, 31, "string", NULL, 
    NULL, NULL, NULL, NULL, "NoName", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Interface_InfoTbl VALUES ( "MediaType", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Interface_InfoTbl VALUES ('ObjInstSelfRef', 
    'current', 0, 0, 32, 0, 'string', NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

INSERT  INTO Device_Controller_Network_Device_Interface_InfoTbl VALUES ('CfgOwner', 
    'current', 0, 0, 32, 0, 'unsignedInt', NULL, 
    NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

INSERT  INTO Device_Controller_Network_Device_Interface_InfoTbl VALUES ('CreateOwner', 
    'current', 0, 0, 32, 0, 'unsignedInt', NULL, 
    NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

-- **************************************************************
-- Meta-information of object Device.Controller.Network.Device.{i}.Interface.{i}.Stats.
-- **************************************************************
INSERT INTO MMX_Objects_InfoTbl VALUES( "Device.Controller.Network.Device.{i}.Interface.{i}.Stats.", "current", 0, 0, 4, 31, 31, 55, 6, NULL, 
    "Device_Controller_Network_Device_Interface_Stats_InfoTbl", "mmx_main_db", "Device_Controller_Network_Device_Interface_Stats_ValuesTbl", 
    "prplmesh_be", NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, 
    NULL, NULL, 
    "script", "prplmesh_get.lua Controller.Network.Device.$$.Interface.$$.Stats; Device.Controller.Network.Device.{i}.DeviceIndex, Device.Controller.Network.Device.{i}.Interface.{i}.InterfaceIndex", 
    NULL, NULL, 
    NULL, NULL, 
    NULL, NULL );

DROP TABLE IF EXISTS Device_Controller_Network_Device_Interface_Stats_InfoTbl; 
CREATE TABLE Device_Controller_Network_Device_Interface_Stats_InfoTbl
( 
    ParamName            TEXT UNIQUE NOT NULL,  
    ParamDbStatus        TEXT DEFAULT 'current',  
    Writable             INT,  --BOOLEAN:  1 - True, 0 - False
    UserAccessPerm       INT, -- Guest(0), Viewer(1), Config(2), Admin(4)
    ReadFrontEnds        INT, -- access bitmap: 1-WEB, 2-CLI, 4-NETCONF, 8-TR069, 16-SNMP, 0 or NULL - free access
    WriteFrontEnds       INT, -- access bitmap: 1-WEB, 2-CLI, 4-NETCONF, 8-TR069, 16-SNMP, 0 or NULL - free access
    ParamType            TEXT,  
    IsIndex              INT,  --BOOLEAN: 1 - True (param is object's index), 0 - False 
    ValueIsList          INT,  --BOOLEAN: 1 - True, 0 - False 
    ParentObject         TEXT,  
    MinValue             TEXT,  
    MaxValue             TEXT,  
    DefValue             TEXT,  
    MinLength            INT,  
    MaxLength            INT,  
    Hidden               INT,  --BOOLEAN:  1 - True, 0 - False 
    NotSaveInDb          INT,  --BOOLEAN:  1 - True, 0 - False 
    ActiveNotify         TEXT,  
    Units                TEXT,  
    EnumValues           TEXT,  
    StyleOfGet           TEXT CHECK (StyleOfGet IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    GetMethod            TEXT,  
    StyleOfSet           TEXT CHECK (StyleOfGet IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    SetMethod            TEXT,  
    ParamDescr           TEXT 
);

INSERT  INTO Device_Controller_Network_Device_Interface_Stats_InfoTbl VALUES ('DeviceIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Interface_Stats_InfoTbl VALUES ('InterfaceIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Interface_Stats_InfoTbl VALUES ( "BytesSent", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Interface_Stats_InfoTbl VALUES ( "BytesReceived", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Interface_Stats_InfoTbl VALUES ( "PacketsSent", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Interface_Stats_InfoTbl VALUES ( "PacketsReceived", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Interface_Stats_InfoTbl VALUES ( "ErrorsSent", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Interface_Stats_InfoTbl VALUES ( "ErrorsReceived", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Interface_Stats_InfoTbl VALUES ( "UnicastPacketsSent", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Interface_Stats_InfoTbl VALUES ( "UnicastPacketsReceived", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Interface_Stats_InfoTbl VALUES ( "DiscardPacketsSent", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Interface_Stats_InfoTbl VALUES ( "DiscardPacketsReceived", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Interface_Stats_InfoTbl VALUES ( "MulticastPacketsSent", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Interface_Stats_InfoTbl VALUES ( "MulticastPacketsReceived", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Interface_Stats_InfoTbl VALUES ( "BroadcastPacketsSent", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Interface_Stats_InfoTbl VALUES ( "BroadcastPacketsReceived", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Interface_Stats_InfoTbl VALUES ('ObjInstSelfRef', 
    'current', 0, 0, 32, 0, 'string', NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

INSERT  INTO Device_Controller_Network_Device_Interface_Stats_InfoTbl VALUES ('CfgOwner', 
    'current', 0, 0, 32, 0, 'unsignedInt', NULL, 
    NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

INSERT  INTO Device_Controller_Network_Device_Interface_Stats_InfoTbl VALUES ('CreateOwner', 
    'current', 0, 0, 32, 0, 'unsignedInt', NULL, 
    NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

-- **************************************************************
-- Meta-information of object Device.Controller.Network.Device.{i}.Interface.{i}.Neighbor.{i}.
-- **************************************************************
INSERT INTO MMX_Objects_InfoTbl VALUES( "Device.Controller.Network.Device.{i}.Interface.{i}.Neighbor.{i}.", "current", 0, 0, 4, 31, 31, 56, 7, NULL, 
    "Device_Controller_Network_Device_Interface_Neighbor_InfoTbl", "mmx_main_db", "Device_Controller_Network_Device_Interface_Neighbor_ValuesTbl", 
    "prplmesh_be", NULL, NULL, "Device.Controller.Network.Device.{i}.Interface.{i}.NumberOfNeighbors", NULL, "NeighborIndex", 
    NULL, NULL, 
    NULL, NULL, 
    "script", "prplmesh_get.lua Controller.Network.Device.$$.Interface.$$.Neighbor.$$; Device.Controller.Network.Device.{i}.DeviceIndex, Device.Controller.Network.Device.{i}.Interface.{i}.InterfaceIndex, NeighborIndex", 
    NULL, NULL, 
    "script", "prplmesh_getall.lua Controller.Network.Device.{i}.Interface.{i}.Neighbor.{i}; idx1 = Device.Controller.Network.Device.{i}.DeviceIndex, idx2 = InterfaceIndex, idx3 = NeighborIndex", 
    NULL, NULL );

DROP TABLE IF EXISTS Device_Controller_Network_Device_Interface_Neighbor_InfoTbl; 
CREATE TABLE Device_Controller_Network_Device_Interface_Neighbor_InfoTbl
( 
    ParamName            TEXT UNIQUE NOT NULL,  
    ParamDbStatus        TEXT DEFAULT 'current',  
    Writable             INT,  --BOOLEAN:  1 - True, 0 - False
    UserAccessPerm       INT, -- Guest(0), Viewer(1), Config(2), Admin(4)
    ReadFrontEnds        INT, -- access bitmap: 1-WEB, 2-CLI, 4-NETCONF, 8-TR069, 16-SNMP, 0 or NULL - free access
    WriteFrontEnds       INT, -- access bitmap: 1-WEB, 2-CLI, 4-NETCONF, 8-TR069, 16-SNMP, 0 or NULL - free access
    ParamType            TEXT,  
    IsIndex              INT,  --BOOLEAN: 1 - True (param is object's index), 0 - False 
    ValueIsList          INT,  --BOOLEAN: 1 - True, 0 - False 
    ParentObject         TEXT,  
    MinValue             TEXT,  
    MaxValue             TEXT,  
    DefValue             TEXT,  
    MinLength            INT,  
    MaxLength            INT,  
    Hidden               INT,  --BOOLEAN:  1 - True, 0 - False 
    NotSaveInDb          INT,  --BOOLEAN:  1 - True, 0 - False 
    ActiveNotify         TEXT,  
    Units                TEXT,  
    EnumValues           TEXT,  
    StyleOfGet           TEXT CHECK (StyleOfGet IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    GetMethod            TEXT,  
    StyleOfSet           TEXT CHECK (StyleOfGet IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    SetMethod            TEXT,  
    ParamDescr           TEXT 
);

INSERT  INTO Device_Controller_Network_Device_Interface_Neighbor_InfoTbl VALUES ('DeviceIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Interface_Neighbor_InfoTbl VALUES ('InterfaceIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Interface_Neighbor_InfoTbl VALUES ('NeighborIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Interface_Neighbor_InfoTbl VALUES ( "ID", 
    "current", 0, 4, 31, 31, "string", NULL, 
    NULL, NULL, NULL, NULL, "00:00:00:00:00:00", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Interface_Neighbor_InfoTbl VALUES ( "IsIEEE1905", 
    "current", 0, 4, 31, 31, "boolean", NULL, 
    NULL, NULL, NULL, NULL, "false", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Interface_Neighbor_InfoTbl VALUES ( "NumberOfNeighbors", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Interface_Neighbor_InfoTbl VALUES ('ObjInstSelfRef', 
    'current', 0, 0, 32, 0, 'string', NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

INSERT  INTO Device_Controller_Network_Device_Interface_Neighbor_InfoTbl VALUES ('CfgOwner', 
    'current', 0, 0, 32, 0, 'unsignedInt', NULL, 
    NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

INSERT  INTO Device_Controller_Network_Device_Interface_Neighbor_InfoTbl VALUES ('CreateOwner', 
    'current', 0, 0, 32, 0, 'unsignedInt', NULL, 
    NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

-- **************************************************************
-- Meta-information of object Device.Controller.Network.Device.{i}.Radio.{i}.
-- **************************************************************
INSERT INTO MMX_Objects_InfoTbl VALUES( "Device.Controller.Network.Device.{i}.Radio.{i}.", "current", 0, 0, 4, 31, 31, 58, 8, NULL, 
    "Device_Controller_Network_Device_Radio_InfoTbl", "mmx_main_db", "Device_Controller_Network_Device_Radio_ValuesTbl", 
    "prplmesh_be", NULL, NULL, "Device.Controller.Network.Device.{i}.NumberOfRadios", NULL, "RadioIndex", 
    NULL, NULL, 
    NULL, NULL, 
    "script", "prplmesh_get.lua Controller.Network.Device.$$.Radio.$$; Device.Controller.Network.Device.{i}.DeviceIndex, RadioIndex", 
    NULL, NULL, 
    "script", "prplmesh_getall.lua Controller.Network.Device.{i}.Radio.{i}; idx1 = Device.Controller.Network.Device.{i}.DeviceIndex, idx2 = RadioIndex", 
    "Device.Controller.Network.Device.{i}.Radio.{i}.Capabilities.", NULL );

DROP TABLE IF EXISTS Device_Controller_Network_Device_Radio_InfoTbl; 
CREATE TABLE Device_Controller_Network_Device_Radio_InfoTbl
( 
    ParamName            TEXT UNIQUE NOT NULL,  
    ParamDbStatus        TEXT DEFAULT 'current',  
    Writable             INT,  --BOOLEAN:  1 - True, 0 - False
    UserAccessPerm       INT, -- Guest(0), Viewer(1), Config(2), Admin(4)
    ReadFrontEnds        INT, -- access bitmap: 1-WEB, 2-CLI, 4-NETCONF, 8-TR069, 16-SNMP, 0 or NULL - free access
    WriteFrontEnds       INT, -- access bitmap: 1-WEB, 2-CLI, 4-NETCONF, 8-TR069, 16-SNMP, 0 or NULL - free access
    ParamType            TEXT,  
    IsIndex              INT,  --BOOLEAN: 1 - True (param is object's index), 0 - False 
    ValueIsList          INT,  --BOOLEAN: 1 - True, 0 - False 
    ParentObject         TEXT,  
    MinValue             TEXT,  
    MaxValue             TEXT,  
    DefValue             TEXT,  
    MinLength            INT,  
    MaxLength            INT,  
    Hidden               INT,  --BOOLEAN:  1 - True, 0 - False 
    NotSaveInDb          INT,  --BOOLEAN:  1 - True, 0 - False 
    ActiveNotify         TEXT,  
    Units                TEXT,  
    EnumValues           TEXT,  
    StyleOfGet           TEXT CHECK (StyleOfGet IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    GetMethod            TEXT,  
    StyleOfSet           TEXT CHECK (StyleOfGet IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    SetMethod            TEXT,  
    ParamDescr           TEXT 
);

INSERT  INTO Device_Controller_Network_Device_Radio_InfoTbl VALUES ('DeviceIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Radio_InfoTbl VALUES ('RadioIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Radio_InfoTbl VALUES ( "ID", 
    "current", 0, 4, 31, 31, "string", NULL, 
    NULL, NULL, NULL, NULL, "00:00:00:00:00:00", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_InfoTbl VALUES ( "Enabled", 
    "current", 0, 4, 31, 31, "boolean", NULL, 
    NULL, NULL, NULL, NULL, "false", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_InfoTbl VALUES ( "Noise", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_InfoTbl VALUES ( "Utilization", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_InfoTbl VALUES ( "Transmit", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_InfoTbl VALUES ( "ReceiveSelf", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_InfoTbl VALUES ( "ReceiveOther", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_InfoTbl VALUES ( "NumberOfCurrOpClass", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_InfoTbl VALUES ( "NumberOfBSS", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_InfoTbl VALUES ( "NumberOfUnassocSTA", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_InfoTbl VALUES ( "NumberOfOpClassScan", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_InfoTbl VALUES ('ObjInstSelfRef', 
    'current', 0, 0, 32, 0, 'string', NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

INSERT  INTO Device_Controller_Network_Device_Radio_InfoTbl VALUES ('CfgOwner', 
    'current', 0, 0, 32, 0, 'unsignedInt', NULL, 
    NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

INSERT  INTO Device_Controller_Network_Device_Radio_InfoTbl VALUES ('CreateOwner', 
    'current', 0, 0, 32, 0, 'unsignedInt', NULL, 
    NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

-- **************************************************************
-- Meta-information of object Device.Controller.Network.Device.{i}.Radio.{i}.CurrentOperatingClasses.{i}.
-- **************************************************************
INSERT INTO MMX_Objects_InfoTbl VALUES( "Device.Controller.Network.Device.{i}.Radio.{i}.CurrentOperatingClasses.{i}.", "current", 0, 0, 4, 31, 31, 59, 9, NULL, 
    "Device_Controller_Network_Device_Radio_CurrentOperatingClasses_InfoTbl", "mmx_main_db", "Device_Controller_Network_Device_Radio_CurrentOperatingClasses_ValuesTbl", 
    "prplmesh_be", NULL, NULL, "Device.Controller.Network.Device.{i}.Radio.{i}.NumberOfCurrOpClass", NULL, "CurrentOperatingClassesIndex", 
    NULL, NULL, 
    NULL, NULL, 
    "script", "prplmesh_get.lua Controller.Network.Device.$$.Radio.$$.CurrentOperatingClasses.$$; Device.Controller.Network.Device.{i}.DeviceIndex, Device.Controller.Network.Device.{i}.Radio.{i}.RadioIndex, CurrentOperatingClassesIndex", 
    NULL, NULL, 
    "script", "prplmesh_getall.lua Controller.Network.Device.{i}.Radio.{i}.CurrentOperatingClasses.{i}; idx1 = Device.Controller.Network.Device.{i}.DeviceIndex, idx2 = Device.Controller.Network.Device.{i}.Radio.{i}.RadioIndex, idx3 = CurrentOperatingClassesIndex", 
    NULL, NULL );

DROP TABLE IF EXISTS Device_Controller_Network_Device_Radio_CurrentOperatingClasses_InfoTbl; 
CREATE TABLE Device_Controller_Network_Device_Radio_CurrentOperatingClasses_InfoTbl
( 
    ParamName            TEXT UNIQUE NOT NULL,  
    ParamDbStatus        TEXT DEFAULT 'current',  
    Writable             INT,  --BOOLEAN:  1 - True, 0 - False
    UserAccessPerm       INT, -- Guest(0), Viewer(1), Config(2), Admin(4)
    ReadFrontEnds        INT, -- access bitmap: 1-WEB, 2-CLI, 4-NETCONF, 8-TR069, 16-SNMP, 0 or NULL - free access
    WriteFrontEnds       INT, -- access bitmap: 1-WEB, 2-CLI, 4-NETCONF, 8-TR069, 16-SNMP, 0 or NULL - free access
    ParamType            TEXT,  
    IsIndex              INT,  --BOOLEAN: 1 - True (param is object's index), 0 - False 
    ValueIsList          INT,  --BOOLEAN: 1 - True, 0 - False 
    ParentObject         TEXT,  
    MinValue             TEXT,  
    MaxValue             TEXT,  
    DefValue             TEXT,  
    MinLength            INT,  
    MaxLength            INT,  
    Hidden               INT,  --BOOLEAN:  1 - True, 0 - False 
    NotSaveInDb          INT,  --BOOLEAN:  1 - True, 0 - False 
    ActiveNotify         TEXT,  
    Units                TEXT,  
    EnumValues           TEXT,  
    StyleOfGet           TEXT CHECK (StyleOfGet IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    GetMethod            TEXT,  
    StyleOfSet           TEXT CHECK (StyleOfGet IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    SetMethod            TEXT,  
    ParamDescr           TEXT 
);

INSERT  INTO Device_Controller_Network_Device_Radio_CurrentOperatingClasses_InfoTbl VALUES ('DeviceIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Radio_CurrentOperatingClasses_InfoTbl VALUES ('RadioIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Radio_CurrentOperatingClasses_InfoTbl VALUES ('CurrentOperatingClassesIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Radio_CurrentOperatingClasses_InfoTbl VALUES ( "TimeStamp", 
    "current", 0, 4, 31, 31, "string", NULL, 
    NULL, NULL, NULL, NULL, "2020-08-31T11:22:39Z", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_CurrentOperatingClasses_InfoTbl VALUES ( "Class", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_CurrentOperatingClasses_InfoTbl VALUES ( "Channel", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_CurrentOperatingClasses_InfoTbl VALUES ( "TxPower", 
    "current", 0, 4, 31, 31, "integer", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_CurrentOperatingClasses_InfoTbl VALUES ('ObjInstSelfRef', 
    'current', 0, 0, 32, 0, 'string', NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

INSERT  INTO Device_Controller_Network_Device_Radio_CurrentOperatingClasses_InfoTbl VALUES ('CfgOwner', 
    'current', 0, 0, 32, 0, 'unsignedInt', NULL, 
    NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

INSERT  INTO Device_Controller_Network_Device_Radio_CurrentOperatingClasses_InfoTbl VALUES ('CreateOwner', 
    'current', 0, 0, 32, 0, 'unsignedInt', NULL, 
    NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

-- **************************************************************
-- Meta-information of object Device.Controller.Network.Device.{i}.Radio.{i}.Capabilities.
-- **************************************************************
INSERT INTO MMX_Objects_InfoTbl VALUES( "Device.Controller.Network.Device.{i}.Radio.{i}.Capabilities.", "current", 0, 0, 4, 31, 31, 60, 10, NULL, 
    "Device_Controller_Network_Device_Radio_Capabilities_InfoTbl", "mmx_main_db", "Device_Controller_Network_Device_Radio_Capabilities_ValuesTbl", 
    "prplmesh_be", NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, 
    NULL, NULL, 
    "script", "prplmesh_get.lua Controller.Network.Device.$$.Radio.$$.Capabilities; Device.Controller.Network.Device.{i}.DeviceIndex, Device.Controller.Network.Device.{i}.Radio.{i}.RadioIndex", 
    NULL, NULL, 
    NULL, NULL, 
    NULL, NULL );

DROP TABLE IF EXISTS Device_Controller_Network_Device_Radio_Capabilities_InfoTbl; 
CREATE TABLE Device_Controller_Network_Device_Radio_Capabilities_InfoTbl
( 
    ParamName            TEXT UNIQUE NOT NULL,  
    ParamDbStatus        TEXT DEFAULT 'current',  
    Writable             INT,  --BOOLEAN:  1 - True, 0 - False
    UserAccessPerm       INT, -- Guest(0), Viewer(1), Config(2), Admin(4)
    ReadFrontEnds        INT, -- access bitmap: 1-WEB, 2-CLI, 4-NETCONF, 8-TR069, 16-SNMP, 0 or NULL - free access
    WriteFrontEnds       INT, -- access bitmap: 1-WEB, 2-CLI, 4-NETCONF, 8-TR069, 16-SNMP, 0 or NULL - free access
    ParamType            TEXT,  
    IsIndex              INT,  --BOOLEAN: 1 - True (param is object's index), 0 - False 
    ValueIsList          INT,  --BOOLEAN: 1 - True, 0 - False 
    ParentObject         TEXT,  
    MinValue             TEXT,  
    MaxValue             TEXT,  
    DefValue             TEXT,  
    MinLength            INT,  
    MaxLength            INT,  
    Hidden               INT,  --BOOLEAN:  1 - True, 0 - False 
    NotSaveInDb          INT,  --BOOLEAN:  1 - True, 0 - False 
    ActiveNotify         TEXT,  
    Units                TEXT,  
    EnumValues           TEXT,  
    StyleOfGet           TEXT CHECK (StyleOfGet IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    GetMethod            TEXT,  
    StyleOfSet           TEXT CHECK (StyleOfGet IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    SetMethod            TEXT,  
    ParamDescr           TEXT 
);

INSERT  INTO Device_Controller_Network_Device_Radio_Capabilities_InfoTbl VALUES ('DeviceIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Radio_Capabilities_InfoTbl VALUES ('RadioIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Radio_Capabilities_InfoTbl VALUES ( "NumberOfOperatingClasses", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_Capabilities_InfoTbl VALUES ('ObjInstSelfRef', 
    'current', 0, 0, 32, 0, 'string', NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

INSERT  INTO Device_Controller_Network_Device_Radio_Capabilities_InfoTbl VALUES ('CfgOwner', 
    'current', 0, 0, 32, 0, 'unsignedInt', NULL, 
    NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

INSERT  INTO Device_Controller_Network_Device_Radio_Capabilities_InfoTbl VALUES ('CreateOwner', 
    'current', 0, 0, 32, 0, 'unsignedInt', NULL, 
    NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

-- **************************************************************
-- Meta-information of object Device.Controller.Network.Device.{i}.Radio.{i}.Capabilities.OperatingClass.{i}.
-- **************************************************************
INSERT INTO MMX_Objects_InfoTbl VALUES( "Device.Controller.Network.Device.{i}.Radio.{i}.Capabilities.OperatingClass.{i}.", "current", 0, 0, 4, 31, 31, 61, 11, NULL, 
    "Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_InfoTbl", "mmx_main_db", "Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_ValuesTbl", 
    "prplmesh_be", NULL, NULL, "Device.Controller.Network.Device.{i}.Radio.{i}.Capabilities.NumberOfOperatingClasses", NULL, "OperatingClassIndex", 
    NULL, NULL, 
    NULL, NULL, 
    "script", "prplmesh_get.lua Controller.Network.Device.$$.Radio.$$.Capabilities.OperatingClass.$$; Device.Controller.Network.Device.{i}.DeviceIndex, Device.Controller.Network.Device.{i}.Radio.{i}.RadioIndex, OperatingClassIndex", 
    NULL, NULL, 
    "script", "prplmesh_getall.lua Controller.Network.Device.{i}.Radio.{i}.Capabilities.OperatingClass.{i}; idx1 = Device.Controller.Network.Device.{i}.DeviceIndex, idx2 = Device.Controller.Network.Device.{i}.Radio.{i}.RadioIndex, idx3 = OperatingClassIndex", 
    "Device.Controller.Network.Device.{i}.Radio.{i}.Capabilities.OperatingClass.{i}.NonOperable.", NULL );

DROP TABLE IF EXISTS Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_InfoTbl; 
CREATE TABLE Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_InfoTbl
( 
    ParamName            TEXT UNIQUE NOT NULL,  
    ParamDbStatus        TEXT DEFAULT 'current',  
    Writable             INT,  --BOOLEAN:  1 - True, 0 - False
    UserAccessPerm       INT, -- Guest(0), Viewer(1), Config(2), Admin(4)
    ReadFrontEnds        INT, -- access bitmap: 1-WEB, 2-CLI, 4-NETCONF, 8-TR069, 16-SNMP, 0 or NULL - free access
    WriteFrontEnds       INT, -- access bitmap: 1-WEB, 2-CLI, 4-NETCONF, 8-TR069, 16-SNMP, 0 or NULL - free access
    ParamType            TEXT,  
    IsIndex              INT,  --BOOLEAN: 1 - True (param is object's index), 0 - False 
    ValueIsList          INT,  --BOOLEAN: 1 - True, 0 - False 
    ParentObject         TEXT,  
    MinValue             TEXT,  
    MaxValue             TEXT,  
    DefValue             TEXT,  
    MinLength            INT,  
    MaxLength            INT,  
    Hidden               INT,  --BOOLEAN:  1 - True, 0 - False 
    NotSaveInDb          INT,  --BOOLEAN:  1 - True, 0 - False 
    ActiveNotify         TEXT,  
    Units                TEXT,  
    EnumValues           TEXT,  
    StyleOfGet           TEXT CHECK (StyleOfGet IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    GetMethod            TEXT,  
    StyleOfSet           TEXT CHECK (StyleOfGet IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    SetMethod            TEXT,  
    ParamDescr           TEXT 
);

INSERT  INTO Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_InfoTbl VALUES ('DeviceIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_InfoTbl VALUES ('RadioIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_InfoTbl VALUES ('OperatingClassIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_InfoTbl VALUES ( "Class", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_InfoTbl VALUES ( "MaxTxPower", 
    "current", 0, 4, 31, 31, "integer", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_InfoTbl VALUES ('ObjInstSelfRef', 
    'current', 0, 0, 32, 0, 'string', NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

INSERT  INTO Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_InfoTbl VALUES ('CfgOwner', 
    'current', 0, 0, 32, 0, 'unsignedInt', NULL, 
    NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

INSERT  INTO Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_InfoTbl VALUES ('CreateOwner', 
    'current', 0, 0, 32, 0, 'unsignedInt', NULL, 
    NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

-- **************************************************************
-- Meta-information of object Device.Controller.Network.Device.{i}.Radio.{i}.Capabilities.OperatingClass.{i}.NonOperable.
-- **************************************************************
INSERT INTO MMX_Objects_InfoTbl VALUES( "Device.Controller.Network.Device.{i}.Radio.{i}.Capabilities.OperatingClass.{i}.NonOperable.", "current", 0, 0, 4, 31, 31, 62, 12, NULL, 
    "Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_NonOperable_InfoTbl", "mmx_main_db", "Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_NonOperable_ValuesTbl", 
    "prplmesh_be", NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, 
    NULL, NULL, 
    "script", "prplmesh_get.lua Controller.Network.Device.$$.Radio.$$.Capabilities.OperatingClass.$$.NonOperable; Device.Controller.Network.Device.{i}.DeviceIndex, Device.Controller.Network.Device.{i}.Radio.{i}.RadioIndex, Device.Controller.Network.Device.{i}.Radio.{i}.Capabilities.OperatingClass.{i}.OperatingClassIndex", 
    NULL, NULL, 
    NULL, NULL, 
    NULL, NULL );

DROP TABLE IF EXISTS Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_NonOperable_InfoTbl; 
CREATE TABLE Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_NonOperable_InfoTbl
( 
    ParamName            TEXT UNIQUE NOT NULL,  
    ParamDbStatus        TEXT DEFAULT 'current',  
    Writable             INT,  --BOOLEAN:  1 - True, 0 - False
    UserAccessPerm       INT, -- Guest(0), Viewer(1), Config(2), Admin(4)
    ReadFrontEnds        INT, -- access bitmap: 1-WEB, 2-CLI, 4-NETCONF, 8-TR069, 16-SNMP, 0 or NULL - free access
    WriteFrontEnds       INT, -- access bitmap: 1-WEB, 2-CLI, 4-NETCONF, 8-TR069, 16-SNMP, 0 or NULL - free access
    ParamType            TEXT,  
    IsIndex              INT,  --BOOLEAN: 1 - True (param is object's index), 0 - False 
    ValueIsList          INT,  --BOOLEAN: 1 - True, 0 - False 
    ParentObject         TEXT,  
    MinValue             TEXT,  
    MaxValue             TEXT,  
    DefValue             TEXT,  
    MinLength            INT,  
    MaxLength            INT,  
    Hidden               INT,  --BOOLEAN:  1 - True, 0 - False 
    NotSaveInDb          INT,  --BOOLEAN:  1 - True, 0 - False 
    ActiveNotify         TEXT,  
    Units                TEXT,  
    EnumValues           TEXT,  
    StyleOfGet           TEXT CHECK (StyleOfGet IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    GetMethod            TEXT,  
    StyleOfSet           TEXT CHECK (StyleOfGet IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    SetMethod            TEXT,  
    ParamDescr           TEXT 
);

INSERT  INTO Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_NonOperable_InfoTbl VALUES ('DeviceIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_NonOperable_InfoTbl VALUES ('RadioIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_NonOperable_InfoTbl VALUES ('OperatingClassIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_NonOperable_InfoTbl VALUES ( "NonOpChannelNumber", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_NonOperable_InfoTbl VALUES ('ObjInstSelfRef', 
    'current', 0, 0, 32, 0, 'string', NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

INSERT  INTO Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_NonOperable_InfoTbl VALUES ('CfgOwner', 
    'current', 0, 0, 32, 0, 'unsignedInt', NULL, 
    NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

INSERT  INTO Device_Controller_Network_Device_Radio_Capabilities_OperatingClass_NonOperable_InfoTbl VALUES ('CreateOwner', 
    'current', 0, 0, 32, 0, 'unsignedInt', NULL, 
    NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

-- **************************************************************
-- Meta-information of object Device.Controller.Network.Device.{i}.Radio.{i}.BSS.{i}.
-- **************************************************************
INSERT INTO MMX_Objects_InfoTbl VALUES( "Device.Controller.Network.Device.{i}.Radio.{i}.BSS.{i}.", "current", 0, 0, 4, 31, 31, 63, 13, NULL, 
    "Device_Controller_Network_Device_Radio_BSS_InfoTbl", "mmx_main_db", "Device_Controller_Network_Device_Radio_BSS_ValuesTbl", 
    "prplmesh_be", NULL, NULL, "Device.Controller.Network.Device.{i}.Radio.{i}.NumberOfBSS", NULL, "BSSIndex", 
    NULL, NULL, 
    NULL, NULL, 
    "script", "prplmesh_get.lua Controller.Network.Device.$$.Radio.$$.BSS.$$; Device.Controller.Network.Device.{i}.DeviceIndex, Device.Controller.Network.Device.{i}.Radio.{i}.RadioIndex, BSSIndex", 
    NULL, NULL, 
    "script", "prplmesh_getall.lua Controller.Network.Device.{i}.Radio.{i}.BSS.{i}; idx1 = Device.Controller.Network.Device.{i}.DeviceIndex, idx2 = Device.Controller.Network.Device.{i}.Radio.{i}.RadioIndex, idx3 = BSSIndex", 
    NULL, NULL );

DROP TABLE IF EXISTS Device_Controller_Network_Device_Radio_BSS_InfoTbl; 
CREATE TABLE Device_Controller_Network_Device_Radio_BSS_InfoTbl
( 
    ParamName            TEXT UNIQUE NOT NULL,  
    ParamDbStatus        TEXT DEFAULT 'current',  
    Writable             INT,  --BOOLEAN:  1 - True, 0 - False
    UserAccessPerm       INT, -- Guest(0), Viewer(1), Config(2), Admin(4)
    ReadFrontEnds        INT, -- access bitmap: 1-WEB, 2-CLI, 4-NETCONF, 8-TR069, 16-SNMP, 0 or NULL - free access
    WriteFrontEnds       INT, -- access bitmap: 1-WEB, 2-CLI, 4-NETCONF, 8-TR069, 16-SNMP, 0 or NULL - free access
    ParamType            TEXT,  
    IsIndex              INT,  --BOOLEAN: 1 - True (param is object's index), 0 - False 
    ValueIsList          INT,  --BOOLEAN: 1 - True, 0 - False 
    ParentObject         TEXT,  
    MinValue             TEXT,  
    MaxValue             TEXT,  
    DefValue             TEXT,  
    MinLength            INT,  
    MaxLength            INT,  
    Hidden               INT,  --BOOLEAN:  1 - True, 0 - False 
    NotSaveInDb          INT,  --BOOLEAN:  1 - True, 0 - False 
    ActiveNotify         TEXT,  
    Units                TEXT,  
    EnumValues           TEXT,  
    StyleOfGet           TEXT CHECK (StyleOfGet IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    GetMethod            TEXT,  
    StyleOfSet           TEXT CHECK (StyleOfGet IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    SetMethod            TEXT,  
    ParamDescr           TEXT 
);

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_InfoTbl VALUES ('DeviceIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_InfoTbl VALUES ('RadioIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_InfoTbl VALUES ('BSSIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_InfoTbl VALUES ( "BSSID", 
    "current", 0, 4, 31, 31, "string", NULL, 
    NULL, NULL, NULL, NULL, "00:00:00:00:00:00", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_InfoTbl VALUES ( "SSID", 
    "current", 0, 4, 31, 31, "string", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_InfoTbl VALUES ( "Enabled", 
    "current", 0, 4, 31, 31, "boolean", NULL, 
    NULL, NULL, NULL, NULL, "false", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_InfoTbl VALUES ( "LastChange", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_InfoTbl VALUES ( "TimeStamp", 
    "current", 0, 4, 31, 31, "string", NULL, 
    NULL, NULL, NULL, NULL, "2020-08-31T11:22:39Z", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_InfoTbl VALUES ( "UnicastBytesSent", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_InfoTbl VALUES ( "UnicastBytesReceived", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_InfoTbl VALUES ( "MulticastBytesSent", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_InfoTbl VALUES ( "MulticastBytesReceived", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_InfoTbl VALUES ( "BroadcastBytesSent", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_InfoTbl VALUES ( "BroadcastBytesReceived", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_InfoTbl VALUES ( "EstServiceParametersBE", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_InfoTbl VALUES ( "EstServiceParametersBK", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_InfoTbl VALUES ( "EstServiceParametersVI", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_InfoTbl VALUES ( "EstServiceParametersVO", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_InfoTbl VALUES ( "NumberOfSTA", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_InfoTbl VALUES ('ObjInstSelfRef', 
    'current', 0, 0, 32, 0, 'string', NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_InfoTbl VALUES ('CfgOwner', 
    'current', 0, 0, 32, 0, 'unsignedInt', NULL, 
    NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_InfoTbl VALUES ('CreateOwner', 
    'current', 0, 0, 32, 0, 'unsignedInt', NULL, 
    NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

-- **************************************************************
-- Meta-information of object Device.Controller.Network.Device.{i}.Radio.{i}.BSS.{i}.STA.{i}.
-- **************************************************************
INSERT INTO MMX_Objects_InfoTbl VALUES( "Device.Controller.Network.Device.{i}.Radio.{i}.BSS.{i}.STA.{i}.", "current", 0, 0, 4, 31, 31, 64, 14, NULL, 
    "Device_Controller_Network_Device_Radio_BSS_STA_InfoTbl", "mmx_main_db", "Device_Controller_Network_Device_Radio_BSS_STA_ValuesTbl", 
    "prplmesh_be", NULL, NULL, "Device.Controller.Network.Device.{i}.Radio.{i}.BSS.{i}.NumberOfSTA", NULL, "STAIndex", 
    NULL, NULL, 
    NULL, NULL, 
    "script", "prplmesh_get.lua Controller.Network.Device.$$.Radio.$$.BSS.$$.STA.$$; Device.Controller.Network.Device.{i}.DeviceIndex, Device.Controller.Network.Device.{i}.Radio.{i}.RadioIndex, Device.Controller.Network.Device.{i}.Radio.{i}.BSS.{i}.BSSIndex, STAIndex", 
    NULL, NULL, 
    "script", "prplmesh_getall.lua Controller.Network.Device.{i}.Radio.{i}.BSS.{i}.STA.{i}; idx1 = Device.Controller.Network.Device.{i}.DeviceIndex, idx2 = Device.Controller.Network.Device.{i}.Radio.{i}.RadioIndex, idx3 = Device.Controller.Network.Device.{i}.Radio.{i}.BSS.{i}.BSSIndex, idx4 = STAIndex", 
    NULL, NULL );

DROP TABLE IF EXISTS Device_Controller_Network_Device_Radio_BSS_STA_InfoTbl; 
CREATE TABLE Device_Controller_Network_Device_Radio_BSS_STA_InfoTbl
( 
    ParamName            TEXT UNIQUE NOT NULL,  
    ParamDbStatus        TEXT DEFAULT 'current',  
    Writable             INT,  --BOOLEAN:  1 - True, 0 - False
    UserAccessPerm       INT, -- Guest(0), Viewer(1), Config(2), Admin(4)
    ReadFrontEnds        INT, -- access bitmap: 1-WEB, 2-CLI, 4-NETCONF, 8-TR069, 16-SNMP, 0 or NULL - free access
    WriteFrontEnds       INT, -- access bitmap: 1-WEB, 2-CLI, 4-NETCONF, 8-TR069, 16-SNMP, 0 or NULL - free access
    ParamType            TEXT,  
    IsIndex              INT,  --BOOLEAN: 1 - True (param is object's index), 0 - False 
    ValueIsList          INT,  --BOOLEAN: 1 - True, 0 - False 
    ParentObject         TEXT,  
    MinValue             TEXT,  
    MaxValue             TEXT,  
    DefValue             TEXT,  
    MinLength            INT,  
    MaxLength            INT,  
    Hidden               INT,  --BOOLEAN:  1 - True, 0 - False 
    NotSaveInDb          INT,  --BOOLEAN:  1 - True, 0 - False 
    ActiveNotify         TEXT,  
    Units                TEXT,  
    EnumValues           TEXT,  
    StyleOfGet           TEXT CHECK (StyleOfGet IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    GetMethod            TEXT,  
    StyleOfSet           TEXT CHECK (StyleOfGet IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    SetMethod            TEXT,  
    ParamDescr           TEXT 
);

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_STA_InfoTbl VALUES ('DeviceIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_STA_InfoTbl VALUES ('RadioIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_STA_InfoTbl VALUES ('BSSIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_STA_InfoTbl VALUES ('STAIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_STA_InfoTbl VALUES ( "MACAddress", 
    "current", 0, 4, 31, 31, "string", NULL, 
    NULL, NULL, NULL, NULL, "00:00:00:00:00:00", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_STA_InfoTbl VALUES ( "TimeStamp", 
    "current", 0, 4, 31, 31, "string", NULL, 
    NULL, NULL, NULL, NULL, "2020-08-31T11:22:39Z", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_STA_InfoTbl VALUES ( "LastDataDownlinkRate", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_STA_InfoTbl VALUES ( "LastDataUplinkRate", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_STA_InfoTbl VALUES ( "UtilizationReceive", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_STA_InfoTbl VALUES ( "UtilizationTransmit", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_STA_InfoTbl VALUES ( "EstMACDataRateDownlink", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_STA_InfoTbl VALUES ( "EstMACDataRateUplink", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_STA_InfoTbl VALUES ( "SignalStrength", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_STA_InfoTbl VALUES ( "LastConnectTime", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_STA_InfoTbl VALUES ( "BytesSent", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_STA_InfoTbl VALUES ( "BytesReceived", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_STA_InfoTbl VALUES ( "PacketsSent", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_STA_InfoTbl VALUES ( "PacketsReceived", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_STA_InfoTbl VALUES ( "ErrorsSent", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_STA_InfoTbl VALUES ( "ErrorsReceived", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_STA_InfoTbl VALUES ( "RetransCount", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_STA_InfoTbl VALUES ( "IPV4Address", 
    "current", 0, 4, 31, 31, "string", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_STA_InfoTbl VALUES ( "IPV6Address", 
    "current", 0, 4, 31, 31, "string", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_STA_InfoTbl VALUES ( "Hostname", 
    "current", 0, 4, 31, 31, "string", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_STA_InfoTbl VALUES ( "NumberOfMeasureReports", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_STA_InfoTbl VALUES ('ObjInstSelfRef', 
    'current', 0, 0, 32, 0, 'string', NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_STA_InfoTbl VALUES ('CfgOwner', 
    'current', 0, 0, 32, 0, 'unsignedInt', NULL, 
    NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

INSERT  INTO Device_Controller_Network_Device_Radio_BSS_STA_InfoTbl VALUES ('CreateOwner', 
    'current', 0, 0, 32, 0, 'unsignedInt', NULL, 
    NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

-- **************************************************************
-- Meta-information of object Device.Controller.Network.Device.{i}.Radio.{i}.BackhaulSTA.
-- **************************************************************
INSERT INTO MMX_Objects_InfoTbl VALUES( "Device.Controller.Network.Device.{i}.Radio.{i}.BackhaulSTA.", "current", 0, 0, 4, 31, 31, 66, 15, NULL, 
    "Device_Controller_Network_Device_Radio_BackhaulSTA_InfoTbl", "mmx_main_db", "Device_Controller_Network_Device_Radio_BackhaulSTA_ValuesTbl", 
    "prplmesh_be", NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, 
    NULL, NULL, 
    "script", "prplmesh_get.lua Controller.Network.Device.$$.Radio.$$.BackhaulSTA; Device.Controller.Network.Device.{i}.DeviceIndex, Device.Controller.Network.Device.{i}.Radio.{i}.RadioIndex", 
    NULL, NULL, 
    NULL, NULL, 
    NULL, NULL );

DROP TABLE IF EXISTS Device_Controller_Network_Device_Radio_BackhaulSTA_InfoTbl; 
CREATE TABLE Device_Controller_Network_Device_Radio_BackhaulSTA_InfoTbl
( 
    ParamName            TEXT UNIQUE NOT NULL,  
    ParamDbStatus        TEXT DEFAULT 'current',  
    Writable             INT,  --BOOLEAN:  1 - True, 0 - False
    UserAccessPerm       INT, -- Guest(0), Viewer(1), Config(2), Admin(4)
    ReadFrontEnds        INT, -- access bitmap: 1-WEB, 2-CLI, 4-NETCONF, 8-TR069, 16-SNMP, 0 or NULL - free access
    WriteFrontEnds       INT, -- access bitmap: 1-WEB, 2-CLI, 4-NETCONF, 8-TR069, 16-SNMP, 0 or NULL - free access
    ParamType            TEXT,  
    IsIndex              INT,  --BOOLEAN: 1 - True (param is object's index), 0 - False 
    ValueIsList          INT,  --BOOLEAN: 1 - True, 0 - False 
    ParentObject         TEXT,  
    MinValue             TEXT,  
    MaxValue             TEXT,  
    DefValue             TEXT,  
    MinLength            INT,  
    MaxLength            INT,  
    Hidden               INT,  --BOOLEAN:  1 - True, 0 - False 
    NotSaveInDb          INT,  --BOOLEAN:  1 - True, 0 - False 
    ActiveNotify         TEXT,  
    Units                TEXT,  
    EnumValues           TEXT,  
    StyleOfGet           TEXT CHECK (StyleOfGet IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    GetMethod            TEXT,  
    StyleOfSet           TEXT CHECK (StyleOfGet IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    SetMethod            TEXT,  
    ParamDescr           TEXT 
);

INSERT  INTO Device_Controller_Network_Device_Radio_BackhaulSTA_InfoTbl VALUES ('DeviceIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Radio_BackhaulSTA_InfoTbl VALUES ('RadioIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Radio_BackhaulSTA_InfoTbl VALUES ( "MACAddress", 
    "current", 0, 4, 31, 31, "string", NULL, 
    NULL, NULL, NULL, NULL, "00:00:00:00:00:00", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_BackhaulSTA_InfoTbl VALUES ('ObjInstSelfRef', 
    'current', 0, 0, 32, 0, 'string', NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

INSERT  INTO Device_Controller_Network_Device_Radio_BackhaulSTA_InfoTbl VALUES ('CfgOwner', 
    'current', 0, 0, 32, 0, 'unsignedInt', NULL, 
    NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

INSERT  INTO Device_Controller_Network_Device_Radio_BackhaulSTA_InfoTbl VALUES ('CreateOwner', 
    'current', 0, 0, 32, 0, 'unsignedInt', NULL, 
    NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

-- **************************************************************
-- Meta-information of object Device.Controller.Network.Device.{i}.Radio.{i}.ScanResult.
-- **************************************************************
INSERT INTO MMX_Objects_InfoTbl VALUES( "Device.Controller.Network.Device.{i}.Radio.{i}.ScanResult.", "current", 0, 0, 4, 31, 31, 68, 16, NULL, 
    "Device_Controller_Network_Device_Radio_ScanResult_InfoTbl", "mmx_main_db", "Device_Controller_Network_Device_Radio_ScanResult_ValuesTbl", 
    "prplmesh_be", NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, 
    NULL, NULL, 
    "script", "prplmesh_get.lua Controller.Network.Device.$$.Radio.$$.ScanResult; Device.Controller.Network.Device.{i}.DeviceIndex, Device.Controller.Network.Device.{i}.Radio.{i}.RadioIndex", 
    NULL, NULL, 
    NULL, NULL, 
    NULL, NULL );

DROP TABLE IF EXISTS Device_Controller_Network_Device_Radio_ScanResult_InfoTbl; 
CREATE TABLE Device_Controller_Network_Device_Radio_ScanResult_InfoTbl
( 
    ParamName            TEXT UNIQUE NOT NULL,  
    ParamDbStatus        TEXT DEFAULT 'current',  
    Writable             INT,  --BOOLEAN:  1 - True, 0 - False
    UserAccessPerm       INT, -- Guest(0), Viewer(1), Config(2), Admin(4)
    ReadFrontEnds        INT, -- access bitmap: 1-WEB, 2-CLI, 4-NETCONF, 8-TR069, 16-SNMP, 0 or NULL - free access
    WriteFrontEnds       INT, -- access bitmap: 1-WEB, 2-CLI, 4-NETCONF, 8-TR069, 16-SNMP, 0 or NULL - free access
    ParamType            TEXT,  
    IsIndex              INT,  --BOOLEAN: 1 - True (param is object's index), 0 - False 
    ValueIsList          INT,  --BOOLEAN: 1 - True, 0 - False 
    ParentObject         TEXT,  
    MinValue             TEXT,  
    MaxValue             TEXT,  
    DefValue             TEXT,  
    MinLength            INT,  
    MaxLength            INT,  
    Hidden               INT,  --BOOLEAN:  1 - True, 0 - False 
    NotSaveInDb          INT,  --BOOLEAN:  1 - True, 0 - False 
    ActiveNotify         TEXT,  
    Units                TEXT,  
    EnumValues           TEXT,  
    StyleOfGet           TEXT CHECK (StyleOfGet IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    GetMethod            TEXT,  
    StyleOfSet           TEXT CHECK (StyleOfGet IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    SetMethod            TEXT,  
    ParamDescr           TEXT 
);

INSERT  INTO Device_Controller_Network_Device_Radio_ScanResult_InfoTbl VALUES ('DeviceIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Radio_ScanResult_InfoTbl VALUES ('RadioIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Radio_ScanResult_InfoTbl VALUES ( "NumberOfOpClassScans", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_ScanResult_InfoTbl VALUES ( "TimeStamp", 
    "current", 0, 4, 31, 31, "string", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_ScanResult_InfoTbl VALUES ('ObjInstSelfRef', 
    'current', 0, 0, 32, 0, 'string', NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

INSERT  INTO Device_Controller_Network_Device_Radio_ScanResult_InfoTbl VALUES ('CfgOwner', 
    'current', 0, 0, 32, 0, 'unsignedInt', NULL, 
    NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

INSERT  INTO Device_Controller_Network_Device_Radio_ScanResult_InfoTbl VALUES ('CreateOwner', 
    'current', 0, 0, 32, 0, 'unsignedInt', NULL, 
    NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

-- **************************************************************
-- Meta-information of object Device.Controller.Network.Device.{i}.Radio.{i}.ScanResult.OpClassScan.{i}.
-- **************************************************************
INSERT INTO MMX_Objects_InfoTbl VALUES( "Device.Controller.Network.Device.{i}.Radio.{i}.ScanResult.OpClassScan.{i}.", "current", 0, 0, 4, 31, 31, 69, 17, NULL, 
    "Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_InfoTbl", "mmx_main_db", "Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ValuesTbl", 
    "prplmesh_be", NULL, NULL, "Device.Controller.Network.Device.{i}.Radio.{i}.ScanResult.NumberOfOpClassScans", NULL, "OpClassScanIndex", 
    NULL, NULL, 
    NULL, NULL, 
    "script", "prplmesh_get.lua Controller.Network.Device.$$.Radio.$$.ScanResult.OpClassScan.$$; Device.Controller.Network.Device.{i}.DeviceIndex, Device.Controller.Network.Device.{i}.Radio.{i}.RadioIndex, OpClassScanIndex", 
    NULL, NULL, 
    "script", "prplmesh_getall.lua Controller.Network.Device.{i}.Radio.{i}.ScanResult.OpClassScan.{i}; idx1 = Device.Controller.Network.Device.{i}.DeviceIndex, idx2 = Device.Controller.Network.Device.{i}.Radio.{i}.RadioIndex, idx3 = OpClassScanIndex", 
    NULL, NULL );

DROP TABLE IF EXISTS Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_InfoTbl; 
CREATE TABLE Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_InfoTbl
( 
    ParamName            TEXT UNIQUE NOT NULL,  
    ParamDbStatus        TEXT DEFAULT 'current',  
    Writable             INT,  --BOOLEAN:  1 - True, 0 - False
    UserAccessPerm       INT, -- Guest(0), Viewer(1), Config(2), Admin(4)
    ReadFrontEnds        INT, -- access bitmap: 1-WEB, 2-CLI, 4-NETCONF, 8-TR069, 16-SNMP, 0 or NULL - free access
    WriteFrontEnds       INT, -- access bitmap: 1-WEB, 2-CLI, 4-NETCONF, 8-TR069, 16-SNMP, 0 or NULL - free access
    ParamType            TEXT,  
    IsIndex              INT,  --BOOLEAN: 1 - True (param is object's index), 0 - False 
    ValueIsList          INT,  --BOOLEAN: 1 - True, 0 - False 
    ParentObject         TEXT,  
    MinValue             TEXT,  
    MaxValue             TEXT,  
    DefValue             TEXT,  
    MinLength            INT,  
    MaxLength            INT,  
    Hidden               INT,  --BOOLEAN:  1 - True, 0 - False 
    NotSaveInDb          INT,  --BOOLEAN:  1 - True, 0 - False 
    ActiveNotify         TEXT,  
    Units                TEXT,  
    EnumValues           TEXT,  
    StyleOfGet           TEXT CHECK (StyleOfGet IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    GetMethod            TEXT,  
    StyleOfSet           TEXT CHECK (StyleOfGet IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    SetMethod            TEXT,  
    ParamDescr           TEXT 
);

INSERT  INTO Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_InfoTbl VALUES ('DeviceIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_InfoTbl VALUES ('RadioIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_InfoTbl VALUES ('OpClassScanIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_InfoTbl VALUES ( "NumberOfChannelScans", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_InfoTbl VALUES ( "OperatingClass", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_InfoTbl VALUES ('ObjInstSelfRef', 
    'current', 0, 0, 32, 0, 'string', NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

INSERT  INTO Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_InfoTbl VALUES ('CfgOwner', 
    'current', 0, 0, 32, 0, 'unsignedInt', NULL, 
    NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

INSERT  INTO Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_InfoTbl VALUES ('CreateOwner', 
    'current', 0, 0, 32, 0, 'unsignedInt', NULL, 
    NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

-- **************************************************************
-- Meta-information of object Device.Controller.Network.Device.{i}.Radio.{i}.ScanResult.OpClassScan.{i}.ChannelScan.{i}.
-- **************************************************************
INSERT INTO MMX_Objects_InfoTbl VALUES( "Device.Controller.Network.Device.{i}.Radio.{i}.ScanResult.OpClassScan.{i}.ChannelScan.{i}.", "current", 0, 0, 4, 31, 31, 70, 18, NULL, 
    "Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_InfoTbl", "mmx_main_db", "Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_ValuesTbl", 
    "prplmesh_be", NULL, NULL, "Device.Controller.Network.Device.{i}.Radio.{i}.ScanResult.OpClassScan.{i}.NumberOfChannelScans", NULL, "ChannelScanIndex", 
    NULL, NULL, 
    NULL, NULL, 
    "script", "prplmesh_get.lua Controller.Network.Device.$$.Radio.$$.ScanResult.OpClassScan.$$.ChannelScan.$$; Device.Controller.Network.Device.{i}.DeviceIndex, Device.Controller.Network.Device.{i}.Radio.{i}.RadioIndex, Device.Controller.Network.Device.{i}.Radio.{i}.ScanResult.OpClassScan.{i}.OpClassScanIndex, ChannelScanIndex", 
    NULL, NULL, 
    "script", "prplmesh_getall.lua Controller.Network.Device.{i}.Radio.{i}.ScanResult.OpClassScan.{i}.ChannelScan.{i}.; idx1 = Device.Controller.Network.Device.{i}.DeviceIndex, idx2 = Device.Controller.Network.Device.{i}.Radio.{i}.RadioIndex, idx3 = Device.Controller.Network.Device.{i}.Radio.{i}.ScanResult.OpClassScan.{i}.OpClassScanIndex, idx4 = ChannelScanIndex", 
    NULL, NULL );

DROP TABLE IF EXISTS Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_InfoTbl; 
CREATE TABLE Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_InfoTbl
( 
    ParamName            TEXT UNIQUE NOT NULL,  
    ParamDbStatus        TEXT DEFAULT 'current',  
    Writable             INT,  --BOOLEAN:  1 - True, 0 - False
    UserAccessPerm       INT, -- Guest(0), Viewer(1), Config(2), Admin(4)
    ReadFrontEnds        INT, -- access bitmap: 1-WEB, 2-CLI, 4-NETCONF, 8-TR069, 16-SNMP, 0 or NULL - free access
    WriteFrontEnds       INT, -- access bitmap: 1-WEB, 2-CLI, 4-NETCONF, 8-TR069, 16-SNMP, 0 or NULL - free access
    ParamType            TEXT,  
    IsIndex              INT,  --BOOLEAN: 1 - True (param is object's index), 0 - False 
    ValueIsList          INT,  --BOOLEAN: 1 - True, 0 - False 
    ParentObject         TEXT,  
    MinValue             TEXT,  
    MaxValue             TEXT,  
    DefValue             TEXT,  
    MinLength            INT,  
    MaxLength            INT,  
    Hidden               INT,  --BOOLEAN:  1 - True, 0 - False 
    NotSaveInDb          INT,  --BOOLEAN:  1 - True, 0 - False 
    ActiveNotify         TEXT,  
    Units                TEXT,  
    EnumValues           TEXT,  
    StyleOfGet           TEXT CHECK (StyleOfGet IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    GetMethod            TEXT,  
    StyleOfSet           TEXT CHECK (StyleOfGet IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    SetMethod            TEXT,  
    ParamDescr           TEXT 
);

INSERT  INTO Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_InfoTbl VALUES ('DeviceIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_InfoTbl VALUES ('RadioIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_InfoTbl VALUES ('OpClassScanIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_InfoTbl VALUES ('ChannelScanIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_InfoTbl VALUES ( "Channel", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_InfoTbl VALUES ( "TimeStamp", 
    "current", 0, 4, 31, 31, "string", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_InfoTbl VALUES ( "Utilization", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_InfoTbl VALUES ( "Noise", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_InfoTbl VALUES ( "NumberOfNeighborBSS", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_InfoTbl VALUES ('ObjInstSelfRef', 
    'current', 0, 0, 32, 0, 'string', NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

INSERT  INTO Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_InfoTbl VALUES ('CfgOwner', 
    'current', 0, 0, 32, 0, 'unsignedInt', NULL, 
    NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

INSERT  INTO Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_InfoTbl VALUES ('CreateOwner', 
    'current', 0, 0, 32, 0, 'unsignedInt', NULL, 
    NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

-- **************************************************************
-- Meta-information of object Device.Controller.Network.Device.{i}.Radio.{i}.ScanResult.OpClassScan.{i}.ChannelScan.{i}.NeighborBSS.{i}.
-- **************************************************************
INSERT INTO MMX_Objects_InfoTbl VALUES( "Device.Controller.Network.Device.{i}.Radio.{i}.ScanResult.OpClassScan.{i}.ChannelScan.{i}.NeighborBSS.{i}.", "current", 0, 0, 4, 31, 31, 71, 19, NULL, 
    "Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_NeighborBSS_InfoTbl", "mmx_main_db", "Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_NeighborBSS_ValuesTbl", 
    "prplmesh_be", NULL, NULL, "Device.Controller.Network.Device.{i}.Radio.{i}.ScanResult.OpClassScan.{i}.ChannelScan.{i}.NumberOfNeighborBSS", NULL, "NeighborBSSIndex", 
    NULL, NULL, 
    NULL, NULL, 
    "script", "prplmesh_get.lua Controller.Network.Device.$$.Radio.$$.ScanResult.OpClassScan.$$.ChannelScan.$$.NeighborBSS.$$; Device.Controller.Network.Device.{i}.DeviceIndex, Device.Controller.Network.Device.{i}.Radio.{i}.RadioIndex, Device.Controller.Network.Device.{i}.Radio.{i}.ScanResult.OpClassScan.{i}.OpClassScanIndex, Device.Controller.Network.Device.{i}.Radio.{i}.ScanResult.OpClassScan.{i}.ChannelScan.{i}.ChannelScanIndex, NeighborBSSIndex", 
    NULL, NULL, 
    "script", "prplmesh_getall.lua Controller.Network.Device.{i}.Radio.{i}.ScanResult.OpClassScan.{i}.ChannelScan.{i}.NeighborBSS.{i}.; idx1 = Device.Controller.Network.Device.{i}.DeviceIndex, idx2 = Device.Controller.Network.Device.{i}.Radio.{i}.RadioIndex, idx3 = Device.Controller.Network.Device.{i}.Radio.{i}.ScanResult.OpClassScan.{i}.OpClassScanIndex, idx4 = Device.Controller.Network.Device.{i}.Radio.{i}.ScanResult.OpClassScan.{i}.ChannelScan.{i}.ChannelScanIndex, idx5 = NeighborBSSIndex", 
    NULL, NULL );

DROP TABLE IF EXISTS Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_NeighborBSS_InfoTbl; 
CREATE TABLE Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_NeighborBSS_InfoTbl
( 
    ParamName            TEXT UNIQUE NOT NULL,  
    ParamDbStatus        TEXT DEFAULT 'current',  
    Writable             INT,  --BOOLEAN:  1 - True, 0 - False
    UserAccessPerm       INT, -- Guest(0), Viewer(1), Config(2), Admin(4)
    ReadFrontEnds        INT, -- access bitmap: 1-WEB, 2-CLI, 4-NETCONF, 8-TR069, 16-SNMP, 0 or NULL - free access
    WriteFrontEnds       INT, -- access bitmap: 1-WEB, 2-CLI, 4-NETCONF, 8-TR069, 16-SNMP, 0 or NULL - free access
    ParamType            TEXT,  
    IsIndex              INT,  --BOOLEAN: 1 - True (param is object's index), 0 - False 
    ValueIsList          INT,  --BOOLEAN: 1 - True, 0 - False 
    ParentObject         TEXT,  
    MinValue             TEXT,  
    MaxValue             TEXT,  
    DefValue             TEXT,  
    MinLength            INT,  
    MaxLength            INT,  
    Hidden               INT,  --BOOLEAN:  1 - True, 0 - False 
    NotSaveInDb          INT,  --BOOLEAN:  1 - True, 0 - False 
    ActiveNotify         TEXT,  
    Units                TEXT,  
    EnumValues           TEXT,  
    StyleOfGet           TEXT CHECK (StyleOfGet IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    GetMethod            TEXT,  
    StyleOfSet           TEXT CHECK (StyleOfGet IN ('script','uci', 'ubus', 'backend', 'db', NULL)),  
    SetMethod            TEXT,  
    ParamDescr           TEXT 
);

INSERT  INTO Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_NeighborBSS_InfoTbl VALUES ('DeviceIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_NeighborBSS_InfoTbl VALUES ('RadioIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_NeighborBSS_InfoTbl VALUES ('OpClassScanIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_NeighborBSS_InfoTbl VALUES ('ChannelScanIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_NeighborBSS_InfoTbl VALUES ('NeighborBSSIndex', 
    'current', 0, 0, 23, 32, 'unsignedInt', 1, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Index of the table');

INSERT  INTO Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_NeighborBSS_InfoTbl VALUES ( "BSSID", 
    "current", 0, 4, 31, 31, "string", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_NeighborBSS_InfoTbl VALUES ( "SSID", 
    "current", 0, 4, 31, 31, "string", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_NeighborBSS_InfoTbl VALUES ( "SignalStrength", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_NeighborBSS_InfoTbl VALUES ( "ChannelBandwidth", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_NeighborBSS_InfoTbl VALUES ( "ChannelUtilization", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_NeighborBSS_InfoTbl VALUES ( "StationCount", 
    "current", 0, 4, 31, 31, "unsignedInt", NULL, 
    NULL, NULL, NULL, NULL, "0", NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, 
    NULL);

INSERT  INTO Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_NeighborBSS_InfoTbl VALUES ('ObjInstSelfRef', 
    'current', 0, 0, 32, 0, 'string', NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

INSERT  INTO Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_NeighborBSS_InfoTbl VALUES ('CfgOwner', 
    'current', 0, 0, 32, 0, 'unsignedInt', NULL, 
    NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

INSERT  INTO Device_Controller_Network_Device_Radio_ScanResult_OpClassScan_ChannelScan_NeighborBSS_InfoTbl VALUES ('CreateOwner', 
    'current', 0, 0, 32, 0, 'unsignedInt', NULL, 
    NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 
    NULL, NULL, NULL, 
    'db', NULL, NULL, NULL, 
    'Internal service parameter');

