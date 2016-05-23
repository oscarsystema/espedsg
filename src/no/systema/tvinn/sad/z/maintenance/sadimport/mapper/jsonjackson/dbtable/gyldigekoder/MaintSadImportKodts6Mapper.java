/**
 * 
 */
package no.systema.tvinn.sad.z.maintenance.sadimport.mapper.jsonjackson.dbtable.gyldigekoder;

//jackson library
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.DeserializationConfig;
import org.codehaus.jackson.map.ObjectMapper;
//application library
import no.systema.tvinn.sad.z.maintenance.sadimport.model.jsonjackson.dbtable.gyldigekoder.JsonMaintSadImportKodts6Container;
import no.systema.tvinn.sad.z.maintenance.sadimport.model.jsonjackson.dbtable.gyldigekoder.JsonMaintSadImportKodts6Record;

//
import java.util.*;

/**
 * @author oscardelatorre
 * @date May 23, 2016
 * 
 */
public class MaintSadImportKodts6Mapper {
	private static final Logger logger = Logger.getLogger(MaintSadImportKodts6Mapper.class.getName());
	
	public JsonMaintSadImportKodts6Container getContainer(String utfPayload) throws Exception{
		ObjectMapper mapper = new ObjectMapper();  
		mapper.configure(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES,false);
		
		//At this point we now have an UTF-8 payload
		JsonMaintSadImportKodts6Container container = mapper.readValue(utfPayload.getBytes(), JsonMaintSadImportKodts6Container.class); 
		//logger.info("[JSON-String payload status=OK]  " + container.getUser());
		//DEBUG
		Collection<JsonMaintSadImportKodts6Record> list = container.getList();
		for(JsonMaintSadImportKodts6Record record : list){
			//logger.info(record.getKlikod());
		}
		return container;
	}
}
