/*
 * Copyright (c) 2013-2021 Inango Systems LTD.
 *
 * Author: Inango Systems LTD. <support@inango-systems.com>
 * Creation Date: Dec 2013
 *
 * The author may be reached at support@inango-systems.com
 * 
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 * 
 * 1. Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 * 
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 * 
 * Subject to the terms and conditions of this license, each copyright holder
 * and contributor hereby grants to those receiving rights under this license
 * a perpetual, worldwide, non-exclusive, no-charge, royalty-free, irrevocable
 * (except for failure to satisfy the conditions of this license) patent license
 * to make, have made, use, offer to sell, sell, import, and otherwise transfer
 * this software, where such license applies only to those patent claims, already
 * acquired or hereafter acquired, licensable by such copyright holder or contributor
 * that are necessarily infringed by:
 * 
 * (a) their Contribution(s) (the licensed copyrights of copyright holders and
 * non-copyrightable additions of contributors, in source or binary form) alone;
 * or
 * 
 * (b) combination of their Contribution(s) with the work of authorship to which
 * such Contribution(s) was added by such copyright holder or contributor, if,
 * at the time the Contribution is added, such addition causes such combination
 * to be necessarily infringed. The patent license shall not apply to any other
 * combinations which include the Contribution.
 * 
 * Except as expressly stated above, no rights or licenses from any copyright
 * holder or contributor is granted under this license, whether expressly, by
 * implication, estoppel or otherwise.
 * 
 * DISCLAIMER
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
 * USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 * 
 * NOTE
 * 
 * This is part of a management middleware software package called MMX that was developed by Inango Systems Ltd.
 * 
 * This version of MMX provides web and command-line management interfaces.
 * 
 * Please contact us at Inango at support@inango-systems.com if you would like to hear more about
 * - other management packages, such as SNMP, TR-069 or Netconf
 * - how we can extend the data model to support all parts of your system
 * - professional sub-contract and customization services
 */
if (!window.console) {
	console = { log: function (logMsg) {} };
}

var globalCreateIndexer = 0;

