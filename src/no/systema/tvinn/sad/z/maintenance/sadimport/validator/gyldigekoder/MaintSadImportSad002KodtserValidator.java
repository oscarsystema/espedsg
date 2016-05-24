package no.systema.tvinn.sad.z.maintenance.sadimport.validator.gyldigekoder;

import org.apache.log4j.Logger;
import org.springframework.validation.Validator;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

import no.systema.main.util.NumberFormatterLocaleAware;
import no.systema.tvinn.sad.z.maintenance.sadimport.model.jsonjackson.dbtable.gyldigekoder.JsonMaintSadImportKodtseRecord;

/**
 * 
 * @author oscardelatorre
 * @date May 24, 2016
 * 
 *
 */
public class MaintSadImportSad002KodtserValidator implements Validator {
	private static final Logger logger = Logger.getLogger(MaintSadImportSad002KodtserValidator.class.getName());
	private NumberFormatterLocaleAware numberFormatter = new NumberFormatterLocaleAware();
	/**
	 * 
	 */
	public boolean supports(Class clazz) {
		return JsonMaintSadImportKodtseRecord.class.isAssignableFrom(clazz); 
	}
	
	/**
	 * @param obj
	 * @param errors
	 * 
	 */
	public void validate(Object obj, Errors errors) { 
		JsonMaintSadImportKodtseRecord record = (JsonMaintSadImportKodtseRecord)obj;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "ksefyl", "", "F.kod (KSEFYL) er obligatorisk"); 
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "ksetxt", "", "Fritekst (KSETXT) er obligatorisk"); 
		//Logical (RULES) controls if we passed the NOT NULL errors
		if(!errors.hasFieldErrors()){
			if(record!=null){
				//N/A
			}
		}
		
	}
	/**
	 * 
	 * @param obj
	 * @param errors
	 */
	
	public void validateDelete(Object obj, Errors errors) { 
		
		JsonMaintSadImportKodtseRecord record = (JsonMaintSadImportKodtseRecord)obj;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "ksefyl", "", "F.kod (KSEFYL) er obligatorisk");  
		
	}
	
}
