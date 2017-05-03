package no.systema.main.controller;


import java.util.*;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.context.annotation.Scope;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.web.bind.WebDataBinder;
//import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

//import no.systema.tds.service.MainHdTopicService;
import no.systema.main.validator.UserValidator;

//application imports
import no.systema.main.model.SystemaWebUser;
import no.systema.main.model.jsonjackson.JsonSystemaUserContainer;
import no.systema.main.model.jsonjackson.JsonSystemaUserRecord;
import no.systema.main.model.jsonjackson.JsonSystemaUserExtensionsMultiUserSwitchRecord;
import no.systema.main.model.jsonjackson.JsonFirmLoginContainer;
import no.systema.main.model.jsonjackson.JsonFirmLoginRecord;


import no.systema.main.service.UrlCgiProxyService;
import no.systema.main.service.login.SystemaWebLoginService;
import no.systema.main.service.FirmLoginService;

import no.systema.main.url.store.MainUrlDataStore;
import no.systema.main.util.AppConstants;




/**
 * Dashboard for Systema Web esped
 * 
 * @author oscardelatorre
 *
 */

@Controller
@Scope("session")
public class DashboardController {
	private static final Logger logger = Logger.getLogger(DashboardController.class.getName());
	
	private ModelAndView loginView = new ModelAndView("login");
	
	@InitBinder
    protected void initBinder(WebDataBinder binder) {
        binder.setValidator(new UserValidator());
    }
	
	
	/**
	 * This method is the point of entry for the whole Systema Web esped domain.
	 * 
	 * IMPORTANT! 
	 * Note the use of ModelAttribute annotation in order to have the validation errors out back in the JSP
	 * The name of the command object MUST be specified as in the method signature otherwise the <spring:hasBindErrors name="user"> in the login.jsp
	 * won't show the errors!
	 * 
	 * @param user
	 * @param result
	 * @param request
	 * @return
	 */
	@RequestMapping(value="logonDashboard.do", method= { RequestMethod.POST})
	public ModelAndView logon(@ModelAttribute (AppConstants.SYSTEMA_WEB_USER_KEY) SystemaWebUser appUser, BindingResult bindingResult, HttpSession session, HttpServletRequest request, HttpServletResponse response){
		ModelAndView successView = new ModelAndView("dashboard");
		Map model = new HashMap();
		
		if(appUser==null){
			return this.loginView;
		
		}else{
			//TEST from {catalina.home}..context.xml => logger.info(request.getServletContext().getInitParameter("xxx"));
			//TEST from {catalina.home}..application.properties => logger.info(ApplicationPropertiesUtil.getProperty("http.as400.root.cgi"));
			UserValidator validator = new UserValidator();
			//logger.info("Host via HttpServletRequest.getHeader('Host'): " + request.getHeader("Host"));
			
		    validator.validate(appUser, bindingResult);
		    if(bindingResult.hasErrors()){
			    	logger.info("[ERROR Fatal] User not valid (user/password ?)");
			    	//
			    	SystemaWebUser userForCssPurposes = new SystemaWebUser();
			    	userForCssPurposes.setCssEspedsg(AppConstants.CSS_ESPEDSG);
					model.put(AppConstants.SYSTEMA_WEB_USER_KEY, userForCssPurposes);
					this.loginView.addObject("model",model);
					
			    	//this.loginView.addObject("model", null);
			    	return loginView;
	
		    }else{
		    	//get the company code for the comming user
		    	//this routine was triggered by Totens upgrade (Jan-2017 V12). Ref. JOVOs requirement
		    	String companyCode = this.getCompanyCodeForLogin();
		    	
		    	//---------------------------
				//get BASE URL = RPG-PROGRAM
	            //---------------------------
				String BASE_URL = MainUrlDataStore.SYSTEMA_WEB_LOGIN_URL;
				
				//url params
				String urlRequestParamsKeys = this.getRequestUrlKeyParameters(appUser, companyCode);
				
				logger.info(Calendar.getInstance().getTime() + " CGI-start timestamp");
			    	logger.info("URL: " + BASE_URL);
			    	//don't show the pwd
			    	//int pwd = urlRequestParamsKeys.indexOf("&pwd");
			    	//String credentailsPwd = urlRequestParamsKeys.substring(pwd + 5);
			    	//logger.info("URL PARAMS: " + urlRequestParamsKeys.substring(0,pwd)+"&md5");
			    	logger.info("URL PARAMS: " + urlRequestParamsKeys);
			    	
			    	//--------------------------------------
			    	//EXECUTE the FETCH (RPG program) here
			    	//--------------------------------------
			    	try{
				    	String jsonPayload = this.urlCgiProxyService.getJsonContent(BASE_URL, urlRequestParamsKeys);
				    	//Debug --> 
				    	//System.out.println(jsonPayload);
				    	logger.info(jsonPayload);
				    	//logger.info(Calendar.getInstance().getTime() +  " CGI-end timestamp " + new StringBuilder(credentailsPwd).reverse().toString() + "carebum");
				    	logger.info(Calendar.getInstance().getTime() +  " CGI-end timestamp ");
				    	if(jsonPayload!=null){ 
				    		JsonSystemaUserContainer jsonSystemaUserContainer = this.systemaWebLoginService.getSystemaUserContainer(jsonPayload);
				    		//check for errors
				    		if(jsonSystemaUserContainer!=null){
				    			if(jsonSystemaUserContainer.getErrMsg()!=null && !"".equals(jsonSystemaUserContainer.getErrMsg())){
				    				logger.info("[ERROR Fatal] User not valid (user/password) Check your credentials...");
				    				this.setFatalAS400LoginError(model, jsonSystemaUserContainer.getErrMsg());
				    				this.loginView.addObject("model", model);
				    				return this.loginView;
				    			}else{
				    				this.setDashboardMenuObjectsInSession(session, jsonSystemaUserContainer);
				    				//hand-over to appUser from JsonUser
				    				this.doHandOverToSystemaWebUser(request, appUser, jsonSystemaUserContainer, companyCode);
				    				
				    			}
				    		}
				    	}else{
				    		String msg = "NO CONTENT on jsonPayload";
				    		logger.info("[ERROR Fatal] " + msg);
				    		this.setFatalAS400LoginError(model, msg);
	    					this.loginView.addObject("model", model);
						
	    					return loginView;
				    	}
				    	session.setAttribute(AppConstants.SYSTEMA_WEB_USER_KEY, appUser);
			    	}catch(Exception e){
			    		String msg = "NO CONNECTION:" + e.toString();
			    		logger.info("[ERROR Fatal] NO CONNECTION ");
			    		this.setFatalAS400LoginError(model, msg);
    					this.loginView.addObject("model", model);
					
					return loginView;
			    		
			    	}
			    	return successView;
		    }
		}
	}
	
