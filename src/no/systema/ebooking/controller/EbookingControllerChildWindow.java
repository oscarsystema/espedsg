package no.systema.ebooking.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import no.systema.main.context.TdsAppContext;
import no.systema.main.model.SystemaWebUser;
import no.systema.main.model.jsonjackson.general.postalcodes.JsonPostalCodesContainer;
import no.systema.main.model.jsonjackson.general.postalcodes.JsonPostalCodesRecord;
import no.systema.main.service.UrlCgiProxyService;
import no.systema.main.util.AppConstants;
import no.systema.main.util.DateTimeManager;
import no.systema.main.util.JsonDebugger;
import no.systema.main.validator.LoginValidator;
import no.systema.transportdisp.model.jsonjackson.workflow.order.childwindow.JsonTransportDispDangerousGoodsContainer;
import no.systema.transportdisp.util.TransportDispConstants;
//ebooking
import no.systema.ebooking.url.store.EbookingUrlDataStore;
import no.systema.ebooking.util.EbookingConstants;
import no.systema.ebooking.service.EbookingChildWindowService;
import no.systema.ebooking.model.jsonjackson.order.childwindow.JsonEbookingCustomerContainer;
import no.systema.ebooking.model.jsonjackson.order.childwindow.JsonEbookingCustomerRecord;
import no.systema.ebooking.model.jsonjackson.order.childwindow.JsonEbookingLoadUnloadPlacesContainer;
import no.systema.ebooking.model.jsonjackson.order.childwindow.JsonEbookingLoadUnloadPlacesRecord;
import no.systema.ebooking.model.jsonjackson.order.childwindow.JsonEbookingPackingCodesContainer;
import no.systema.ebooking.model.jsonjackson.order.childwindow.JsonEbookingPackingCodesRecord;
import no.systema.ebooking.model.jsonjackson.order.childwindow.JsonEbookingDangerousGoodsContainer;
import no.systema.ebooking.model.jsonjackson.order.childwindow.JsonEbookingDangerousGoodsRecord;



/**
 * 
 * @author oscardelatorre
 * @date Feb 2, 2016
 */
@Controller
@SessionAttributes(AppConstants.SYSTEMA_WEB_USER_KEY)
@Scope("session")

public class EbookingControllerChildWindow {
	//Postal codes
	private final String DATATABLE_POSTALCODE_LIST = "postalCodeList";
	private final String POSTALCODE_DIRECTION = "direction";
	private final String DATATABLE_CUSTOMER_LIST = "customerList";
	private final String DATATABLE_LOAD_UNLOAD_PLACES_LIST = "loadUnloadPlacesList";
	private final String DATATABLE_PACKING_CODES_LIST = "packingCodesList";
	private final String DATATABLE_DANGEROUS_GOODS_LIST = "dangerousGoodsList";
	
