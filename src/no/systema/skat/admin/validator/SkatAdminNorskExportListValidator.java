package no.systema.skat.admin.validator;

import org.springframework.validation.Validator;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

import no.systema.skat.admin.filter.SearchFilterSkatAdminNorskExportList;

/**
 * 
 * @author oscardelatorre
 * @date Feb 20, 2014
 * 
 */
public class SkatAdminNorskExportListValidator implements Validator {

	/**
	 * 
	 */
	public boolean supports(Class clazz) {
		return SearchFilterSkatAdminNorskExportList.class.isAssignableFrom(clazz); 
	}
	
	/**
	 * @param obj
	 * @param errors
	 * 
	 */
	public void validate(Object obj, Errors errors) { 
		SearchFilterSkatAdminNorskExportList record = (SearchFilterSkatAdminNorskExportList)obj;
		
		//Check for Mandatory fields first
		if(record!=null){
			
			if( !this.valueExists(record.getAvd()) && !this.valueExists(record.getSign()) ){
				if( this.valueExists(record.getOpd()) ||  
					this.valueExists(record.getDatum()) ||  this.valueExists(record.getAvsNavn()) ||	
					this.valueExists(record.getMotNavn()) ||  this.valueExists(record.getStatus()) ){
					//do nothing. Validation test passed!
				}else{
					//at least avd or sign must exist IF everything else is empty... 
					ValidationUtils.rejectIfEmptyOrWhitespace(errors, "avd", "systema.skat.admin.sadexport.list.error.null.avdOrSign"); 
				}
			}
			
		}
	}
	/**
	 * 
	 * @param value
	 * @return
	 */
	private boolean valueExists(String value){
		boolean retval = false;
		if(value!=null){
			if(!"".equals(value)){
				retval = true;
			}
		}
		
		return retval;
	}
}