$(document).ready(function(){
	/**
	* Special listener for "Source Protocol" select on page Device Management > Copy > Copy Operation.
	* Required for handling usage of "Browser" source protocol
	*/
	$(escapeJquery('#2::Device.X_Inango_Copy.Operation. select[name$="SrcProto"]')).change(function(){
		var section = escapeJquery('#2::Device.X_Inango_Copy.Operation.');

		var srcHost = $(section).find("[name$='SrcHost']");
		var srcFileName = $(section).find("[name$='SrcFileName']");

		//always mark Source Protocol as changed to include in collectFormSend
		var srcProto = $(section).find("[name$='SrcProto']").addClass('mmx-changed');

		//looking for FileUpload input or creating new if absent
		var fileSelector = $(section).find("[name='fileToUpload']");
		if (!fileSelector.length) {
			fileSelector = $('<br><input name="fileToUpload" type="file" style="margin-left: 7px; margin-top: 3px">');
			fileSelector.insertAfter(srcFileName);
			fileSelector.hide();
		}

		if(this.value == 'browser'){
			srcHost.prop('disabled', true);

			// disable "Source File Name" text input and show FileUpload input
			srcFileName.prop('disabled', true);
			fileSelector.show();

			fileSelector.change(function(){
				var file = fileSelector.get(0).files[0];
				//manually trigger 'change' to invoke mmx-field onChange Listener
				//blank means localhost
				srcHost.val("").trigger('change');
				srcFileName.val(file.name).trigger('change');
			});
		} else {
			srcHost.prop('disabled', false);

			//enable "Source File Name" text input and hide FileUplaod input for all protocols except "Browser"
			srcFileName.prop('disabled', false);
			fileSelector.hide();
		}
	});

	//manually trigger change event for "Source Protocol" select to show right form(with/without FileUpload input) on page load
	$(escapeJquery('#2::Device.X_Inango_Copy.Operation. select[name$="SrcProto"]')).change();

	/**
	* Special listener for "Copy Setting" apply button on page Device Management > Copy > Copy Operation.
	* Required for handling usage of "Browser" source protocol.
	* Using 'mousedown' event to be triggered before general '.mmx-section-apply' listener
	*/
	$(escapeJquery('#apply-2::Device.X_Inango_Copy.Operation.')).on('mousedown', function(e){
		e.preventDefault();
		var cbiSection = $(this).closest('.cbi-section');
		// extracting management object identifier from section id
		var sectionId = $(this).attr('id').slice("apply-".length);
		var multiForm = collectFormSend(cbiSection, sectionId);

		if(multiForm.find("[name$='SrcProto']").val() == "browser") {
			//appending attribute and values needed for file upload
			multiForm.attr( "enctype", "multipart/form-data");
			var fileSelector = $(cbiSection).find("[name='fileToUpload']");
			multiForm.append(fileSelector);
		}

		multiForm.append($('<input>', {'name':'action','type':'hidden','value':'forms'}));
		multiForm.appendTo('body').submit();
	});

	$('.mmx-tooltip img').tooltip({
		tooltipClass: "mmx-tooltip-window",
		position: {my: "left top+5", at: "left bottom"}
	});

	$('.collapse').click(function(e) {
	    var id = e.currentTarget.getAttribute("data-id");
	    var data = document.getElementById(id);
	    var table = document.getElementById("table-" + id);
	    var legend = document.getElementById("legend-" + id);
	    var buttons = document.getElementById("but-" + id);
	    var icon = document.getElementById("ico-" + id);
	    if (data.style.display != "none") {
			icon.className = "fas fa-angle-down";
			data.style.display = "none";
			buttons.style.display = "none";
			table.style.padding = "0 1em";
			legend.style.paddingBottom = "0";
	    } else {
			icon.className = "fas fa-angle-up";
			data.style.display="block";
			buttons.style.display="block";
			table.style.padding = "2em 1em";
			legend.style.paddingBottom = "20px";
	    }
	});
	/**
	 * This listener attached for submitting only changed fields to MMX WEB backend.
	 * Emitting of 'change' event from default HTML inputs (such as <select>, <input>, <textarea>) supported by jquery,
	 * but complex controls which have '.mmx-field' (such as 'date picker' for example) should trace and emit 'change' event by itself.
	 * 'change' event is emitted only when field value is 'commited' (user clicked 'Enter' or changed focus to other element).
	 * This peculiarity can cause issues with text inputs don't get marked as changed, so additionally listening to 'input' event.
	 * Also complex controls should implement thier own handler for $.val() method.
	 * '.mmx-field' is class which indicates that field is contains value of some parameter.
	 */
	$('.mmx-field').on('change input', function(){
		$(this).addClass('mmx-changed');
	});
	$('.mmx-edit-row').click(function(e){
		e.preventDefault();
		$(this).closest('tr').attr('mmx-action', 'update').addClass('mmx-action-update');
		var btnSet = $(this).closest('td').children();
		btnSet.filter('.mmx-revert-row').show();
		btnSet.not('.mmx-revert-row').hide();
		var myRow = $(this).closest('tr').children('.cbi-value-field');
		console.log(myRow);
		for (i = 0; i < myRow.length; i++) {
			var myCol = $(myRow[i]);
			console.log(myCol);
			var myColValueHolder = myCol.children(".value-holder");
			if (myColValueHolder.length == 1) {
				myColValueHolder.siblings().hide();
				myColValueHolder.show();
			}
		}
	});
	/**
	 * Using .on() instead of .click() here related to fact that
	 * newly created rows should handle "Revert" feature
	 */
	$('.mmx-revert-row').on('click', function(e){
		e.preventDefault();
		console.log('revert');
		var myRow = $(this).closest('tr');
		if (myRow.attr('mmx-action') == 'create') {
			myRow.remove();
		} else {
			var btnSet = $(this).closest('td').children();
			btnSet.not('.mmx-revert-row').show();
			btnSet.filter('.mmx-revert-row').hide();
			myRow.removeAttr('mmx-action');
			myRow.removeClass('mmx-action-delete mmx-action-update');
			myRow.children(".cbi-value-field").each(function(){
				var colValueHolder = $(this).children(".value-holder");
				if (colValueHolder.length == 1) {
					colValueHolder.siblings().show();
					colValueHolder.hide();
				}
			});
		}
	});
	$('.mmx-delete-row').click(function(e){
		e.preventDefault();
		var myRow = $(this).closest('tr');
		var thisLink = $(this);
		var sectionPath = $(this).attr('id');
		var partPath = myRow.attr('id');
		myRow.addClass('mmx-action-delete');
		$('<div>Confirmation for deleting row</div>').dialog({
			dialogClass: "mmx-edit-window-full",
			autoOpen: true,
			modal: true,
			draggable: false,
			resizable: false,
			title: 'Confirm',
						minWidth: 400,
			buttons: [
				{
					text: 'OK',
					click: function() {
						myRow.attr('mmx-action', 'delete');
						var btnSet = thisLink.closest('td').children();
						btnSet.filter('.mmx-revert-row').show();
						btnSet.not('.mmx-revert-row').hide();
						$(this).dialog('destroy').remove();
					}
				},
				{
					text: 'Cancel',
					click: function() {
						myRow.removeClass('mmx-action-delete');
						$(this).dialog('destroy').remove();
					}
				}
			]
		});
	});
	$('.mmx-create-row').click(function(e){
		e.preventDefault();
		var newRow = $('.mmx-create-tpl#' + escapeJquery($(this).attr('id')) + ' tbody').children('tr').first().clone(true);
		newRow.addClass('mmx-action-create');
		$(this).closest('tr').before(newRow);
	});
	// For all section actions section id consists of two parts, separated by "-": action name and management object identifier. 
	// To extract management object identifier we must strip off action name and "-" from section id
	$('.mmx-section-refresh, .mmx-group-refresh').click(function(e){
		e.preventDefault();
		var sectionRefresh = $('<form>', {'method': 'post', 'action': mmxSelfUrl, 'target': '_self'});
		sectionRefresh.append($('<input>', {
				'name': 'action',
				'type': 'hidden',
				'value': 'refresh'
			}));
		sectionRefresh.appendTo('body').submit();
	});
	$('.mmx-section-update').click(function(e){
		e.preventDefault();
		var sectionUpdate = $('<form>', {'method': 'post', 'action': mmxSelfUrl, 'target': '_self'});
		sectionUpdate.append($('<input>', {
			// extracting management object identifier from section id
			'name': $(this).attr('id').slice("update-".length),
			'type': 'hidden',
			'value': 1
		}));
		sectionUpdate.append($('<input>', {
				'name': 'action',
				'type': 'hidden',
				'value': 'update'
			}));
		sectionUpdate.appendTo('body').submit();
	});
	$('.mmx-group-update').click(function(e){
		e.preventDefault();
		var allUpdate = $('<form>', {'method': 'post', 'action': mmxSelfUrl, 'target': '_self'});
		$('.mmx-section-update').each(function(){
			allUpdate.append($('<input>', {
				// extracting management object identifier from section id
				'name': $(this).attr('id').slice("update-".length),
				'type': 'hidden',
				'value': 1
			}));
		});
		allUpdate.append($('<input>', {
					'name': 'action',
					'type': 'hidden',
					'value': 'update'
				}));
		allUpdate.appendTo('body').submit();
	});
	$('.mmx-section-apply').click(function(e){
		e.preventDefault();
		var cbiSection = $(this).closest('.cbi-section');
		// extracting management object identifier from section id
		var sectionId = $(this).attr('id').slice("apply-".length);
		var multiForm = collectFormSend(cbiSection, sectionId);
		multiForm.append($('<input>', {'name':'action','type':'hidden','value':'forms'}));
		multiForm.appendTo('body').submit();
	});
	$('.mmx-section-save').click(function(e){
		e.preventDefault();
		var cbiSection = $(this).closest('.cbi-section');
		// extracting management object identifier from section id
		var sectionId = $(this).attr('id').slice("save-".length);
		var multiForm = collectFormSend(cbiSection, sectionId);
		multiForm.append($('<input>', {'name':'action','type':'hidden','value':'forms-save'}));
		multiForm.appendTo('body').submit();
	});

        $('.mmx-tablegroup-edit').click(function(e){
		e.preventDefault();
                $(this).siblings(".mmx-tablegroup-apply").show();
                $(this).siblings(".mmx-tablegroup-revert").show();
                $(this).hide();
		$(this).closest('tr').attr('mmx-action', 'update').addClass('mmx-action-update');
                console.log("edit", $(this).data('mmx-instance'));
		var myRow = $("table[data-mmx-instance='" + $(this).data('mmx-instance') + "']").find('.cbi-value-field');
		console.log(myRow);
		for (i = 0; i < myRow.length; i++) {
			var myCol = $(myRow[i]);
                        myCol.addClass("mmx-cell-update");
			console.log(myCol);
			var myColValueHolder = myCol.children(".value-holder");
			if (myColValueHolder.length == 1) {
				myColValueHolder.siblings().hide();
				myColValueHolder.show();
			}
		}
	});
	/**
	 * Using .on() instead of .click() here related to fact that
	 * newly created rows should handle "Revert" feature
	 */
	$('.mmx-tablegroup-revert').on('click', function(e){
		e.preventDefault();
                $(this).siblings(".mmx-tablegroup-apply").hide();
                $(this).siblings(".mmx-tablegroup-edit").show();
                $(this).hide();
		console.log('revert');
		var myRow = $("table[data-mmx-instance='" + $(this).data('mmx-instance') + "']").find('.cbi-value-field');
		myRow.each(function(){
                        $(this).removeClass("mmx-cell-update");
			var colValueHolder = $(this).children(".value-holder");
			if (colValueHolder.length == 1) {
				colValueHolder.siblings().show();
				colValueHolder.hide();
			}
		});
	});
        $('.mmx-tablegroup-apply').click(function(e){
		e.preventDefault();
		var instanceId = $(this).data('mmx-instance');
		var multiForm = $('<form>', {'method': 'post', 'action': mmxSelfUrl, 'target': '_self'});
		console.log('Edit ' + instanceId);
		$("table[data-mmx-instance='" + $(this).data('mmx-instance') + "']").find('.cbi-value-field').each(function(){
			var colValueHolder = $(this).children('.value-holder');
			if ($(this).children('.value-holder').length == 1 && colValueHolder.find('.mmx-field').hasClass('mmx-changed')) {
				var paramValue = mmxExtractValue(colValueHolder.find('.mmx-field'));
				var paramName = colValueHolder.find('.mmx-field').attr('name');
				console.log(' --- field ' + paramName + ' = ' + paramValue);
				multiForm.append($('<input>', {
					'name': instanceId + paramName, 'type': 'hidden', 'value': paramValue
				}));
			}
		});
		multiForm.append($('<input>', {'name':'action','type':'hidden','value':'forms'}));
		multiForm.appendTo('body').submit();
	});
	$('.mmx-full-value-link').click(function(e){
		e.preventDefault();
		var fullValueHolder = $(this).siblings('.mmx-full-value-popup');
		var dialogHolder = $("<div></div>").append(fullValueHolder.text());
		dialogHolder.dialog({
			dialogClass: "mmx-full-value-window mmx-full-value-readonly",                                                                        
			autoOpen: true,                                                                                                                      
			modal: true,                                                                                                                         
			draggable: true,                                                                                           
			resizable: true,                                                                                           
			title: 'Full value',                                                                                           
			minWidth: 400,
			width: $(window).width() * 0.5,
			buttons: [{
				text: 'Close',                                                                                                      
				click: function() {
					$(this).dialog('close');
				}
			}],
			open: function(){
				var self = this;
				$('.ui-widget-overlay').bind('click',function(){
					$(self).dialog('close');
				});
			},
			close: function(){
				var self = this;
				$(self).dialog('destroy').remove();
			}
                });
	});
	$('.mmx-full-value-edit-link').click(function(e){                                            
                e.preventDefault();
		var editLink = $(this);
                var fullValueEditHolder = editLink.siblings('.mmx-full-value-popup');
		var savedAttrs = getAttributes(fullValueEditHolder);
                fullValueEditHolder.dialog({                                                                                                      
                        dialogClass: "mmx-full-value-window",                                            
                        autoOpen: true,                                                         
                        modal: true,                                                              
                        draggable: true,                                                                                           
                        resizable: true,                                                               
                        title: 'Edit full value',                              
                        minWidth: 400,
			width: $(window).width() * 0.5,
			height: $(window).height() * 0.3,
			buttons: [{                                                
                                text: 'Done',                                                   
                                click: function() {                                                                                 
                                        $(this).dialog('close');                                       
                                }                                                      
                        }],                                                                              
                        open: function(){                                          
                                var self = this;                                                  
                                $('.ui-widget-overlay').bind('click',function(){                                                    
                                        $(self).dialog('close');                                       
                                });                                                    
                        },                                                                               
                        close: function(){                                         
                                var self = this;
				var clonedHolder = fullValueEditHolder.clone();
				/* Clean attributes attached by dialog and assign previously saved original attributes */
				var clonedAttrs = getAttributes(clonedHolder);
				$.each(clonedAttrs, function(aname, aval){
					clonedHolder.removeAttr(aname);
				});
				clonedHolder.attr(savedAttrs);
				editLink.parent().append(clonedHolder);
                                $(self).dialog('destroy').remove();                                                                 
                        }                                                                                     
                });                                                                    
        });
	$('.mmx-btn').click(function(e){
		e.preventDefault();
		
		var sectionId = $(this).parents('.cbi-section-node').attr('id');
		var paramName = $(this).attr('name');
		var operation = sectionId + paramName;

		var confirmMessage = $(this).attr('data-confirmation-message');

		if(confirmMessage) {
			var confirmDialog = $("<div></div>");
			confirmDialog.text(confirmMessage);

			confirmDialog.dialog({
				dialogClass: "mmx-full-value-window",
				autoOpen: true,
				modal: true,
				draggable: true,
				title: 'Confirm operation',
				buttons:
				[{
					text: "Cancel",
					click: function(e) {
						$(this).dialog('close');
					}
				},
				{
					text: "OK",
					click: function(e) {
						applyOperation(operation);
						$(this).dialog('close');
					}
				}],
				open: function(){
					var self = this;
					$('.ui-widget-overlay').bind('click',function(){
						$(self).dialog('close');
					});
				},
				close: function(){
					var self = this;
					$(self).dialog('destroy').remove();
				}
			});
		} else {
			applyOperation(operation);
		}
	});
	$('.mmx-graph-btn').click(function(e){
		e.preventDefault();
		
		//retrieving all data for graph building from button sibling
		var sibling = $(this).siblings('.mmx-full-value-popup');

		var headerText = sibling.attr('data-header');
		var dataFormat = sibling.attr('data-format');
		var x_name = sibling.attr('data-x-name');
		var x_min = sibling.attr('data-x-min');
		var x_max = sibling.attr('data-x-max');
		var y_name = sibling.attr('data-y-name');
		var y_min = sibling.attr('data-y-min');
		var y_max = sibling.attr('data-y-max');
		var rawData = sibling.text();

		var dialogHolder = $("<div></div>");

		var chart = $("<div style='height:100%'></div>");
		//chart.get(0) to eject DOM element from jQuery object
		appendGraph(chart.get(0), dataFormat, x_name, x_min, x_max, y_name, y_min, y_max, rawData);

		var dataTextArea = $("<textarea style='width: 100%; height: 100%' readonly='true'></textarea>");
		dataTextArea.val(rawData);

		dialogHolder.append(chart);
		dialogHolder.append(dataTextArea);

		dialogHolder.dialog({
			dialogClass: "mmx-full-value-window mmx-full-value-readonly",
			autoOpen: true,
			modal: true,
			draggable: true,
			resizable: true,
			minWidth: 400,
			width: $(window).width() * 0.6,
			minHeight: 200,
			height: $(window).height() * 0.6,
			buttons:
			[{
				//Chrome has a bug interacting with span elements (JQuery buttons contains <span> inside)
				//that's why retrieving and hiding/showing buttons explicitly
				id: 'show-data-dialog-button',
				text: "Show row data",
				click: function(e) {
					dataTextArea.show();
					chart.hide();

					//display 'none' to hide button and display 'inline' to return default 'display' value (visible)
					$('#show-data-dialog-button').css('display','none');
					$('#show-graph-dialog-button').css('display','inline');
				}
			},
			{
				id: 'show-graph-dialog-button',
				text: "Show graph",
				click: function(e) {
					dataTextArea.hide();
					chart.show();

					//display 'none' to hide button and display 'inline' to return default 'display' value (visible)
					$('#show-data-dialog-button').css('display','inline');
					$('#show-graph-dialog-button').css('display', 'none');					
				}
			},
			{
				text: 'Close',
				click: function() {
					$(this).dialog('close');
				}
			}],
			open: function(){
				var self = this;
				$('.ui-widget-overlay').bind('click',function(){
					$(self).dialog('close');
				});

				dataTextArea.hide();
				$('#show-graph-dialog-button').css('display','none');
			},
			close: function(){
				var self = this;
				$(self).dialog('destroy').remove();
			}
		});

		//to support multiline header setting it directly
		dialogHolder.closest(".ui-dialog").find(".ui-dialog-title").html(headerText);
	});
});

