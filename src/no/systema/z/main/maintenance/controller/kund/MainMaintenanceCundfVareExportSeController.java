package no.systema.z.main.maintenance.controller.kund;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import no.systema.jservices.common.dao.SadvareDao;
import no.systema.jservices.common.dao.SvewDao;
import no.systema.jservices.common.json.JsonDtoContainer;
import no.systema.jservices.common.json.JsonReader;
import no.systema.main.model.SystemaWebUser;
import no.systema.main.service.UrlCgiProxyService;
import no.systema.main.util.AppConstants;
import no.systema.main.util.JsonDebugger;
import no.systema.z.main.maintenance.mapper.url.request.UrlRequestParameterMapper;
import no.systema.z.main.maintenance.url.store.MaintenanceMainUrlDataStore;
import no.systema.z.main.maintenance.util.MainMaintenanceConstants;
import no.systema.z.main.maintenance.validator.MaintMainSadvareValidator;

/**
 * Controller for Export(se) for Vareregister in Kunderegister
 * 
 * 
 * @author Fredrik Möller
 * @date May 22, 2017
 * 
 * 
 */

@Controller
public class MainMaintenanceCundfVareExportSeController {
	private static final Logger logger = Logger.getLogger(MainMaintenanceCundfVareExportSeController.class.getName());
	private ModelAndView loginView = new ModelAndView("login");
	private static final JsonDebugger jsonDebugger = new JsonDebugger();
	private UrlRequestParameterMapper urlRequestParameterMapper = new UrlRequestParameterMapper();

	//TODO
	@RequestMapping(value = "mainmaintenancecundf_vareexp_se.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView doVareExportSe(HttpSession session, HttpServletRequest request) {
		ModelAndView successView = new ModelAndView("mainmaintenancecundf_vareexp_se_edit");
		SystemaWebUser appUser = (SystemaWebUser) session.getAttribute(AppConstants.SYSTEMA_WEB_USER_KEY);
		Map model = new HashMap();

		if (appUser == null) {
			return this.loginView;
		} else  {
			KundeSessionParams kundeSessionParams = (KundeSessionParams) session.getAttribute(MainMaintenanceConstants.KUNDE_SESSION_PARAMS);

			List<SvewDao> list = new ArrayList<SvewDao>();
			list = fetchList(appUser.getUser(), kundeSessionParams.getKundnr());

			model.put("kundnr", kundeSessionParams.getKundnr());
			model.put("firma", kundeSessionParams.getFirma());
			model.put(MainMaintenanceConstants.DOMAIN_LIST, list);

			successView.addObject(MainMaintenanceConstants.DOMAIN_MODEL, model);
			successView.addObject("tab_knavn_display", VkundControllerUtil.getTrimmedKnav(kundeSessionParams.getKnavn()));			
			
		}

		return successView;
	}

	//TODO
	@RequestMapping(value="mainmaintenancecundf_vareexp_se_edit.do", method={RequestMethod.GET, RequestMethod.POST })
	public ModelAndView mainmaintenancecundf_params_edit(@ModelAttribute ("record") SvewDao recordToValidate, BindingResult bindingResult, HttpSession session, HttpServletRequest request){
		ModelAndView successView = new ModelAndView("mainmaintenancecundf_vareexp_se_edit");
		SystemaWebUser appUser = (SystemaWebUser)session.getAttribute(AppConstants.SYSTEMA_WEB_USER_KEY);
		Map model = new HashMap();
		String action = request.getParameter("action");
		String updateId = request.getParameter("updateId");

		if (appUser == null) {
			return this.loginView;
		} else {
			KundeSessionParams kundeSessionParams = (KundeSessionParams) session.getAttribute(MainMaintenanceConstants.KUNDE_SESSION_PARAMS);
			adjustRecordToValidate(recordToValidate, kundeSessionParams);

			MaintMainSadvareValidator validator = new MaintMainSadvareValidator();
			if (MainMaintenanceConstants.ACTION_DELETE.equals(action)) {
				validator.validateDelete(recordToValidate, bindingResult);
			} else {
				validator.validate(recordToValidate, bindingResult);
			}
			if (bindingResult.hasErrors()) {
				logger.info("[ERROR Validation] Record does not validate)");
				if (updateId != null && !"".equals(updateId)) {
					// meaning bounced in an Update and not a Create new
					model.put("updateId", updateId);
				}
				model.put(MainMaintenanceConstants.DOMAIN_RECORD, recordToValidate);  //TODO This is a fucker!
			} else {
				StringBuffer errMsg = new StringBuffer();
				int dmlRetval = 0;
				
				if (MainMaintenanceConstants.ACTION_UPDATE.equals(action)) {
					if (updateId != null && !"".equals(updateId)) {
						dmlRetval = updateRecord(appUser, recordToValidate, MainMaintenanceConstants.MODE_UPDATE, errMsg);
					} else {
						dmlRetval = updateRecord(appUser, recordToValidate, MainMaintenanceConstants.MODE_ADD, errMsg);
					}
				} else if (MainMaintenanceConstants.ACTION_DELETE.equals(action)) {
					dmlRetval = updateRecord(appUser, recordToValidate, MainMaintenanceConstants.MODE_DELETE, errMsg);
				}
				// check for Update errors
				if (dmlRetval < 0) {
					logger.info("[ERROR DML] Record does not validate)");
					logger.info(" errMsg.toString()="+ errMsg.toString());
					model.put(MainMaintenanceConstants.ASPECT_ERROR_MESSAGE, errMsg.toString());
					logger.info("recordToValidate="+ReflectionToStringBuilder.toString(recordToValidate));

					//model.put(MainMaintenanceConstants.DOMAIN_RECORD, recordToValidate); //TODO This is a fucker!
					if (updateId != null && !"".equals(updateId)) {
						// meaning bounced in an Update and not a Create new
						model.put("updateId", updateId);
					}
				}

			}

			List<SvewDao> list = new ArrayList<SvewDao>();
			list = fetchList(appUser.getUser(),  kundeSessionParams.getKundnr());

			model.put("kundnr", kundeSessionParams.getKundnr());
			model.put("firma", kundeSessionParams.getFirma());
			model.put(MainMaintenanceConstants.DOMAIN_LIST, list);

			successView.addObject(MainMaintenanceConstants.DOMAIN_MODEL, model);
			successView.addObject("tab_knavn_display", VkundControllerUtil.getTrimmedKnav(kundeSessionParams.getKnavn()));			
			
			return successView;

		}

	}
	
