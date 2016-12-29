/**
 * 
 */
package no.systema.z.main.maintenance.service;

import org.apache.log4j.Logger;

import no.systema.z.main.maintenance.mapper.jsonjackson.dbtable.MaintMainCundcMapper;
import no.systema.z.main.maintenance.mapper.jsonjackson.dbtable.MaintMainGenericMapper;
import no.systema.z.main.maintenance.model.jsonjackson.dbtable.JsonMaintMainChildWindowKofastContainer;
import no.systema.z.main.maintenance.model.jsonjackson.dbtable.JsonMaintMainCundcContainer;

/**
 * 
 * @author Fredrik Möller
 * @date Nov 22, 2016
 * 
 * 
 */
public class MaintMainChildWindowServiceImpl implements MaintMainChildWindowService {
	private static final Logger logger = Logger.getLogger(MaintMainChildWindowServiceImpl.class.getName());

	
	@Override
	public JsonMaintMainChildWindowKofastContainer getContainer(String utfPayload) {
		JsonMaintMainChildWindowKofastContainer container = null;
		try {
			MaintMainGenericMapper mapper = new MaintMainGenericMapper(new JsonMaintMainChildWindowKofastContainer());
			container = (JsonMaintMainChildWindowKofastContainer)mapper.getContainer(utfPayload);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return container;

	}

	
	//TODO:
	public JsonMaintMainCundcContainer doUpdate(String utfPayload) {
		JsonMaintMainCundcContainer container = null;
		try {
			MaintMainCundcMapper mapper = new MaintMainCundcMapper();
			container = mapper.getContainer(utfPayload);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return container;

	}

}