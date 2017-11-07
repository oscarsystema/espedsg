/**
 * 
 */
package no.systema.tvinn.sad.sadimport.mapper.jsonjackson;

//jackson library
import org.apache.log4j.Logger;
import com.fasterxml.jackson.databind.DeserializationConfig;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper; 
//application library
import no.systema.tvinn.sad.sadimport.model.jsonjackson.topic.JsonSadImportTopicFinansOpplysningerExternalContainer;
import no.systema.tvinn.sad.sadimport.model.jsonjackson.topic.JsonSadImportTopicFinansOpplysningerExternalForUpdateContainer;
import no.systema.tvinn.sad.sadimport.model.jsonjackson.topic.JsonSadImportTopicFinansOpplysningerExternalRecord;
import no.systema.tvinn.sad.sadimport.model.jsonjackson.topic.JsonSadImportTopicFinansOpplysningerContainer;
import no.systema.tvinn.sad.sadimport.model.jsonjackson.topic.JsonSadImportTopicFinansOpplysningerRecord;

/**
 * 
 * @author oscardelatorre
 * @date Sep 24, 2014
 * 
 * 
 */
public class SadImportTopicFinansOpplysningerMapper {
	private static final Logger logger = Logger.getLogger(SadImportTopicFinansOpplysningerMapper.class.getName());
	
	public JsonSadImportTopicFinansOpplysningerContainer getContainer(String utfPayload) throws Exception{
		ObjectMapper mapper = new ObjectMapper();  
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
		//At this point we now have an UTF-8 payload
		JsonSadImportTopicFinansOpplysningerContainer topicListContainer = mapper.readValue(utfPayload.getBytes(), JsonSadImportTopicFinansOpplysningerContainer.class); 
		//logger.info(mapper.writeValueAsString(topicListContainer));
		logger.info("[JSON-String payload status=OK]  " + topicListContainer.getUser());
		for (JsonSadImportTopicFinansOpplysningerRecord record : topicListContainer.getInvoicList()){
			//DEBUG
			//logger.info(record.getSftxt());
		}
		return topicListContainer;
	}
	/**
	 * 
	 * @param utfPayload
	 * @return
	 * @throws Exception
	 */
	public JsonSadImportTopicFinansOpplysningerContainer getContainerOneInvoice(String utfPayload) throws Exception{
		ObjectMapper mapper = new ObjectMapper();  
		mapper.configure(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES,false);
		//At this point we now have an UTF-8 payload
		JsonSadImportTopicFinansOpplysningerContainer container = mapper.readValue(utfPayload.getBytes(), JsonSadImportTopicFinansOpplysningerContainer.class); 
		//logger.info(mapper.writeValueAsString(topicListContainer));
		logger.info("[JSON-String payload status=OK]  " + container.getUser());
		for (JsonSadImportTopicFinansOpplysningerRecord record : container.getOneInvoice()){
			//DEBUG
			//logger.info(record.getSftxt());
		}
		return container;
	}
	
	/**
	 * 
	 * @param utfPayload
	 * @return
	 * @throws Exception
	 */
	public JsonSadImportTopicFinansOpplysningerExternalContainer getContainerInvoiceExternal(String utfPayload) throws Exception{
		ObjectMapper mapper = new ObjectMapper();  
		mapper.configure(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES,false);
		//At this point we now have an UTF-8 payload
		JsonSadImportTopicFinansOpplysningerExternalContainer container = mapper.readValue(utfPayload.getBytes(), JsonSadImportTopicFinansOpplysningerExternalContainer.class); 
		//logger.info(mapper.writeValueAsString(topicListContainer));
		logger.info("[JSON-String payload status=OK]  " + container.getUser());
		for (JsonSadImportTopicFinansOpplysningerExternalRecord record : container.getListexternfakt()){
			//DEBUG
			//logger.info(record.getSftxt());
		}
		return container;
	}
	
	/**
	 * 
	 * @param utfPayload
	 * @return
	 * @throws Exception
	 */
	public JsonSadImportTopicFinansOpplysningerExternalContainer getContainerOneInvoiceInvoiceExternal(String utfPayload) throws Exception{
		ObjectMapper mapper = new ObjectMapper();  
		mapper.configure(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES,false);
		//At this point we now have an UTF-8 payload
		JsonSadImportTopicFinansOpplysningerExternalContainer container = mapper.readValue(utfPayload.getBytes(), JsonSadImportTopicFinansOpplysningerExternalContainer.class); 
		//logger.info(mapper.writeValueAsString(topicListContainer));
		logger.info("[JSON-String payload status=OK]  " + container.getUser());
		for (JsonSadImportTopicFinansOpplysningerExternalRecord record : container.getGetexternfakt()){
			//DEBUG
			//logger.info(record.getSftxt());
		}
		return container;
	}
	/**
	 * 
	 * @param utfPayload
	 * @return
	 * @throws Exception
	 */
	public JsonSadImportTopicFinansOpplysningerExternalForUpdateContainer getContainerOneInvoiceInvoiceExternalForUpdate(String utfPayload) throws Exception{
		ObjectMapper mapper = new ObjectMapper();  
		mapper.configure(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES,false);
		//At this point we now have an UTF-8 payload
		JsonSadImportTopicFinansOpplysningerExternalForUpdateContainer container = mapper.readValue(utfPayload.getBytes(), JsonSadImportTopicFinansOpplysningerExternalForUpdateContainer.class); 
		//logger.info(mapper.writeValueAsString(topicListContainer));
		logger.info("User:" + container.getUser());
		
		return container;
	}

	
}


