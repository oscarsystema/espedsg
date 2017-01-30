/**
 * 
 */
package no.systema.ebooking.mapper.jsonjackson;

//jackson library
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.DeserializationConfig;
import org.codehaus.jackson.map.ObjectMapper;
//application library
import no.systema.ebooking.model.jsonjackson.JsonMainOrderHeaderContainer;
import no.systema.ebooking.model.jsonjackson.JsonMainOrderHeaderRecord;
import no.systema.ebooking.model.jsonjackson.JsonMainOrderHeaderFraktbrevContainer;
import no.systema.ebooking.model.jsonjackson.JsonMainOrderHeaderFraktbrevRecord;
import no.systema.ebooking.model.jsonjackson.JsonMainOrderHeaderCustomerDeliveryAddressContainer;
import no.systema.ebooking.model.jsonjackson.JsonMainOrderHeaderCustomerDeliveryAddressRecord;




/**
 * @author oscardelatorre
 * @date Jan 06, 2017
 * 
 */
public class JsonOrderHeaderMapper {
	private static final Logger logger = Logger.getLogger(JsonOrderHeaderMapper.class.getName());
	/**
	 * 
	 * @param utfPayload
	 * @return
	 * @throws Exception
	 */
	public JsonMainOrderHeaderContainer getContainer(String utfPayload) throws Exception{
		ObjectMapper mapper = new ObjectMapper();  
		mapper.configure(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES,false);
		//At this point we now have an UTF-8 payload
		JsonMainOrderHeaderContainer container = mapper.readValue(utfPayload.getBytes(), JsonMainOrderHeaderContainer.class); 
		logger.info("[JSON-String payload status=OK]  " + container.getUser());
		for (JsonMainOrderHeaderRecord record : container.getOneorder()){
			//DEBUG
		}
		
		return container;
	}
	/**
	 * 
	 * @param utfPayload
	 * @return
	 * @throws Exception
	 */
	public JsonMainOrderHeaderFraktbrevContainer getFraktbrevContainer(String utfPayload) throws Exception{
		ObjectMapper mapper = new ObjectMapper();  
		mapper.configure(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES,false);
		//At this point we now have an UTF-8 payload
		JsonMainOrderHeaderFraktbrevContainer container = mapper.readValue(utfPayload.getBytes(), JsonMainOrderHeaderFraktbrevContainer.class); 
		logger.info("[JSON-String payload status=OK]  " + container.getUser());
		for (JsonMainOrderHeaderFraktbrevRecord record : container.getAwblinelist()){
			//DEBUG
		}
		
		return container;
	}
	/**
	 * 
	 * @param utfPayload
	 * @return
	 * @throws Exception
	 */
	public JsonMainOrderHeaderCustomerDeliveryAddressContainer getDeliveryAddressContainer(String utfPayload) throws Exception{
		ObjectMapper mapper = new ObjectMapper();  
		mapper.configure(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES,false);
		//At this point we now have an UTF-8 payload
		JsonMainOrderHeaderCustomerDeliveryAddressContainer container = mapper.readValue(utfPayload.getBytes(), JsonMainOrderHeaderCustomerDeliveryAddressContainer.class); 
		logger.info("[JSON-String payload status=OK]  " + container.getUser());
		for (JsonMainOrderHeaderCustomerDeliveryAddressRecord record : container.getInqdeladdr()){
			//DEBUG
		}
		
		return container;
	}
	
}