	private static final Logger logger = Logger.getLogger(EbookingControllerChildWindow.class.getName());
	private static final JsonDebugger jsonDebugger = new JsonDebugger(2000);
	private DateTimeManager dateTimeManager = new DateTimeManager();
	
	
	private ModelAndView loginView = new ModelAndView("login");
	private ApplicationContext context;
	private LoginValidator loginValidator = new LoginValidator();
	
	 
	/**
	 * Postal Codes doInit
	 * 
	 * @param recordToValidate
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value="ebooking_childwindow_postalcodes.do", params="action=doInit",  method={RequestMethod.GET} )
	public ModelAndView doInitPostalCodes(@ModelAttribute ("record") JsonPostalCodesRecord recordToValidate, HttpSession session, HttpServletRequest request){
		this.context = TdsAppContext.getApplicationContext();
		logger.info("Inside: doInitPostalCodes");
		Map model = new HashMap();
		StringBuffer paramsRedirect = new StringBuffer();
		paramsRedirect.append("&direction=" + recordToValidate.getDirection());
		if(recordToValidate.getSt2lk()!=null && !"".equals(recordToValidate.getSt2lk())){
			paramsRedirect.append("&st2lk=" + recordToValidate.getSt2lk());
		}
		if(recordToValidate.getSt2kod()!=null && !"".equals(recordToValidate.getSt2kod())){
			paramsRedirect.append("&st2kod=" + recordToValidate.getSt2kod());
		}
		if(recordToValidate.getCaller()!=null && !"".equals(recordToValidate.getCaller())){
			paramsRedirect.append("&caller=" + recordToValidate.getCaller());
		}
		
		ModelAndView successView = new ModelAndView("redirect:ebooking_childwindow_postalcodes.do?action=doFind" + paramsRedirect.toString());
		SystemaWebUser appUser = this.loginValidator.getValidUser(session);
		//check user (should be in session already)
		if(appUser==null){
			return this.loginView;
			
		}else{
			logger.info(Calendar.getInstance().getTime() + " CONTROLLER start - timestamp");
			model.put(this.POSTALCODE_DIRECTION, recordToValidate.getDirection());
			model.put(EbookingConstants.DOMAIN_RECORD, recordToValidate);
			
			successView.addObject(EbookingConstants.DOMAIN_MODEL , model);
	    	return successView;
		}
	}	
	
	/**
	 * Postal Codes
	 * @param recordToValidate
	 * @param bindingResult
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value="ebooking_childwindow_postalcodes.do", params="action=doFind",  method={RequestMethod.GET, RequestMethod.POST} )
	public ModelAndView doFindPostalCodes(@ModelAttribute ("record") JsonPostalCodesRecord recordToValidate, BindingResult bindingResult, HttpSession session, HttpServletRequest request){
		this.context = TdsAppContext.getApplicationContext();
		logger.info("Inside: doFindPostalCodes");
		Collection outputList = new ArrayList();
		Map model = new HashMap();
		
		ModelAndView successView = new ModelAndView("ebooking_childwindow_postalcodes");
		SystemaWebUser appUser = this.loginValidator.getValidUser(session);
		//check user (should be in session already)
		if(appUser==null){
			return loginView;

		}else{
			logger.info(Calendar.getInstance().getTime() + " CONTROLLER start - timestamp");
			//-----------
			//Validation
			//-----------
			/*XXChildWindowSearchCustomerValidator validator = new XXChildWindowSearchCustomerValidator();
			logger.info("Host via HttpServletRequest.getHeader('Host'): " + request.getHeader("Host"));
		    validator.validate(recordToValidate, bindingResult);
		    */
			
