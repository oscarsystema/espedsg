/**
 * 
 */
package no.systema.z.main.maintenance.mapper.jsonjackson.dbtable;

//jackson library
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.DeserializationConfig;
import org.codehaus.jackson.map.ObjectMapper;
//application library
import no.systema.z.main.maintenance.model.jsonjackson.dbtable.JsonMaintMainKodtsfSyparfContainer;
import no.systema.z.main.maintenance.model.jsonjackson.dbtable.JsonMaintMainKodtsfSyparfRecord;
//
import java.util.*;

/**
 * @author oscardelatorre
 * @date Okt 17, 2016
 * 
 */
public class MaintMainKodtsfSyparfMapper {
	private static final Logger logger = Logger.getLogger(MaintMainKodtsfSyparfMapper.class.getName());
	
	public JsonMaintMainKodtsfSyparfContainer getContainer(String utfPayload) throws Exception{
		ObjectMapper mapper = new ObjectMapper();  
		mapper.configure(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES,false);
		
		//At this point we now have an UTF-8 payload
		JsonMaintMainKodtsfSyparfContainer container = mapper.readValue(utfPayload.getBytes(), JsonMaintMainKodtsfSyparfContainer.class); 
		//logger.info("[JSON-String payload status=OK]  " + container.getUser());
		//DEBUG
		Collection<JsonMaintMainKodtsfSyparfRecord> list = container.getList();
		for(JsonMaintMainKodtsfSyparfRecord record : list){
			//logger.info(record.getKlikod());
		}
		return container;
	}
}