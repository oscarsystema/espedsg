/**
 * 
 */
package no.systema.tvinn.sad.nctsimport.mapper.jsonjackson;

//jackson library
import org.apache.log4j.Logger;
import com.fasterxml.jackson.databind.DeserializationConfig;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper; 
//application library
import no.systema.main.controller.LoginController;
import no.systema.tvinn.sad.nctsimport.model.jsonjackson.topic.JsonSadNctsImportTopicListContainer;
//
import java.util.*;

/**
 * 
 * @author oscardelatorre
 * @date Sep 5, 2014
 * 
 * 
 */
public class SadNctsImportTopicListMapper {
	private static final Logger logger = Logger.getLogger(SadNctsImportTopicListMapper.class.getName());
	
	public JsonSadNctsImportTopicListContainer getContainer(String utfPayload) throws Exception{
		ObjectMapper mapper = new ObjectMapper();  
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES,false);
		//At this point we now have an UTF-8 payload
		JsonSadNctsImportTopicListContainer topicListContainer = mapper.readValue(utfPayload.getBytes(), JsonSadNctsImportTopicListContainer.class); 
		//logger.info(mapper.writeValueAsString(topicListContainer));
		logger.info("[JSON-String payload status=OK]  " + topicListContainer.getUser());
		
		//DEBUG 
		/*
		Collection<JsonTdsExportTopicListRecord> list = topicListContainer.getOrderList();
		for(JsonTdsExportTopicListRecord record : list){
			logger.info("TullId: " + record.getTullId());
			logger.info("Avs.: " + record.getAvsNavn());
			
		}*/
		
		
		return topicListContainer;
	}
}
