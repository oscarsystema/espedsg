/**
 * 
 */
package no.systema.skat.mapper.jsonjackson;

//jackson library
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.DeserializationConfig;
import org.codehaus.jackson.map.ObjectMapper;
//application library
import no.systema.skat.model.jsonjackson.JsonSkatAutoControlErrorContainer;
import java.util.*;

/**
 * @author oscardelatorre
 * @date Oct 28, 2015
 * 
 */
public class SkatAutoControlErrorMapper {
	private static final Logger logger = Logger.getLogger(SkatAutoControlErrorMapper.class.getName());
	
	/**
	 * 
	 * @param utfPayload
	 * @return
	 * @throws Exception
	 */
	public JsonSkatAutoControlErrorContainer getContainer(String utfPayload) throws Exception{
		ObjectMapper mapper = new ObjectMapper();  
		mapper.configure(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES,false);
		
		JsonSkatAutoControlErrorContainer container = null;
		
		if(utfPayload!=null){
			//At this point we now have an UTF-8 payload
			container = mapper.readValue(utfPayload.getBytes(), JsonSkatAutoControlErrorContainer.class); 
		}	
		return container;
	}
	
	
}