	/**
	 * This method must be used as long as we use AS400 login service
	 * When migrating to JAVA services the method and procedure will be obsolete...
	 * 
	 * @return
	 */
	private String getCompanyCodeForLogin(){
		String companyCode = null;
		
		String FIRM_URL = MainUrlDataStore.SYSTEMA_WEB_FIRMLOGIN_URL;
    	String jsonFirmPayload = this.urlCgiProxyService.getJsonContent(FIRM_URL);
    	logger.info(FIRM_URL);
    	logger.info(jsonFirmPayload);
    	JsonFirmLoginContainer firmContainer = this.firmLoginService.getContainer(jsonFirmPayload);
    	for(JsonFirmLoginRecord record : firmContainer.getList()){
    		companyCode = record.getFifirm();
    	}
    	logger.info(companyCode);
    	return companyCode;
	}
	/**
	 * This is the only place in which the jsonUserContainer lends over its values to the global SystemWebUser object
	 * @param request
	 * @param appUser
	 * @param jsonSystemaUserContainer
	 * @param companyCode
	 * 
	 */
	private void doHandOverToSystemaWebUser(HttpServletRequest request, SystemaWebUser appUser, JsonSystemaUserContainer jsonSystemaUserContainer, String companyCode){
		
		//user values
		appUser.setUser(jsonSystemaUserContainer.getUser().toUpperCase());
		appUser.setUserName(jsonSystemaUserContainer.getUserName());
		appUser.setCompanyCode(companyCode);//fifirm in firm
		appUser.setUsrLang(jsonSystemaUserContainer.getUsrLang());
		appUser.setUserAS400(jsonSystemaUserContainer.getUsrAS400());
		appUser.setIntern(jsonSystemaUserContainer.getIntern());
		//customer values
		appUser.setCustNr(jsonSystemaUserContainer.getCustNr());
		appUser.setCustName(jsonSystemaUserContainer.getCustName());
		
		//logo and banner
		appUser.setLogo(jsonSystemaUserContainer.getLogo());
		appUser.setBanner(jsonSystemaUserContainer.getBanner());
		appUser.setSystemaLogo(jsonSystemaUserContainer.getSystemaLogo());
		appUser.setSignatur(jsonSystemaUserContainer.getSignatur());
		appUser.setFiland(jsonSystemaUserContainer.getFiland());
		
		/*logger.info("[INFO] user logo:" + appUser.getLogo() );
		logger.info("[INFO] user banner:" + appUser.getBanner() );
		logger.info("[INFO] user sign:" + appUser.getTdsSign() );
		logger.info("[INFO] user Systema logo:" + appUser.getSystemaLogo() );
		
		//end user - login url
		logger.info("[INFO] servlet host (on Login):" + appUser.getServletHost() );
		*/
		//User extensions
		if(jsonSystemaUserContainer.getArkivKodOpdList()!=null){
			appUser.setArkivKodOpdList(jsonSystemaUserContainer.getArkivKodOpdList());
		}
		if(jsonSystemaUserContainer.getArkivKodTurList()!=null){
			appUser.setArkivKodTurList(jsonSystemaUserContainer.getArkivKodTurList());
		}
		if(jsonSystemaUserContainer.getMultiUser()!=null){
			appUser.setMultiUser(jsonSystemaUserContainer.getMultiUser());
		}
		
		//This host parameter below is used for reaching external resources since images or other static resources
		//might be available either for internal ip-addresses or external but not both.
		//If the user reaches the login-page then he/she will reach static resources on this ip-address
		String host = this.getServletHostWithNoPort(request.getHeader("Host"));
		appUser.setServletHost("http://" + host);
		
		//get Cgi root in case we must have direct access to the AS400 services directly from a JSP (e.g. Use Case for print in eBooking)
		appUser.setHttpCgiRoot(AppConstants.HTTP_ROOT_CGI);
		//CSS
		appUser.setCssEspedsg(AppConstants.CSS_ESPEDSG);
		appUser.setCssEspedsgMaintenance(AppConstants.CSS_ESPEDSG_MAINTENANCE);
		
	}
	
