/**
 * 
 */
package no.systema.tvinn.sad.z.maintenance.sad.url.store;
import no.systema.main.util.AppConstants;
/**
 * 
 * Static URLs
 * @author oscardelatorre
 * @date Mar 20, 2016
 * 
 * 
 */
public final class TvinnSadMaintenanceUrlDataStoreGyldigeKoder {
	//--------------------------------------------
	//[1] FETCH DB Table list or Specific record
	//--------------------------------------------
	
	
	//SAD002_KODTSAR
	//ALL --> http://gw.systema.no:8080/syjservicestn/syjsSAD002_KODTSAR.do?user=OSCAR
	//ONE --> http://gw.systema.no:8080/syjservicestn/syjsSAD002_KODTSAR.do?user=OSCAR&ksakd=...
	static public String TVINN_SAD_MAINTENANCE_BASE_SAD002_KODTSAR_GET_LIST_URL = AppConstants.HTTP_ROOT_SERVLET_JSERVICES + "/syjservicestn/syjsSAD002_KODTSAR.do";
	
	/*
	//SAD002_KODTSBR
	//ALL --> http://gw.systema.no:8080/syjservicestn/syjsSAD002_KODTSBR.do?user=OSCAR
	//ONE --> http://gw.systema.no:8080/syjservicestn/syjsSAD002_KODTSBR.do?user=OSCAR&ksbkd=...
	static public String TVINN_SAD_MAINTENANCE_IMPORT_BASE_SAD002_KODTSBR_GET_LIST_URL = AppConstants.HTTP_ROOT_SERVLET_JSERVICES + "/syjservicestn/syjsSAD002_KODTSBR.do";
	
	//SAD002_KODTSDR
	//ALL --> http://gw.systema.no:8080/syjservicestn/syjsSAD002_KODTSDR.do?user=OSCAR
	//ONE --> http://gw.systema.no:8080/syjservicestn/syjsSAD002_KODTSDR.do?user=OSCAR&ksdls=...
	static public String TVINN_SAD_MAINTENANCE_IMPORT_BASE_SAD002_KODTSDR_GET_LIST_URL = AppConstants.HTTP_ROOT_SERVLET_JSERVICES + "/syjservicestn/syjsSAD002_KODTSDR.do";
	
	//SAD002_KODTSER
	//ALL --> http://gw.systema.no:8080/syjservicestn/syjsSAD002_KODTSER.do?user=OSCAR
	//ONE --> http://gw.systema.no:8080/syjservicestn/syjsSAD002_KODTSER.do?user=OSCAR&ksefyl=...
	static public String TVINN_SAD_MAINTENANCE_IMPORT_BASE_SAD002_KODTSER_GET_LIST_URL = AppConstants.HTTP_ROOT_SERVLET_JSERVICES + "/syjservicestn/syjsSAD002_KODTSER.do";

	//SAD002_KODTSOR
	//ALL --> http://gw.systema.no:8080/syjservicestn/syjsSAD002_KODTSOR.do?user=OSCAR
	//ONE --> http://gw.systema.no:8080/syjservicestn/syjsSAD002_KODTSOR.do?user=OSCAR&ksokd=...
	static public String TVINN_SAD_MAINTENANCE_IMPORT_BASE_SAD002_KODTSOR_GET_LIST_URL = AppConstants.HTTP_ROOT_SERVLET_JSERVICES + "/syjservicestn/syjsSAD002_KODTSOR.do";
*/
	
	//----------------------------------
	//[1] UPDATE DB record
	// mode = (U)pdate, (A)dd, (D)elete
	//----------------------------------
	
	//SAD002R_KODTSAR_U
	//ALL --> http://gw.systema.no:8080/syjservicestn/syjsSAD002_KODTSAR_U.do?user=OSCAR&mode=U&<record>attributes...
	static public String TVINN_SAD_MAINTENANCE_BASE_SAD002_KODTSAR_DML_UPDATE_URL = AppConstants.HTTP_ROOT_SERVLET_JSERVICES + "/syjservicestn/syjsSAD002_KODTSAR_U.do";
	
	/*
	//SAD002R_KODTSBR_U
	//ALL --> http://gw.systema.no:8080/syjservicestn/syjsSAD002_KODTSBR_U.do?user=OSCAR&mode=U&<record>attributes...
	static public String TVINN_SAD_MAINTENANCE_IMPORT_BASE_SAD002_KODTSBR_DML_UPDATE_URL = AppConstants.HTTP_ROOT_SERVLET_JSERVICES + "/syjservicestn/syjsSAD002_KODTSBR_U.do";
	
	//SAD002R_KODTSDR_U
	//ALL --> http://gw.systema.no:8080/syjservicestn/syjsSAD002_KODTSDR_U.do?user=OSCAR&mode=U&<record>attributes...
	static public String TVINN_SAD_MAINTENANCE_IMPORT_BASE_SAD002_KODTSDR_DML_UPDATE_URL = AppConstants.HTTP_ROOT_SERVLET_JSERVICES + "/syjservicestn/syjsSAD002_KODTSDR_U.do";
	
	//SAD002R_KODTSER_U
	//ALL --> http://gw.systema.no:8080/syjservicestn/syjsSAD002_KODTSBR_U.do?user=OSCAR&mode=U&<record>attributes...
	static public String TVINN_SAD_MAINTENANCE_IMPORT_BASE_SAD002_KODTSER_DML_UPDATE_URL = AppConstants.HTTP_ROOT_SERVLET_JSERVICES + "/syjservicestn/syjsSAD002_KODTSER_U.do";
	
	//SAD002R_KODTSOR_U
	//ALL --> http://gw.systema.no:8080/syjservicestn/syjsSAD002_KODTSOR_U.do?user=OSCAR&mode=U&<record>attributes...
	static public String TVINN_SAD_MAINTENANCE_IMPORT_BASE_SAD002_KODTSOR_DML_UPDATE_URL = AppConstants.HTTP_ROOT_SERVLET_JSERVICES + "/syjservicestn/syjsSAD002_KODTSOR_U.do";
	*/
}
