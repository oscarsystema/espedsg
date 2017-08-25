package no.systema.tror.url.store;

import no.systema.main.util.AppConstants;

/**
 * 
 * Static URLs
 * @author oscardelatorre
 * @date Jul 04, 2017
 * 
 * 
 */
public class TrorUrlDataStore {
	
	//----------------------------
	//[1] FETCH MAIN ORDER LIST
	//----------------------------
	//http://localhost:8080/syjservicestror/syjsHEADF_LITE.do?user=OSCAR&limit=100 (dftdg)
	static public String TROR_BASE_MAIN_ORDER_LIST_URL = AppConstants.HTTP_ROOT_SERVLET_JSERVICES + "/syjservicestror/syjsHEADF_LITE.do";
	
	//http://gw.systema.no/sycgip/syjsHEADF_LITE.do?user=OSCAR&heavd=1&heopd=11111 (mandatory fields)
	static public String TROR_BASE_FETCH_SPECIFIC_ORDER_URL = AppConstants.HTTP_ROOT_SERVLET_JSERVICES + "/syjservicestror/syjsHEADF.do";
		
	
	/**
	 * @Example SELECT http://gw.systema.no:8080/syjservicestror/syjsKODTVA.do?user=OSCAR
	 */
	static public String TROR_BASE_KODTVA_GET_LIST_URL = AppConstants.HTTP_ROOT_SERVLET_JSERVICES + "/syjservicestror/syjsKODTVA.do";
	
	/**
	 * @Example SELECT specific: http://gw.systema.no:8080/syjservicestror/syjsKUFAST.do?user=OSCAR&kftyp=PRODTYPE&kfkod=L
	 * @Example SELECT list: http://gw.systema.no:8080/syjservicestror/syjsKUFAST.do?user=OSCAR&kftyp=PRODTYPE
	 */
	static public String TROR_BASE_KUFAST_GET_LIST_URL = AppConstants.HTTP_ROOT_SERVLET_JSERVICES + "/syjservicestror/syjsKUFAST.do";

	
	//--------------------
	//[3] EDIT Order
	//mode=A  = Add
	//mode=U  = Update
	//mode=D  = Delete
	//OG et tillegg ...:
	//----------------------
	//http://gw.systema.no/syjservicestror/syjsHEADF_U.do?user=OSCAR&heavd=2&heopd=100&...
	static public String TROR_BASE_UPDATE_SPECIFIC_ORDER_URL = AppConstants.HTTP_ROOT_SERVLET_JSERVICES + "/syjservicestror/syjsHEADF_U.do?";
	