		    //check for ERRORS
			if(bindingResult.hasErrors()){
	    		logger.info("[ERROR Validation] search-filter does not validate)");
	    		//put domain objects and do go back to the successView from here
	    		//this.setCodeDropDownMgr(appUser, model);
	    		model.put(EbookingConstants.DOMAIN_RECORD, recordToValidate);
				successView.addObject(EbookingConstants.DOMAIN_MODEL, model);
				return successView;
	    		
		    }else{
		    	
		    	boolean exactMatch = false;
		    	Collection<JsonPostalCodesRecord> list = this.fetchPostalCodes(appUser.getUser(), recordToValidate, exactMatch);
		    	
		    	model.put(this.DATATABLE_POSTALCODE_LIST, list);
	    		model.put(EbookingConstants.DOMAIN_RECORD, recordToValidate);
    			model.put(this.POSTALCODE_DIRECTION, recordToValidate.getDirection());
	    			
    			successView.addObject(EbookingConstants.DOMAIN_MODEL , model);
				logger.info(Calendar.getInstance().getTime() + " CONTROLLER end - timestamp");
				return successView;
		    		
		    }
		}
	}
	/**
	 * 
	 * @param recordToValidate
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value="ebooking_childwindow_customer.do", params="action=doInit",  method={RequestMethod.GET} )
	public ModelAndView doInitCustomer(@ModelAttribute ("record") JsonEbookingCustomerContainer recordToValidate, HttpSession session, HttpServletRequest request){
		this.context = TdsAppContext.getApplicationContext();
		logger.info("Inside: doInitCustomer");
		Map model = new HashMap();
		ModelAndView successView = new ModelAndView("ebooking_childwindow_customer");
		SystemaWebUser appUser = this.loginValidator.getValidUser(session);
		//check user (should be in session already)
		if(appUser==null){
			return this.loginView;
			
		}else{
			logger.info(Calendar.getInstance().getTime() + " CONTROLLER start - timestamp");
			model.put(EbookingConstants.DOMAIN_CONTAINER, recordToValidate);
			successView.addObject(EbookingConstants.DOMAIN_MODEL , model);
	    		return successView;
		}
	}	
	
	/**
	 * Customer
	 * 
	 * @param recordToValidate
	 * @param bindingResult
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value="ebooking_childwindow_customer.do", params="action=doFind",  method={RequestMethod.GET, RequestMethod.POST} )
	public ModelAndView doFindCustomer(@ModelAttribute ("record") JsonEbookingCustomerContainer recordToValidate, BindingResult bindingResult, HttpSession session, HttpServletRequest request){
		this.context = TdsAppContext.getApplicationContext();
		logger.info("Inside: doFindCustomer");
		Collection outputList = new ArrayList();
		Map model = new HashMap();
		ModelAndView successView = new ModelAndView("ebooking_childwindow_customer");
		SystemaWebUser appUser = this.loginValidator.getValidUser(session);
		//check user (should be in session already)
		if(appUser==null){
			return loginView;
			
		}else{
			//appUser.setActiveMenu(SystemaWebUser.ACTIVE_MENU_FRAKTKALKULATOR);
			logger.info(Calendar.getInstance().getTime() + " CONTROLLER start - timestamp");
			
			//-----------
			//Validation
			//-----------
			/*FraktkalkulatorChildWindowSearchCustomerValidator validator = new FraktkalkulatorChildWindowSearchCustomerValidator();
			logger.info("Host via HttpServletRequest.getHeader('Host'): " + request.getHeader("Host"));
		    validator.validate(recordToValidate, bindingResult);
		    */
		    //check for ERRORS
			if(bindingResult.hasErrors()){
		    		logger.info("[ERROR Validation] search-filter does not validate)");
		    		//put domain objects and do go back to the successView from here
		    		//this.setCodeDropDownMgr(appUser, model);
		    		model.put(EbookingConstants.DOMAIN_CONTAINER, recordToValidate);
				successView.addObject(EbookingConstants.DOMAIN_MODEL, model);
				return successView;
	    		
		    }else{
				
		    		//prepare the access CGI with RPG back-end
		    		String BASE_URL = EbookingUrlDataStore.EBOOKING_BASE_CHILDWINDOW_CUSTOMER_URL;
		    		String urlRequestParamsKeys = this.getRequestUrlKeyParametersSearchChildWindow(recordToValidate, appUser);
		    		logger.info("URL: " + BASE_URL);
		    		logger.info("PARAMS: " + urlRequestParamsKeys);
		    		logger.info(Calendar.getInstance().getTime() +  " CGI-start timestamp");
		    		String jsonPayload = this.urlCgiProxyService.getJsonContent(BASE_URL, urlRequestParamsKeys);
		    		//Debug -->
			    	logger.debug(jsonDebugger.debugJsonPayloadWithLog4J(jsonPayload));
		    		logger.info(Calendar.getInstance().getTime() +  " CGI-end timestamp");
			    
		    		if(jsonPayload!=null){
		    			JsonEbookingCustomerContainer container = this.ebookingChildWindowService.getCustomerContainer(jsonPayload);
			    		if(container!=null){
			    			List<JsonEbookingCustomerRecord> list = new ArrayList<JsonEbookingCustomerRecord>();
			    			for(JsonEbookingCustomerRecord  record : container.getInqcustomer()){
			    				//logger.info("CUSTOMER NO: " + record.getKundnr());
			    				//logger.info("NAME: " + record.getNavn());
			    				list.add(record);
			    			}
			    			model.put(this.DATATABLE_CUSTOMER_LIST, list);
			    			model.put(EbookingConstants.DOMAIN_CONTAINER, recordToValidate);
			    		}
		    			successView.addObject(EbookingConstants.DOMAIN_MODEL , model);
					logger.info(Calendar.getInstance().getTime() + " CONTROLLER end - timestamp");
					return successView;
					
			    	}else{
					logger.fatal("NO CONTENT on jsonPayload from URL... ??? <Null>");
					return loginView;
				}
				
		    }
		}
	}
	
	/**
	 * 
	 * @param recordToValidate
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value="ebooking_childwindow_loadunloadplaces.do", params="action=doInit",  method={RequestMethod.GET} )
	public ModelAndView doInitLoadUloadPlaces(@ModelAttribute ("record") JsonEbookingLoadUnloadPlacesContainer recordToValidate, HttpSession session, HttpServletRequest request){
		this.context = TdsAppContext.getApplicationContext();
		logger.info("Inside: doInitLoadUloadPlaces");
		Map model = new HashMap();
		ModelAndView successView = new ModelAndView("ebooking_childwindow_loadunloadplaces");
		SystemaWebUser appUser = this.loginValidator.getValidUser(session);
		
		//check user (should be in session already)
		if(appUser==null){
			return this.loginView;
			
		}else{
			logger.info(Calendar.getInstance().getTime() + " CONTROLLER start - timestamp");
			model.put(EbookingConstants.DOMAIN_CONTAINER, recordToValidate);
			successView.addObject(EbookingConstants.DOMAIN_MODEL , model);
	    		return successView;
		}
	}	
	
	/**
	 * 
	 * @param recordToValidate
	 * @param bindingResult
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value="ebooking_childwindow_loadunloadplaces.do", params="action=doFind",  method={RequestMethod.GET, RequestMethod.POST} )
	public ModelAndView doFindLoadUnloadPlaces(@ModelAttribute ("record") JsonEbookingLoadUnloadPlacesContainer recordToValidate, BindingResult bindingResult, HttpSession session, HttpServletRequest request){
		this.context = TdsAppContext.getApplicationContext();
		logger.info("Inside: doFindLoadUploadPlaces");
		Collection outputList = new ArrayList();
		Map model = new HashMap();
		ModelAndView successView = new ModelAndView("ebooking_childwindow_loadunloadplaces");
		SystemaWebUser appUser = this.loginValidator.getValidUser(session);
		//check user (should be in session already)
		if(appUser==null){
			return loginView;
			
		}else{
			//appUser.setActiveMenu(SystemaWebUser.ACTIVE_MENU_FRAKTKALKULATOR);
			logger.info(Calendar.getInstance().getTime() + " CONTROLLER start - timestamp");
			
			//-----------
			//Validation
			//-----------
			/*FraktkalkulatorChildWindowSearchCustomerValidator validator = new FraktkalkulatorChildWindowSearchCustomerValidator();
			logger.info("Host via HttpServletRequest.getHeader('Host'): " + request.getHeader("Host"));
		    validator.validate(recordToValidate, bindingResult);
		    */
		    //check for ERRORS
			if(bindingResult.hasErrors()){
		    		logger.info("[ERROR Validation] search-filter does not validate)");
		    		//put domain objects and do go back to the successView from here
		    		//this.setCodeDropDownMgr(appUser, model);
		    		model.put(EbookingConstants.DOMAIN_CONTAINER, recordToValidate);
				successView.addObject(EbookingConstants.DOMAIN_MODEL, model);
				return successView;
	    		
		    }else{
				
		    		//prepare the access CGI with RPG back-end
		    		String BASE_URL = EbookingUrlDataStore.EBOOKING_BASE_CHILDWINDOW_LOAD_UNLOAD_PLACES_URL;
		    		String urlRequestParamsKeys = this.getRequestUrlKeyParametersSearchChildWindow(recordToValidate, appUser);
		    		logger.info("URL: " + BASE_URL);
		    		logger.info("PARAMS: " + urlRequestParamsKeys);
		    		logger.info(Calendar.getInstance().getTime() +  " CGI-start timestamp");
		    		String jsonPayload = this.urlCgiProxyService.getJsonContent(BASE_URL, urlRequestParamsKeys);
		    		//Debug -->
			    	logger.debug(jsonDebugger.debugJsonPayloadWithLog4J(jsonPayload));
		    		logger.info(Calendar.getInstance().getTime() +  " CGI-end timestamp");
			    
		    		if(jsonPayload!=null){
		    			JsonEbookingLoadUnloadPlacesContainer container = this.ebookingChildWindowService.getLoadUnloadPlacesContainer(jsonPayload);
			    		if(container!=null){
			    			List<JsonEbookingLoadUnloadPlacesRecord> list = new ArrayList<JsonEbookingLoadUnloadPlacesRecord>();
			    			for(JsonEbookingLoadUnloadPlacesRecord  record : container.getInqlosslass()){
			    				//logger.info("Load PLACE: " + record.getKotmnv());
			    				list.add(record);
			    			}
			    			model.put(this.DATATABLE_LOAD_UNLOAD_PLACES_LIST, list);
			    			model.put(EbookingConstants.DOMAIN_CONTAINER, recordToValidate);
			    		}
		    			successView.addObject(EbookingConstants.DOMAIN_MODEL , model);
					logger.info(Calendar.getInstance().getTime() + " CONTROLLER end - timestamp");
					return successView;
					
			    	}else{
					logger.fatal("NO CONTENT on jsonPayload from URL... ??? <Null>");
					return loginView;
				}
				
		    }
		}
	}
	
	/**
	 * 
	 * @param recordToValidate
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value="ebooking_childwindow_packingcodes.do", params="action=doInit",  method={RequestMethod.GET} )
	public ModelAndView doInitPackingCodes(@ModelAttribute ("record") JsonEbookingPackingCodesContainer recordToValidate, HttpSession session, HttpServletRequest request){
		this.context = TdsAppContext.getApplicationContext();
		logger.info("Inside: doInitPackingCodes");
		Map model = new HashMap();
		
		ModelAndView successView = new ModelAndView("ebooking_childwindow_packingcodes");
		SystemaWebUser appUser = this.loginValidator.getValidUser(session);
		//check user (should be in session already)
		if(appUser==null){
			return this.loginView;
			
		}else{
			logger.info(Calendar.getInstance().getTime() + " CONTROLLER start - timestamp");
			model.put(EbookingConstants.DOMAIN_RECORD, recordToValidate);
			successView.addObject(EbookingConstants.DOMAIN_MODEL , model);
	    		return successView;
		}
	}	
	
	/**
	 * 
	 * @param recordToValidate
	 * @param bindingResult
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value="ebooking_childwindow_packingcodes.do", params="action=doFind",  method={RequestMethod.GET, RequestMethod.POST} )
	public ModelAndView doFindPackingCodes(@ModelAttribute ("record") JsonEbookingPackingCodesContainer recordToValidate, BindingResult bindingResult, HttpSession session, HttpServletRequest request){
		this.context = TdsAppContext.getApplicationContext();
		logger.info("Inside: doFindPackingCodes");
		Collection<JsonEbookingPackingCodesRecord> outputList = new ArrayList();
		Map model = new HashMap();
		
		ModelAndView successView = new ModelAndView("ebooking_childwindow_packingcodes");
		SystemaWebUser appUser = this.loginValidator.getValidUser(session);
		//check user (should be in session already)
		if(appUser==null){
			return loginView;
			
		}else{
			logger.info(Calendar.getInstance().getTime() + " CONTROLLER start - timestamp");
		    //check for ERRORS
			if(bindingResult.hasErrors()){
	    		logger.info("[ERROR Validation] search-filter does not validate)");
	    		//put domain objects and do go back to the successView from here
	    		//this.setCodeDropDownMgr(appUser, model);
	    		model.put(EbookingConstants.DOMAIN_CONTAINER, recordToValidate);
				successView.addObject(EbookingConstants.DOMAIN_MODEL, model);
				return successView;
	    		
		    }else{
		    	String BASE_URL = EbookingUrlDataStore.EBOOKING_BASE_CHILDWINDOW_PACKING_CODES_URL;
		    	String urlRequestParamsKeys = this.getRequestUrlKeyParametersSearchChildWindow(recordToValidate, appUser);
				
		    	logger.info("URL: " + BASE_URL);
				logger.info("PARAMS: " + urlRequestParamsKeys);
				logger.info(Calendar.getInstance().getTime() +  " CGI-start timestamp");
				String jsonPayload = this.urlCgiProxyService.getJsonContent(BASE_URL, urlRequestParamsKeys);
				//Debug -->
		    	logger.debug(jsonDebugger.debugJsonPayloadWithLog4J(jsonPayload));
				logger.info(Calendar.getInstance().getTime() +  " CGI-end timestamp");
				
				if(jsonPayload!=null){
					JsonEbookingPackingCodesContainer container = this.ebookingChildWindowService.getPackingCodesContainer(jsonPayload);
		    			if(container!=null){
		    				outputList = container.getForpaknKoder();
		    			}
				}
		    	
    			model.put(this.DATATABLE_PACKING_CODES_LIST, outputList);
    			model.put(EbookingConstants.DOMAIN_CONTAINER, recordToValidate);
    			successView.addObject(EbookingConstants.DOMAIN_MODEL , model);
    			logger.info(Calendar.getInstance().getTime() + " CONTROLLER end - timestamp");
    			return successView;
				
		    }
			
		}
	}
	
	
	/**
	 * 
	 * @param recordToValidate
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value="ebooking_childwindow_dangerousgoods.do", params="action=doInit",  method={RequestMethod.GET} )
	public ModelAndView doInitDangerousGoods(@ModelAttribute ("record") JsonEbookingDangerousGoodsContainer recordToValidate, HttpSession session, HttpServletRequest request){
		this.context = TdsAppContext.getApplicationContext();
		logger.info("Inside: doInitDangerousGoods");
		Map model = new HashMap();
		
		ModelAndView successView = new ModelAndView("ebooking_childwindow_dangerousgoods");
		SystemaWebUser appUser = this.loginValidator.getValidUser(session);
		//check user (should be in session already)
		if(appUser==null){
			return this.loginView;
			
		}else{
			logger.info(Calendar.getInstance().getTime() + " CONTROLLER start - timestamp");
			model.put(EbookingConstants.DOMAIN_RECORD, recordToValidate);
			successView.addObject(EbookingConstants.DOMAIN_MODEL , model);
	    		return successView;
		}
	}	
	
	/**
	 * 
	 * @param recordToValidate
	 * @param bindingResult
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value="ebooking_childwindow_dangerousgoods.do", params="action=doFind",  method={RequestMethod.GET, RequestMethod.POST} )
	public ModelAndView doFindDangerousGoods(@ModelAttribute ("record") JsonEbookingDangerousGoodsContainer recordToValidate, BindingResult bindingResult, HttpSession session, HttpServletRequest request){
		this.context = TdsAppContext.getApplicationContext();
		logger.info("Inside: doFindDangerousGoods");
		Collection<JsonEbookingDangerousGoodsRecord> outputList = new ArrayList();
		Map model = new HashMap();
		
		ModelAndView successView = new ModelAndView("ebooking_childwindow_dangerousgoods");
		SystemaWebUser appUser = this.loginValidator.getValidUser(session);
		//check user (should be in session already)
		if(appUser==null){
			return loginView;
			
		}else{
			logger.info(Calendar.getInstance().getTime() + " CONTROLLER start - timestamp");
		    //check for ERRORS
			if(bindingResult.hasErrors()){
	    		logger.info("[ERROR Validation] search-filter does not validate)");
	    		//put domain objects and do go back to the successView from here
	    		//this.setCodeDropDownMgr(appUser, model);
	    		model.put(EbookingConstants.DOMAIN_CONTAINER, recordToValidate);
				successView.addObject(EbookingConstants.DOMAIN_MODEL, model);
				return successView;
	    		
		    }else{
		    	String BASE_URL = EbookingUrlDataStore.EBOOKING_BASE_CHILDWINDOW_DANGEROUS_GOODS_URL;
		    	String urlRequestParamsKeys = this.getRequestUrlKeyParametersSearchChildWindow(recordToValidate, appUser);
				
		    	logger.info("URL: " + BASE_URL);
				logger.info("PARAMS: " + urlRequestParamsKeys);
				logger.info(Calendar.getInstance().getTime() +  " CGI-start timestamp");
				String jsonPayload = this.urlCgiProxyService.getJsonContent(BASE_URL, urlRequestParamsKeys);
				//Debug -->
		    	logger.debug(jsonDebugger.debugJsonPayloadWithLog4J(jsonPayload));
				logger.info(Calendar.getInstance().getTime() +  " CGI-end timestamp");
				
				if(jsonPayload!=null){
					JsonEbookingDangerousGoodsContainer container = this.ebookingChildWindowService.getDangerousGoodsContainer(jsonPayload);
		    			if(container!=null){
		    				outputList = container.getUnNumbers();
		    			}
				}
		    	
    			model.put(this.DATATABLE_DANGEROUS_GOODS_LIST, outputList);
    			model.put(EbookingConstants.DOMAIN_CONTAINER, recordToValidate);
    			successView.addObject(EbookingConstants.DOMAIN_MODEL , model);
    			logger.info(Calendar.getInstance().getTime() + " CONTROLLER end - timestamp");
    			return successView;
				
		    }
			
		}
	}
	
		
	/**
	 * 	
	 * @param applicationUser
	 * @param recordToValidate
	 * @param exactMatch
	 * @return
	 */
	public Collection<JsonPostalCodesRecord> fetchPostalCodes (String applicationUser,JsonPostalCodesRecord recordToValidate, boolean exactMatch){
		Collection<JsonPostalCodesRecord> outputList = new ArrayList<JsonPostalCodesRecord>();
		//prepare the access CGI with RPG back-end
		String BASE_URL = EbookingUrlDataStore.EBOOKING_BASE_CHILDWINDOW_POSTAL_CODES_URL;
		String urlRequestParamsKeys = this.getRequestUrlKeyParametersSearchPostalCodes(applicationUser, recordToValidate, exactMatch);
		logger.info("URL: " + BASE_URL);
		logger.info("PARAMS: " + urlRequestParamsKeys);
		logger.info(Calendar.getInstance().getTime() +  " CGI-start timestamp");
		String jsonPayload = this.urlCgiProxyService.getJsonContent(BASE_URL, urlRequestParamsKeys);
		//Debug -->
		logger.debug(jsonDebugger.debugJsonPayloadWithLog4J(jsonPayload));
		logger.info(Calendar.getInstance().getTime() +  " CGI-end timestamp");
    
		if(jsonPayload!=null){
			JsonPostalCodesContainer container = this.ebookingChildWindowService.getPostalCodesContainer(jsonPayload);
    			if(container!=null){
    				outputList = container.getPostnrlist();
    				for(JsonPostalCodesRecord  record : outputList){
    				//DEBUG
    				}
    			}
		}	
		return outputList;
	}
	
	/**
	 * 
	 * @param applicationUser
	 * @param searchFilterRecord
	 * @param exactMatch
	 * @return
	 */
	private String getRequestUrlKeyParametersSearchPostalCodes(String applicationUser, JsonPostalCodesRecord searchFilterRecord, boolean exactMatch){
		final String POSTALCODE_DIRECTION_FRA = "fra";
		final String POSTALCODE_DIRECTION_TIL = "til";
		
		StringBuffer urlRequestParamsKeys = new StringBuffer();
		urlRequestParamsKeys.append("user=" + applicationUser);
		if(POSTALCODE_DIRECTION_FRA.equals(searchFilterRecord.getDirection())){
			urlRequestParamsKeys.append("&varlk=fralk");
			urlRequestParamsKeys.append("&varkod=fra");
		}else if(POSTALCODE_DIRECTION_TIL.equals(searchFilterRecord.getDirection())){
			urlRequestParamsKeys.append("&varlk=tillk");
			urlRequestParamsKeys.append("&varkod=til");
		}
		
		if(searchFilterRecord.getSt2lk()!=null && !"".equals(searchFilterRecord.getSt2lk())){
			urlRequestParamsKeys.append(EbookingConstants.URL_CHAR_DELIMETER_FOR_PARAMS_WITH_HTML_REQUEST + "soklk=" + searchFilterRecord.getSt2lk());
		}
		if(searchFilterRecord.getSt2nvn()!=null && !"".equals(searchFilterRecord.getSt2nvn())){
			urlRequestParamsKeys.append(EbookingConstants.URL_CHAR_DELIMETER_FOR_PARAMS_WITH_HTML_REQUEST + "soknvn=" + searchFilterRecord.getSt2nvn());
		}
		if(searchFilterRecord.getWskunpa()!=null && !"".equals(searchFilterRecord.getWskunpa())){
			urlRequestParamsKeys.append(EbookingConstants.URL_CHAR_DELIMETER_FOR_PARAMS_WITH_HTML_REQUEST + "wskunpa=" + searchFilterRecord.getWskunpa());
		}
		if(searchFilterRecord.getSt2kod()!=null && !"".equals(searchFilterRecord.getSt2kod())){
			urlRequestParamsKeys.append(EbookingConstants.URL_CHAR_DELIMETER_FOR_PARAMS_WITH_HTML_REQUEST + "sokkod=" + searchFilterRecord.getSt2kod());
		}
		if(exactMatch){
			urlRequestParamsKeys.append(EbookingConstants.URL_CHAR_DELIMETER_FOR_PARAMS_WITH_HTML_REQUEST + "getval=J");
		}
		
		return urlRequestParamsKeys.toString();
	}
	
	/**
	 * 
	 * @param searchFilter
	 * @param appUser
	 * @return
	 */
	private String getRequestUrlKeyParametersSearchChildWindow(JsonEbookingCustomerContainer searchFilter, SystemaWebUser appUser){
		StringBuffer urlRequestParamsKeys = new StringBuffer();
		urlRequestParamsKeys.append("user=" + appUser.getUser());
		
		if(searchFilter.getSokknr()!=null && !"".equals(searchFilter.getSokknr())){
			urlRequestParamsKeys.append(EbookingConstants.URL_CHAR_DELIMETER_FOR_PARAMS_WITH_HTML_REQUEST + "sokknr=" + searchFilter.getSokknr());
		}
		if(searchFilter.getSoknvn()!=null && !"".equals(searchFilter.getSoknvn())){
			urlRequestParamsKeys.append(EbookingConstants.URL_CHAR_DELIMETER_FOR_PARAMS_WITH_HTML_REQUEST + "soknvn=" + searchFilter.getSoknvn());
		}
		if(searchFilter.getKunpnsted()!=null && !"".equals(searchFilter.getKunpnsted())){
			urlRequestParamsKeys.append(EbookingConstants.URL_CHAR_DELIMETER_FOR_PARAMS_WITH_HTML_REQUEST + "kunpnsted=" + searchFilter.getKunpnsted());
		}
		if(searchFilter.getWsvarnv()!=null && !"".equals(searchFilter.getWsvarnv())){
			urlRequestParamsKeys.append(EbookingConstants.URL_CHAR_DELIMETER_FOR_PARAMS_WITH_HTML_REQUEST + "wsvarnv=" + searchFilter.getWsvarnv());
		}
		if(searchFilter.getMaxv()!=null && !"".equals(searchFilter.getMaxv())){
			urlRequestParamsKeys.append(EbookingConstants.URL_CHAR_DELIMETER_FOR_PARAMS_WITH_HTML_REQUEST + "maxv=" + searchFilter.getMaxv());
		}
		
		return urlRequestParamsKeys.toString();
	}

	/**
	 * 
	 * @param searchFilter
	 * @param appUser
	 * @return
	 */
	private String getRequestUrlKeyParametersSearchChildWindow(JsonEbookingLoadUnloadPlacesContainer searchFilter, SystemaWebUser appUser){
		StringBuffer urlRequestParamsKeys = new StringBuffer();
		urlRequestParamsKeys.append("user=" + appUser.getUser());
		
		if(searchFilter.getSoknvn()!=null && !"".equals(searchFilter.getSoknvn())){
			urlRequestParamsKeys.append(EbookingConstants.URL_CHAR_DELIMETER_FOR_PARAMS_WITH_HTML_REQUEST + "soknvn=" + searchFilter.getSoknvn());
		}
		if(searchFilter.getSokkod()!=null && !"".equals(searchFilter.getSokkod())){
			urlRequestParamsKeys.append(EbookingConstants.URL_CHAR_DELIMETER_FOR_PARAMS_WITH_HTML_REQUEST + "sokkod=" + searchFilter.getSokkod());
		}
		return urlRequestParamsKeys.toString();
	}
	
	/**
	 * 
	 * @param searchFilter
	 * @param appUser
	 * @return
	 */
	private String getRequestUrlKeyParametersSearchChildWindow(JsonEbookingPackingCodesContainer searchFilter, SystemaWebUser appUser){
		StringBuffer urlRequestParamsKeys = new StringBuffer();
		urlRequestParamsKeys.append("user=" + appUser.getUser());
		
		if(searchFilter.getKode()!=null && !"".equals(searchFilter.getKode())){
			urlRequestParamsKeys.append(EbookingConstants.URL_CHAR_DELIMETER_FOR_PARAMS_WITH_HTML_REQUEST + "kode=" + searchFilter.getKode());
		}
		if(searchFilter.getTekst()!=null && !"".equals(searchFilter.getTekst())){
			urlRequestParamsKeys.append(EbookingConstants.URL_CHAR_DELIMETER_FOR_PARAMS_WITH_HTML_REQUEST + "tekst=" + searchFilter.getTekst());
		}
		//urlRequestParamsKeys.append(TransportDispConstants.URL_CHAR_DELIMETER_FOR_PARAMS_WITH_HTML_REQUEST + "getval=J");
		urlRequestParamsKeys.append(EbookingConstants.URL_CHAR_DELIMETER_FOR_PARAMS_WITH_HTML_REQUEST + "fullinfo=J"); //always the max. nr of columns (as default)		

		return urlRequestParamsKeys.toString();
	}
	
	/**
	 * 
	 * @param searchFilter
	 * @param appUser
	 * @return
	 */
	private String getRequestUrlKeyParametersSearchChildWindow(JsonEbookingDangerousGoodsContainer searchFilter, SystemaWebUser appUser){
		StringBuffer urlRequestParamsKeys = new StringBuffer();
		urlRequestParamsKeys.append("user=" + appUser.getUser());
		
		if(searchFilter.getUnnr()!=null && !"".equals(searchFilter.getUnnr())){
			urlRequestParamsKeys.append(EbookingConstants.URL_CHAR_DELIMETER_FOR_PARAMS_WITH_HTML_REQUEST + "unnr=" + searchFilter.getUnnr());
		}
		//user=JOVO&unnr=1950=&embg=&indx=&getval=&fullinfo=J
		urlRequestParamsKeys.append(EbookingConstants.URL_CHAR_DELIMETER_FOR_PARAMS_WITH_HTML_REQUEST + "fullinfo=J"); //always the max. nr of columns (as default)
		
		return urlRequestParamsKeys.toString();
	}
	
	//SERVICES
	@Qualifier ("urlCgiProxyService")
	private UrlCgiProxyService urlCgiProxyService;
	@Autowired
	@Required
	public void setUrlCgiProxyService (UrlCgiProxyService value){ this.urlCgiProxyService = value; }
	public UrlCgiProxyService getUrlCgiProxyService(){ return this.urlCgiProxyService; }
	
	
	@Qualifier ("ebookingChildWindowService")
	private EbookingChildWindowService ebookingChildWindowService;
	@Autowired
	@Required
	public void setEbookingChildWindowService (EbookingChildWindowService value){ this.ebookingChildWindowService = value; }
	public EbookingChildWindowService getEbookingChildWindowService(){ return this.ebookingChildWindowService; }
	
}
