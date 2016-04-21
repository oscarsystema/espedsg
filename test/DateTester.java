import java.text.SimpleDateFormat;
import java.util.Date;

import no.systema.main.util.DateTimeManager;
import no.systema.main.validator.DateValidator;

import no.systema.tvinn.sad.util.TvinnSadDateFormatter;

public class DateTester {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		/*
		DateTimeManager mgr = new DateTimeManager();
		String userDate = "160318";
		boolean isValid = mgr.isValidForwardDateIncludingToday(userDate, "ddMMyy");
		if(isValid){
			System.out.println("Valid date");
		}else{
			System.out.println("Invalid");
		}*/
		
		DateTimeManager mgr = new DateTimeManager();
		String tid = "1540";
		boolean isValid = mgr.isValidForwardTime(tid, "HHmm");
		if(isValid){
			System.out.println("Valid time");
		}else{
			System.out.println("Invalid");
		}
			
		
	}
	
	
}