	/**
	//[2.1] Message Note management (Consignee, Carrier, Internal)
	static public String EBOOKING_BASE_WORKFLOW_FETCH_MAIN_ORDER_MESSAGE_NOTE_URL = AppConstants.HTTP_ROOT_CGI + "/sycgip/TJGE08R.pgm";
	//http://gw.systema.no/sycgip/TJGE08R.pgm?user=OSCAR&unik=75&reff=11&part=R (R=Receiver, G=Carrier, Blank=internal melding)
	//[2.2] Fraktbrev section (order lines)
	static public String EBOOKING_BASE_WORKFLOW_FETCH_LIST_MAIN_ORDER_FRAKTBREV_URL = AppConstants.HTTP_ROOT_CGI + "/sycgip/TJGE21R.pgm"; 	
	//http://gw.systema.no/sycgip/TJGE21R.pgm?user=OSCAR&unik=10001206&reff=TARZAN%20W&fbn=1
	static public String EBOOKING_BASE_WORKFLOW_FETCH_LINE_MAIN_ORDER_FRAKTBREV_URL = AppConstants.HTTP_ROOT_CGI + "/sycgip/TJGE22R.pgm"; 	
	//http://gw.systema.no/sycgip/TJGE22R.pgm?user=OSCAR&unik=10001201&reff=TARZAN%20X&fbn=1&lin=1
	static public String EBOOKING_BASE_WORKFLOW_UPDATE_LINE_MAIN_ORDER_FRAKTBREV_URL = AppConstants.HTTP_ROOT_CGI + "/sycgip/TJGE23R.pgm";
	//http://gw.systema.no/sycgip/TJGE23R.pgm?user=OSCAR&unik=10001206&reff=TARZAN W&fbn=1&lin=3&mode=A&...
	static public String EBOOKING_BASE_WORKFLOW_VALIDATE_LINE_MAIN_ORDER_FRAKTBREV_URL = AppConstants.HTTP_ROOT_CGI + "/sycgip/TJGE23RV.pgm";
	//http://gw.systema.no/sycgip/TJGE23RV.pgm?user=JOVO&avd=75&opd=19&fmmrk1=&fvant=1&fvpakn=&fvvt=TEST&fvvkt=&fvvol=&fvlm=&fvlm2=&fvlen=&fvbrd=&fvhoy=&ffunnr=1234&ffemb=&ffantk=1&ffante=1&ffenh=KGM
	static public String EBOOKING_BASE_WORKFLOW_VALIDATE_LINE_MAIN_ORDER_FRAKTBREV_2_URL = AppConstants.HTTP_ROOT_CGI + "/sycgip/TJGE23RV2.pgm";
	//http://gw.systema.no/sycgip/TJGE23RV2.pgm?user=JOVO&avd=75&opdtyp=OX&fmmrk1=&fvant=2&fvpakn=&fvvt=TEST&fvvkt=1000&fvlen=220&fvbrd=220&fvhoy=120&fvvol=&fvlm=&fvlm2=&ffunr=1234&ffemb=&ffantk=1&ffante=1&ffenh=KGM
	
	//------------
	//SEND ORDER
	//------------
	//http://gw.systema.no/sycgip/TBOK009R.pgm?user=OSCAR&HEUNIK=10001176
	static public String EBOOKING_BASE_SEND_SPECIFIC_ORDER_URL = AppConstants.HTTP_ROOT_CGI + "/sycgip/TBOK009R.pgm";
	**/

	//----------------
	//Child window
	//----------------
	/**
	//(FRA)-->http://gw.systema.no/sycgip/TJINQSTED.pgm?user=JOVO&varlk=FRALK&VARKOD=FRA&SOKLK=NO&WSKUNPA=A (A, P eller blank) 
	//(TIL)-->http://gw.systema.no/sycgip/TJINQSTED.pgm?user=JOVO&varlk=TILLK&VARKOD=TIL&SOKLK=NO&
	static public String EBOOKING_BASE_CHILDWINDOW_POSTAL_CODES_URL = AppConstants.HTTP_ROOT_CGI + "/sycgip/TJINQSTED.pgm";
	
	
	//Fakturakunde - replaces the good old fashioned customer search(not applicable in eBooking)
	static public String EBOOKING_BASE_CHILDWINDOW_CUSTOMER_URL = AppConstants.HTTP_ROOT_CGI + "/sycgip/TJINQFKU.pgm";
	//Fakturakunde adresser
	static public String EBOOKING_BASE_CHILDWINDOW_CUSTOMER_DELIVERY_ADDRESS_URL = AppConstants.HTTP_ROOT_CGI + "/sycgip/TJINQVADR.pgm";
	//http://gw.systema.no/sycgip/TJINQVADR.pgm?user=JOVO&wkundnr=7031&wvadrnr=1 
	//http://gw.systema.no/sycgip/TJINQVADR.pgm?user=JOVO&wkundnr=7031&wvadrna=A (Alfa search exact)
	**/
	
