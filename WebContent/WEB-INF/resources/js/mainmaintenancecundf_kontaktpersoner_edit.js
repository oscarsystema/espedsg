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
		jq('#cphone').val("");
		jq('#cmobil').val("");
		jq('#cfax').val("");
		jq('#cemail').val("");
		jq('#clive').val("");
		jq('#cprint').val("");
		jq('#sonavn').val("");
		jq('#cemne').val("");
		jq('#cavd').val("");
		jq('#cavd1').val("");
		jq('#cavd2').val("");
		jq('#cavd3').val("");
		jq('#cavd4').val("");
		jq('#cavd5').val("");
		jq('#cavd6').val("");
		jq('#cavd7').val("");
		jq('#cavd8').val("");
		jq('#cavd9').val("");
		jq('#cavd10').val("");
		jq('#cavd11').val("");
		jq('#cavd12').val("");
		jq('#cavd13').val("");
		jq('#cavd14').val("");
		jq('#cavd15').val("");
		jq('#cavd16').val("");
		jq('#cavd17').val("");
		jq('#cavd18').val("");
		jq('#cavd19').val("");
		jq('#cavd20').val("");
		jq('#cavdio').val("");
		jq('#copd').val("");
		jq('#copd1').val("");
		jq('#copd2').val("");
		jq('#copd3').val("");
		jq('#copd4').val("");
		jq('#copd5').val("");
		jq('#copdio').val("");
		jq('#cmerge').val("");
		jq('#avkved1').val("");
		jq('#avkved2').val("");
		jq('#avkved3').val("");
		jq('#avkved4').val("");
		jq('#avkved5').val("");
		jq('#avkved6').val("");
		jq('#avkved7').val("");
		jq('#avkved8').val("");
		jq('#avkved9').val("");
		jq('#avkved10').val("");
		jq('#avkved11').val("");
		jq('#avkved12').val("");
		jq('#avkved13').val("");
		jq('#avkved14').val("");
		jq('#avkved15').val("");
		jq('#avkved16').val("");
		jq('#avkved17').val("");
		jq('#avkved18').val("");
		jq('#avkved19').val("");
		jq('#avkved20').val("");
		
		//for update
		jq('#updateId').val("");
		
	});
	
	
	jq('#copyRecordButton').click(function() {
		jq('#cconta').val(jq('#cconta').val() + " - <kopi>");
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
	
    jq('#ctypeIdLink').click(function() {
    	jq('#ctypeIdLink').attr('target','_blank');
    	window.open('mainmaintenance_vkund_edit_childwindow_codes.do?caller=ctype', "codeWin", "top=300px,left=500px,height=600px,width=800px,scrollbars=no,status=no,location=no");
    });	

    jq('#ctypeRefLink').click(function() {
    	jq('#ctypeRefLink').attr('target','_blank');
    	window.open('mainmaintenance_vkund_edit_childwindow_codes.do?caller=ctype_ref', "codeWin", "top=300px,left=500px,height=600px,width=800px,scrollbars=no,status=no,location=no");
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
	var cfirma = record[0];
	var ccompn = record[1];
	var cconta = record[2];
	var ctype = record[3];
	    	
	jq.ajax({
	  type: 'GET',
	  url: 'getSpecificRecord_cundc.do',
	  data: { applicationUser : jq('#applicationUser').val(), 
		  	  cfirma : cfirma,
		  	  ccompn : ccompn,
		  	  cconta : cconta,
		  	  ctype  : ctype },
	  dataType: 'json',
	  cache: false,
	  contentType: 'application/json',
	  success: function(data) {
	  	var len = data.length;
		for ( var i = 0; i < len; i++) {
			jq('#cconta').val("");jq('#cconta').val(data[i].cconta);
			jq('#ccontaorg').val("");jq('#ccontaorg').val(data[i].ccontaorg);
			jq('#ctype').val("");jq('#ctype').val(data[i].ctype);
			jq('#cphone').val("");jq('#cphone').val(data[i].cphone);
			jq('#cmobil').val("");jq('#cmobil').val(data[i].cmobil);
			jq('#cfax').val("");jq('#cfax').val(data[i].cfax);
			jq('#cemail').val("");jq('#cemail').val(data[i].cemail);
			jq('#clive').val("");jq('#clive').val(data[i].clive);
			jq('#cprint').val("");jq('#cprint').val(data[i].cprint);
			jq('#sonavn').val("");jq('#sonavn').val(data[i].sonavn);
			jq('#cemne').val("");jq('#cemne').val(data[i].cemne);
			jq('#cavd').val("");jq('#cavd').val(data[i].cavd);
			jq('#cavd1').val("");jq('#cavd1').val(data[i].cavd1);
			jq('#cavd2').val("");jq('#cavd2').val(data[i].cavd2);
			jq('#cavd3').val("");jq('#cavd3').val(data[i].cavd3);
			jq('#cavd4').val("");jq('#cavd4').val(data[i].cavd4);
			jq('#cavd5').val("");jq('#cavd5').val(data[i].cavd5);
			jq('#cavd6').val("");jq('#cavd6').val(data[i].cavd6);
			jq('#cavd7').val("");jq('#cavd7').val(data[i].cavd7);
			jq('#cavd8').val("");jq('#cavd8').val(data[i].cavd8);
			jq('#cavd9').val("");jq('#cavd9').val(data[i].cavd9);
			jq('#cavd10').val("");jq('#cavd10').val(data[i].cavd10);
			jq('#cavd11').val("");jq('#cavd11').val(data[i].cavd11);
			jq('#cavd12').val("");jq('#cavd12').val(data[i].cavd12);
			jq('#cavd13').val("");jq('#cavd13').val(data[i].cavd13);
			jq('#cavd14').val("");jq('#cavd14').val(data[i].cavd14);
			jq('#cavd15').val("");jq('#cavd15').val(data[i].cavd15);
			jq('#cavd16').val("");jq('#cavd16').val(data[i].cavd16);
			jq('#cavd17').val("");jq('#cavd17').val(data[i].cavd17);
			jq('#cavd18').val("");jq('#cavd18').val(data[i].cavd18);
			jq('#cavd19').val("");jq('#cavd19').val(data[i].cavd19);
			jq('#cavd20').val("");jq('#cavd20').val(data[i].cavd20);
			jq('#cavdio').val(""); jq('#cavdio').val(data[i].cavdio);
			jq('#copd').val("");jq('#copd').val(data[i].copd);
			jq('#copd1').val("");jq('#copd1').val(data[i].copd1);
			jq('#copd2').val("");jq('#copd2').val(data[i].copd2);
			jq('#copd3').val("");jq('#copd3').val(data[i].copd3);
			jq('#copd4').val("");jq('#copd4').val(data[i].copd4);
			jq('#copd5').val("");jq('#copd5').val(data[i].copd5);
			jq('#copdio').val("");jq('#copdio').val(data[i].copdio);
			jq('#cmerge').val("");jq('#cmerge').val(data[i].cmerge);
			jq('#avkved1').val("");jq('#avkved1').val(data[i].avkved1);
			jq('#avkved2').val("");jq('#avkved2').val(data[i].avkved2);
			jq('#avkved3').val("");jq('#avkved3').val(data[i].avkved3);
			jq('#avkved4').val("");jq('#avkved4').val(data[i].avkved4);
			jq('#avkved5').val("");jq('#avkved5').val(data[i].avkved5);
			jq('#avkved6').val("");jq('#avkved6').val(data[i].avkved6);
			jq('#avkved7').val("");jq('#avkved7').val(data[i].avkved7);
			jq('#avkved8').val("");jq('#avkved8').val(data[i].avkved8);
			jq('#avkved9').val("");jq('#avkved9').val(data[i].avkved9);
			jq('#avkved10').val("");jq('#avkved10').val(data[i].avkved10);
			jq('#avkved11').val("");jq('#avkved11').val(data[i].avkved11);
			jq('#avkved12').val("");jq('#avkved12').val(data[i].avkved12);
			jq('#avkved13').val("");jq('#avkved13').val(data[i].avkved13);
			jq('#avkved14').val("");jq('#avkved14').val(data[i].avkved14);
			jq('#avkved15').val("");jq('#avkved15').val(data[i].avkved15);
			jq('#avkved16').val("");jq('#avkved16').val(data[i].avkved16);
			jq('#avkved17').val("");jq('#avkved17').val(data[i].avkved17);
			jq('#avkved18').val("");jq('#avkved18').val(data[i].avkved18);
			jq('#avkved19').val("");jq('#avkved19').val(data[i].avkved19);
			jq('#avkved20').val("");jq('#avkved20').val(data[i].avkved20);
			jq('#avkved21').val("");jq('#avkved21').val(data[i].avkved21);
			jq('#avkved22').val("");jq('#avkved22').val(data[i].avkved22);
			jq('#avkved23').val("");jq('#avkved23').val(data[i].avkved23);
			jq('#avkved24').val("");jq('#avkved24').val(data[i].avkved24);
			jq('#avkved25').val("");jq('#avkved25').val(data[i].avkved25);
			jq('#avkved26').val("");jq('#avkved26').val(data[i].avkved26);
			jq('#avkved27').val("");jq('#avkved27').val(data[i].avkved27);
			jq('#avkved28').val("");jq('#avkved28').val(data[i].avkved28);
			jq('#avkved29').val("");jq('#avkved29').val(data[i].avkved29);
			jq('#avkved30').val("");jq('#avkved30').val(data[i].avkved30);
			
			//for a future update
			jq('#updateId').val("");jq('#updateId').val(data[i].cconta);
			
			//Enable Kopiere
			jq('#copyRecordButton').attr("disabled", false);
			
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