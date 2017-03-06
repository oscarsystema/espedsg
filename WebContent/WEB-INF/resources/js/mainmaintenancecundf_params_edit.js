//this variable is a global jQuery var instead of using "$" all the time. Very handy
var jq = jQuery.noConflict();
var counterIndex = 0;
var BLOCKUI_OVERLAY_MESSAGE_DEFAULT = "Please wait...";

function setBlockUI(element) {

	//jq("#dialog").dialog("open");  
	//Funkar inte att anropas rått. Behöver <div> alt .click

	if (jq("#dirty").val() == "isDirty") {

		alert("Du har ändrat, utan att spara. Vill du gå vidare.....");

	}

	jq.blockUI({
		message : BLOCKUI_OVERLAY_MESSAGE_DEFAULT
	});
}

jq(function() {
	//Clean values for createing new record
	jq('#newRecordButton').click(function() {
		jq('#cconta').val("")
		jq('#ctype').val("");
		
		//for update
		jq('#updateId').val("");
		
	});

	jq("#formRecord").submit(function() {
		jq.blockUI({
			message : BLOCKUI_OVERLAY_MESSAGE_DEFAULT
		});
	});

	jq("input[type='text']").change(function() {
		jq('#dirty').val("isDirty");

	});
	
    jq('#sypaidLink').click(function() {
    	jq('#sypaidLink').attr('target','_blank');
    	window.open('mainmaintenance_vkund_edit_childwindow_codes.do?caller=sypaid', "codeWin", "top=300px,left=500px,height=600px,width=800px,scrollbars=no,status=no,location=no");
    });	

	
}); 


//-----------------------
//GET specific db-record
//-----------------------

function getRecord(record){
	var rawId = record.id;
	var applicationUserParam = jq('#applicationUser').val();
	rawId = rawId.replace("recordUpdate_", "");
	var record = rawId.split('_');
	var sykunr = record[0];
	var syrecn = record[1];
	    	
	jq.ajax({
	  type: 'GET',
	  url: 'getSpecificRecord_syparf.do',
	  data: { applicationUser : jq('#applicationUser').val(), 
		  sykunr : sykunr,
		  syrecn  : syrecn },
	  dataType: 'json',
	  cache: false,
	  contentType: 'application/json',
	  success: function(data) {
	  	var len = data.length;
		for ( var i = 0; i < len; i++) {
			jq('#sypaid').val("");jq('#sypaid').val(data[i].sypaid);
			jq('#sypaidDesc').val("");jq('#sypaidDesc').val(data[i].sypaidDesc);
			jq('#sysort').val("");jq('#sysort').val(data[i].sysort);
			jq('#syvrdn').val("");jq('#syvrdn').val(data[i].syvrdn);
			jq('#syvrda').val("");jq('#syvrda').val(data[i].syvrda);
	
			//for a future update
			jq('#updateId').val("");jq('#updateId').val(data[i].sypaid);
			
			
		}
	  }, 
	  error: function() {
		  alert('Error loading ...');
	  }
	});
		
}


//-------------------
//Datatables jquery
//-------------------
//private function
function filterGlobal() {
	jq('#mainList').dataTable().search(jq('#mainList_filter').val()).draw();
}

jq(document).ready(function() {
	//init table (no ajax, no columns since the payload is already there by means of HTML produced on the back-end)
	jq('#mainList').dataTable({
		"dom" : '<"top">t<"bottom"flip><"clear">',
		"scrollY" : "200px",
		"scrollCollapse" : false,
		"columnDefs" : [ {
			"type" : "num",
			"targets" : 0
		} ],
		"lengthMenu" : [ 75, 100 ]
	});

});