	//Customer (N/A)
	/**
	static public String EBOOKING_BASE_CHILDWINDOW_CUSTOMER_URL = AppConstants.HTTP_ROOT_CGI + "/sycgip/TJINQKUND.pgm";
	//http://gw.systema.no/sycgip/TJINQKUND.pgm?user=JOVO&sokknr=1 
	 **/
	//http://gw.systema.no:8080/syjservicesbcore/syjsKUNKO.do?user=OSCAR&kukun1=1
	static public String TROR_BASE_CHILDWINDOW_DELIVERY_ADDRESS_LANDIMPORT_SELLER_URL = AppConstants.HTTP_ROOT_SERVLET_JSERVICES + "/syjservicesbcore/syjsKUNKO.do";
	//http://gw.systema.no:8080/syjservicesbcore/syjsVADR.do?user=OSCAR&kundnr=4
	static public String TROR_BASE_CHILDWINDOW_DELIVERY_ADDRESS_LANDIMPORT_BUYER_URL = AppConstants.HTTP_ROOT_SERVLET_JSERVICES + "/syjservicesbcore/syjsVADR.do";
		
	/*
	static public String EBOOKING_BASE_CHILDWINDOW_LOAD_UNLOAD_PLACES_URL = AppConstants.HTTP_ROOT_CGI + "/sycgip/TJINQSDL.pgm";
	//http://gw.systema.no/sycgip/TJINQSDL.pgm?user=JOVO(return all)
	//http://gw.systema.no/sycgip/TJINQSDL.pgm?user=JOVO&soknvn=T... etc
	
	//---------------------------------------------------
	//[2] GENERAL CODES - for country (AS400 from TVINN) 
	//---------------------------------------------------
	static public String EBOOKING_CODES_URL = AppConstants.HTTP_ROOT_CGI + "/sycgip/TNOG005R.pgm"; 
	//http://gw.systema.no/sycgip/TNOG005R.pgm?user=OSCAR&typ=2 //country list
	**/
	
	//---------------------------------------------------
	//[1.1] GENERAL FUNCTIONS eg.(signature, other...) 
	//---------------------------------------------------
	//http://localhost:8080/syjservicesbcore/syjsKOFAST.do?user=OSCAR&kftyp=DELSYS
	static public String TROR_GENERAL_CODES_URL = AppConstants.HTTP_ROOT_SERVLET_JSERVICES + "/syjservicesbcore/syjsKOFAST.do";
	//http://gw.systema.no:8080/syjservicesbcore/syjsKODTLK.do?user=OSCAR
	static public String TROR_COUNTRY_CODES_URL = AppConstants.HTTP_ROOT_SERVLET_JSERVICES + "/syjservicesbcore/syjsKODTLK.do";
	//http://gw.systema.no:8080/syjservicestror/syjsKODTVA.do?user=OSCAR
	static public String TROR_CURRENCY_CODES_URL = AppConstants.HTTP_ROOT_SERVLET_JSERVICES + "/syjservicestror/syjsKODTVA.do";
	//http://gw.systema.no:8080/syjservicesbcore/syjsKODTOTY.do?user=OSCAR
	static public String TROR_OPPDRAGSTYPE_CODES_URL = AppConstants.HTTP_ROOT_SERVLET_JSERVICES + "/syjservicesbcore/syjsKODTOTY.do";
	//http://gw.systema.no:8080/syjservicestror/syjsKODTFR.do?user=OSCAR
	static public String TROR_INCOTERMS_CODES_URL = AppConstants.HTTP_ROOT_SERVLET_JSERVICES + "/syjservicestror/syjsKODTFR.do";
	//http://gw.systema.no:8080/syjservicestror/syjsKUFAST.do?user=OSCAR
	static public String TROR_PRODUCT_CODES_URL = AppConstants.HTTP_ROOT_SERVLET_JSERVICES + "/syjservicestror/syjsKUFAST.do";
	//http://gw.systema.no:8080/syjservicesbcore/syjsTRKODFR.do?user=OSCAR&tkunik=017
	static public String TROR_ENHET_CODES_URL = AppConstants.HTTP_ROOT_SERVLET_JSERVICES + "/syjservicesbcore/syjsTRKODFR.do";
	//http://gw.systema.no:8080/syjservicesbtror/syjsKODTSF.do?user=OSCAR
	static public String TROR_SIGNATURES_URL = AppConstants.HTTP_ROOT_SERVLET_JSERVICES + "/syjservicestror/syjsKODTSF.do";
		
			
	
	
	
}