	//TODO
	private int updateRecord(SystemaWebUser appUser, SvewDao record, String mode, StringBuffer errMsg) {
		int retval = 0;
		JsonReader<JsonDtoContainer<SvewDao>> jsonReader = new JsonReader<JsonDtoContainer<SvewDao>>();
		jsonReader.set(new JsonDtoContainer<SvewDao>());
		String BASE_URL = MaintenanceMainUrlDataStore.MAINTENANCE_MAIN_BASE_SADVARE_DML_UPDATE_URL;
		String urlRequestParamsKeys = "user=" + appUser.getUser() + "&mode=" + mode + "&lang=" +appUser.getUsrLang();
		String urlRequestParams = urlRequestParameterMapper.getUrlParameterValidString(record);
		urlRequestParams = urlRequestParamsKeys + urlRequestParams;

		logger.info(Calendar.getInstance().getTime() + " CGI-start timestamp");
		logger.info("URL: " + jsonDebugger.getBASE_URL_NoHostName(BASE_URL));
		logger.info("URL PARAMS: " + urlRequestParams);
		String jsonPayload = this.urlCgiProxyService.getJsonContent(BASE_URL, urlRequestParams);
		if (jsonPayload != null) {
			JsonDtoContainer<SvewDao> container = (JsonDtoContainer<SvewDao>) jsonReader.get(jsonPayload);
			if (container != null) {
				if (container.getErrMsg() != null && !"".equals(container.getErrMsg())) {
					errMsg.append(container.getErrMsg());
					retval = MainMaintenanceConstants.ERROR_CODE;
				}
			}			
		}

		return retval;
	}	
	
	
	private void adjustRecordToValidate(SvewDao recordToValidate, KundeSessionParams kundeSessionParams) {
		recordToValidate.setSvew_knnr(Integer.parseInt(kundeSessionParams.getKundnr()));
	}	
	
	
	private List<SvewDao> fetchList(String applicationUser, String kundnr) {
		JsonReader<JsonDtoContainer<SvewDao>> jsonReader = new JsonReader<JsonDtoContainer<SvewDao>>();
		jsonReader.set(new JsonDtoContainer<SvewDao>());
		String BASE_URL = MaintenanceMainUrlDataStore.MAINTENANCE_MAIN_BASE_SVEW_GET_URL;
		StringBuffer urlRequestParams = new StringBuffer();
		urlRequestParams.append("user=" + applicationUser);
		urlRequestParams.append("&svew_knnr=" + kundnr);

		logger.info(Calendar.getInstance().getTime() + " CGI-start timestamp");
		logger.info("URL: " + jsonDebugger.getBASE_URL_NoHostName(BASE_URL));
		logger.info("URL PARAMS: " + urlRequestParams);
		String jsonPayload = urlCgiProxyService.getJsonContent(BASE_URL, urlRequestParams.toString());
		logger.debug("jsonPayload="+jsonPayload);
		List<SvewDao> list = null;
		if (jsonPayload != null) {
			JsonDtoContainer<SvewDao> container = (JsonDtoContainer<SvewDao>) jsonReader.get(jsonPayload);
				if (container != null) {
					list = (List<SvewDao>) container.getDtoList();
				}
		}
		return list;
	}	
	
	// Wired - SERVICES
	@Qualifier("urlCgiProxyService")
	private UrlCgiProxyService urlCgiProxyService;
	@Autowired
	@Required
	public void setUrlCgiProxyService(UrlCgiProxyService value) {
		this.urlCgiProxyService = value;
	}
	public UrlCgiProxyService getUrlCgiProxyService() {
		return this.urlCgiProxyService;
	}


}