	/**
	 * 
	 * @param rawValue
	 * @return
	 */
	private String getServletHostWithNoPort(String rawValue){
		String retval = rawValue;
		if(rawValue!=null){
			if(rawValue.contains(":")){
				int end = rawValue.indexOf(":");
				retval = rawValue.substring(0,end);
			}
		}
		
		return retval;
	}
	
	/**
	 * 
	 * @param appUser
	 * @param companyCode
	 * 
	 * @return
	 */
	private String getRequestUrlKeyParameters(SystemaWebUser appUser, String companyCode){
		StringBuffer urlRequestParamsKeys = null;
		
		if(appUser!=null){
			if( (appUser.getUser()!=null && !"".equals(appUser.getUser())) && (appUser.getPassword()!=null && !"".equals(appUser.getPassword()))){
				urlRequestParamsKeys = new StringBuffer();
				urlRequestParamsKeys.append("user=" + appUser.getUser());
				urlRequestParamsKeys.append(AppConstants.URL_CHAR_DELIMETER_FOR_PARAMS_WITH_HTML_REQUEST + "pwd=" + appUser.getPassword());
				if(companyCode!=null){
					urlRequestParamsKeys.append(AppConstants.URL_CHAR_DELIMETER_FOR_PARAMS_WITH_HTML_REQUEST + "firma=" + companyCode);
				}
			}
		}
		return urlRequestParamsKeys.toString();
	}
	
	/**
	 * Sets the domain objects (menu of program lists) in session. 
	 * Must be in session since different applications must get back to the dashboard.
	 *  
	 * @param session
	 * @param model
	 * @param jsonSystemaUserContainer
	 */
	private void setDashboardMenuObjectsInSession(HttpSession session, JsonSystemaUserContainer jsonSystemaUserContainer){
		//SET HEADER RECORDS  (from RPG)
		List list = new ArrayList();
		for (JsonSystemaUserRecord record : jsonSystemaUserContainer.getMenuList()){
			list.add(record);
			//logger.info("PrTxt:" + record.getPrTxt());
			//logger.info("Prog:" + record.getProg());
		}
		//model.put(Constants.DOMAIN_LIST, list);
		session.setAttribute(AppConstants.DOMAIN_LIST, list);

	}
	
	/**
	 * 
	 * @param model
	 * @param errorMessage
	 */
	private void setFatalAS400LoginError(Map model, String errorMessage){
		String errorAS400Suffix = " [AS400 error]";
		model.put(AppConstants.ASPECT_ERROR_MESSAGE, errorMessage + errorAS400Suffix);
	}
	
	
	
	
	
	//SERVICES
	@Qualifier ("urlCgiProxyService")
	private UrlCgiProxyService urlCgiProxyService;
	@Autowired
	@Required
	public void setUrlCgiProxyService (UrlCgiProxyService value){ this.urlCgiProxyService = value; }
	public UrlCgiProxyService getUrlCgiProxyService(){ return this.urlCgiProxyService; }
	
	
	@Qualifier ("systemaWebLoginService")
	private SystemaWebLoginService systemaWebLoginService;
	@Autowired
	@Required
	public void setSystemaWebLoginService (SystemaWebLoginService value){ this.systemaWebLoginService = value; }
	public SystemaWebLoginService getSystemaWebLoginService(){ return this.systemaWebLoginService; }
	
	
	@Qualifier ("firmLoginService")
	private FirmLoginService firmLoginService;
	@Autowired
	@Required
	public void setFirmLoginService (FirmLoginService value){ this.firmLoginService = value; }
	public FirmLoginService getFirmLoginService(){ return this.firmLoginService; }
	
	
	
		
}

	