/**
 * Used for collection updated, deleted and created rows from provided {cbiSection} with provided {sectionId}.
 * Parameters {cbiSection} and {sectionId} are both jQuery objects.
 * This function returns jQuery object "form" with hidden fields according to collected values.
 */
function collectFormSend(cbiSection, sectionId) {
	var multiForm = $('<form>', {'method': 'post', 'action': mmxSelfUrl, 'target': '_self'});
	if (cbiSection.children('.cbi-section-node').length == 1) {
		var sectionNode = cbiSection.children('.cbi-section-node');
		console.log("Setting scalar values for " + sectionId);
		sectionNode.children('.cbi-value').each(function(){
			var mmxField = $(this).find('.mmx-field');
			if (mmxField.length == 1 && mmxField.hasClass('mmx-changed')) {
				var paramValue = mmxExtractValue(mmxField);
				var paramName = mmxField.attr('name');
				console.log(' --- field ' + paramName + ' = ' + paramValue);
				multiForm.append($('<input>', {
					'name': sectionId + paramName, 'type': 'hidden', 'value': paramValue
				}));
			}
		});
	} else if (cbiSection.children('.cbi-section-table').length == 1) {
		var sectionTable = $('.cbi-section-table#' + escapeJquery(sectionId));
		var rows = sectionTable.find('.cbi-section-table-row');
		rows.each(function(){
			var mmxAttr = $(this).attr('mmx-action');
			var rowId = $(this).attr('id');
			if (mmxAttr == 'update') {
				console.log('Edit ' + rowId);
				$(this).children('.cbi-value-field').each(function(){
					var colValueHolder = $(this).children('.value-holder');
					if ($(this).children('.value-holder').length == 1 && colValueHolder.find('.mmx-field').hasClass('mmx-changed')) {
						var paramValue = mmxExtractValue(colValueHolder.find('.mmx-field'));
						var paramName = colValueHolder.find('.mmx-field').attr('name');
						console.log(' --- field ' + paramName + ' = ' + paramValue);
						multiForm.append($('<input>', {
							'name': rowId + paramName, 'type': 'hidden', 'value': paramValue
						}));
					}
				});
			} else if (mmxAttr == 'delete') {
				console.log('Delete ' + $(this).attr('id'));
				multiForm.append($('<input>', {
					'name': $(this).attr('id'), 'type': 'hidden', 'value': 'delete'
				}));
			} else if (mmxAttr == 'create') {
				console.log('Create ' + $(this).attr('id'));
				$(this).children('.cbi-value-field').each(function(){
					var colValueHolder = $(this).children('.value-holder');
					if ($(this).children('.value-holder').length == 1) {
						var paramValue = mmxExtractValue(colValueHolder.children('.mmx-field'));
						var paramName = colValueHolder.children('.mmx-field').attr('name');
						console.log(' --- field ' + paramName + ' = ' + paramValue);
						multiForm.append($('<input>', {
							'name': 'add' + globalCreateIndexer + '_' + rowId + paramName, 'type': 'hidden', 'value': paramValue
						}));
					}
				});
				globalCreateIndexer++;
			}
		});
	}
	console.log(multiForm);
	return multiForm;
}

/**
 * Used for extracting values from any field in mmx tables/scalars,
 * because field can be anything, but must have class mmx-field and must be supported in this function.
 * 
 * @param jquery-wrapper of mmx field
 * @return mixed 
 */
function mmxExtractValue(field) {
	if (field.attr('type') == 'checkbox') {
		return ((field.is(':checked')) ? 'true' : 'false');
	} else {
		return field.val();
	}
}

function escapeJquery(str) {
	return str.replace(/(\{|\}|\.|\:)/g, "\\$1");
}

function getAttributes(jqueryObject) {
	var retAttrs = {};
	var obj = jqueryObject[0];
	$.each(obj.attributes, function() {
		if (this.specified) {
			retAttrs[this.name] = this.value;
		}
	});
	return retAttrs;
}

/**
 * Used for appling simple all-sufficient operations.
 * This function submits form with given {operationName} set to true
 * 
 * @param operationName fully qualified name of operation to apply
 */
function applyOperation(operationName){
	var simpleForm = $('<form>', {'method': 'post', 'action': mmxSelfUrl, 'target': '_self'});

	var paramInput = $('<input>', {'name': operationName, 'type': 'hidden', 'value': true});
	simpleForm.append(paramInput);
	simpleForm.append($('<input>', {'name':'action','type':'hidden','value':'forms'}));
	simpleForm.appendTo('body').submit();
}

/**
* Builds graph and appends it to given element
*
* @param where Id of element or element itself to put graph inside
* @param dataFormat Format of input data for graph. Possible values 'xy_data', 'yx_data', 'y_data'
* @param x_name Label for X axis
* @param x_min Minimal value of x to display
* @param x_max Maximum value of x to display
* @param y_name Label for Y axis
* @param y_min Minimal value of y to display
* @param y_max Maximum value of y to display
* @param rawData Data to build graph in given format
*/
function appendGraph(
	where, dataFormat, 
	x_name, x_min, x_max,
	y_name, y_min, y_max,
	rawData) {

	var numberOfTicks = 16;

	var parsedData = parseData(dataFormat, rawData);

	//sort data or chartist will lose some values
	parsedData.sort(function(point1, point2) {
		if(point1.x < point2.x) return -1

		if(point1.x > point2.x) return 1

		return 0
	})

	var data = {
		series: [parsedData]
	};

	//calculate x-axis size dynamicly
	if(!x_max) {
		//getting number of entries in data (some browsers don't support Object.keys().length)
		var count = 0;
		for(key in parsedData) {
			if(parsedData.hasOwnProperty(key)) {
				count++;
			}
		}
		//entries are sorted so last element has the largest value
		x_max = parsedData[count - 1].x
	}

	var options = {
		showPoint: false,
		lineSmooth: true,
		showArea: true,

		//to fix bug with label clipping 
		chartPadding: {
			right: 30,
			left: 30,
			bottom: 30
		},

		axisX: {
			type: Chartist.FixedScaleAxis,
			low: x_min,
			high: x_max,
			ticks: generateTicks(x_min, x_max, numberOfTicks)
		},
		axisY: {
			type: Chartist.FixedScaleAxis,
			onlyInteger: true,
			low: y_min,
			high: y_max,
			ticks: generateTicks(y_min, y_max, numberOfTicks)
		},

		plugins: [
			Chartist.plugins.ctAxisTitle({
				axisX: {
					axisTitle: x_name,
					offset: {x: 0, y: 35},
				},
				axisY: {
					axisTitle: y_name,
					offset: {x: 0, y: -10},
				} 
			})
		]	
	}	

	new Chartist.Line(where, data, options);
}

/**
* Generates integer ticks for axis
*
* @param min Minimal value for axis
* @param max Maximum value for axis
* @param numberOfTicks Number of ticks to generate
* @return Array of point in following format: [{x:x_coord1, y:y_coord1}, ..., {x:x_coordN, y:y_coordN}]
*/
function generateTicks(min, max, numberOfTicks) {
	var result = [];
	result.push(min);

	var tickSize = Math.round((max - min) / numberOfTicks);

	for (i = 0; i < numberOfTicks; i++) {
		result.push(tickSize * i);
	}

	result.push(max);

	return result
}

/**
* Parses data
*
* @param dataFormat Format of data. Possible values 'xy_data', 'yx_data', 'y_data'
* @param rawData Data in given format
* @return Array of point in following format: [{x:x_coord1, y:y_coord1}, ..., {x:x_coordN, y:y_coordN}]
*/
function parseData(dataFormat, rawData) {
	//choose data parser according to data format
	if (dataFormat == "xy_data") {
		parser = XYParser;
	} else if (dataFormat == "yx_data") {
		parser = YXParser;
	} else if (dataFormat == "y_data") {
		parser = YParser;
	} else {
		return []
	}

	var rawPairs = rawData.split(";");

	var result = [];

	//detect used separator between values in pairs
	var separator = (rawData.indexOf(",") > -1) ? "," : " ";

	for (i = 0; i < rawPairs.length; i++) {
		//parse only non-empty pairs
		if(rawPairs[i].trim()) {
			var point = parser(rawPairs[i], separator, i);

			result.push({x: point.x, y: point.y});
		}
	}

	return result
}

/**
* Parser for data in 'xy_data' format
* 
* @param pair One pair of values
* @param separator Separator for values in pair
* @param iteration Number of current iteration
* @return One point in following format: {x:x_coord1, y:y_coord1}
*/
function XYParser(pair, separator, iteration) {
	var values = pair.split(separator);

	var x = parseFloat(values[0]);
	var y = parseFloat(values[1]);

	return {x: x, y: y}
}

/**
* Parser for data in 'yx_data' format
* 
* @param pair One pair of values
* @param separator Separator for values in pair
* @param iteration Number of current iteration
* @return One point in following format: {x:x_coord1, y:y_coord1}
*/
function YXParser(pair, separator, iteration) {
	var values = pair.split(separator);

	var y = parseFloat(values[0]);
	var x = parseFloat(values[1]);

	return {x: x, y: y}
}

/**
* Parser for data in 'y_data' format
* 
* @param pair One pair of values
* @param separator Separator for values in pair
* @param iteration Number of current iteration
* @return One point in following format: {x:iteration_number, y:y_coord1}
*/
function YParser(pair, separator, iteration) {
	var y = parseFloat(pair);

	return {x: iteration, y: y}
}
