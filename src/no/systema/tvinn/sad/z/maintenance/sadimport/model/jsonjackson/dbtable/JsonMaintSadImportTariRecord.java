/**
 * 
 */
package no.systema.tvinn.sad.z.maintenance.sadimport.model.jsonjackson.dbtable;

import no.systema.main.model.jsonjackson.general.JsonAbstractGrandFatherRecord;
import no.systema.tvinn.sad.util.TvinnSadDateFormatter;

import java.lang.reflect.Field;
import java.util.*;

/**
 * @author oscardelatorre
 * @date May 6, 2016
 *
 */
public class JsonMaintSadImportTariRecord extends JsonAbstractGrandFatherRecord {
	private TvinnSadDateFormatter dateFormatter = new TvinnSadDateFormatter();
	
    	
	private String tatanr = null;                                
	public void setTatanr (String value){ this.tatanr = value;   }   
	public String getTatanr (){ return this.tatanr;   }  
	
	private String tatar = null; 
	public void setTatar (String value){ this.tatar = value;   }   
	public String getTatar (){ return this.tatar;   }              

	private String tadato = null;
	public void setTadato (String value){ this.tadato = value;   }   
	public String getTadato (){ return this.tadato;   }              

	private String tadts = null;
	public void setTadts (String value){ this.tadts = value;   }   
	public String getTadts (){ return this.tadts;   }              

	private String tadtr = null; 
	public void setTadtr (String value){ this.tadtr = value;   }   
	public String getTadtr (){ return this.tadtr;   }              

	private String taordk = null; 
	public void setTaordk (String value){ this.taordk = value;   }   
	public String getTaordk (){ return this.taordk;   }              

	private String taordb = null; 
	public void setTaordb (String value){ this.taordb = value;   }   
	public String getTaordb (){ return this.taordb;   }              

	
	private String taeftk = null; 
	public void setTaeftk (String value){ this.taeftk = value;   }   
	public String getTaeftk (){ return this.taeftk;   }              

	private String taeftb = null; 
	public String getTaeftbPropertyName (){ return "taeftb"; }
	public void setTaeftb (String value){ this.taeftb = value;   }   
	public String getTaeftb (){ return this.taeftb;   }              
	
	private String taefk = null; 
	public void setTaefk (String value){ this.taefk = value;   }   
	public String getTaefk (){ return this.taefk;   }              

	private String taefb = null; 
	public void setTaefb (String value){ this.taefb = value;   }   
	public String getTaefb (){ return this.taefb;   }              
	
	private String tatxt = null; 
	public void setTatxt (String value){ this.tatxt = value;   }   
	public String getTatxt (){ return this.tatxt;   }              

	private String takapn = null; 
	public void setTakapn (String value){ this.takapn = value;   }   
	public String getTakapn (){ return this.takapn;   }              
	
	private String taalfa = null; 
	public void setTaalfa (String value){ this.taalfa = value;   }   
	public String getTaalfa (){ return this.taalfa;   }              
	
	private String taalfaOrig = null; 
	public void setTaalfaOrig (String value){ this.taalfaOrig = value;   }   
	public String getTaalfaOrig (){ return this.taalfaOrig;   }              
	
	
	private String tastk = null; 
	public void setTastk (String value){ this.tastk = value;   }   
	public String getTastk (){ return this.tastk;   }              
	
	private String takap = null; 
	public void setTakap (String value){ this.takap = value;   }   
	public String getTakap (){ return this.takap;   }              
	
	private String takapa = null; 
	public void setTakapa (String value){ this.takapa = value;   }   
	public String getTakapa (){ return this.takapa;   }              
	
	private String taenhe = null; 
	public void setTaenhe (String value){ this.taenhe = value;   }   
	public String getTaenhe (){ return this.taenhe;   }              
	
	private String tarest = null; 
	public void setTarest (String value){ this.tarest = value;   }   
	public String getTarest (){ return this.tarest;   }              
	
	private String takdae = null; 
	public void setTakdae (String value){ this.takdae = value;   }   
	public String getTakdae (){ return this.takdae;   }              
	
	private String takdse = null; 
	public void setTakdse (String value){ this.takdse = value;   }   
	public String getTakdse (){ return this.takdse;   }              
	
	private String taeosb = null; 
	public void setTaeosb (String value){ this.taeosb = value;   }   
	public String getTaeosb (){ return this.taeosb;   }              
	
	private String taeosk = null; 
	public void setTaeosk (String value){ this.taeosk = value;   }   
	public String getTaeosk (){ return this.taeosk;   }   
	
	private String tatsjb = null; 
	public void setTatsjb (String value){ this.tatsjb = value;   }   
	public String getTatsjb (){ return this.tatsjb;   }              
	
	private String tatsjk = null; 
	public void setTatsjk (String value){ this.tatsjk = value;   }   
	public String getTatsjk (){ return this.tatsjk;   }              
	
	private String tatyrb = null; 
	public void setTatyrb (String value){ this.tatyrb = value;   }   
	public String getTatyrb (){ return this.tatyrb;   }              
	
	private String tatyrk = null; 
	public void setTatyrk (String value){ this.tatyrk = value;   }   
	public String getTatyrk (){ return this.tatyrk;   }              
	
	private String taisrb = null; 
	public void setTaisrb (String value){ this.taisrb = value;   }   
	public String getTaisrb (){ return this.taisrb;   }              
	
	private String taisrk = null; 
	public void setTaisrk (String value){ this.taisrk = value;   }   
	public String getTaisrk (){ return this.taisrk;   }              
	
	private String taellb = null; 
	public void setTaellb (String value){ this.taellb = value;   }   
	public String getTaellb (){ return this.taellb;   }              
	
	private String taellk = null; 
	public void setTaellk (String value){ this.taellk = value;   }   
	public String getTaellk (){ return this.taellk;   }              
	
	
	private String tabulb = null; 
	public void setTabulb (String value){ this.tabulb = value;   }   
	public String getTabulb (){ return this.tabulb;   }              
	
	private String tabulk = null; 
	public void setTabulk (String value){ this.tabulk = value;   }   
	public String getTabulk (){ return this.tabulk;   }              
	
	private String tapolb = null; 
	public void setTapolb (String value){ this.tapolb = value;   }   
	public String getTapolb (){ return this.tapolb;   }              
	
	private String tapolk = null; 
	public void setTapolk (String value){ this.tapolk = value;   }   
	public String getTapolk (){ return this.tapolk;   }              
	
	private String taromb = null; 
	public void setTaromb (String value){ this.taromb = value;   }   
	public String getTaromb (){ return this.taromb;   }              
	
	private String taromk = null; 
	public void setTaromk (String value){ this.taromk = value;   }   
	public String getTaromk (){ return this.taromk;   }              
	
	private String tan05b = null; 
	public void setTan05b (String value){ this.tan05b = value;   }   
	public String getTan05b (){ return this.tan05b;   }              
	
	private String tan05k = null; 
	public void setTan05k (String value){ this.tan05k = value;   }   
	public String getTan05k (){ return this.tan05k;   }              
	
	//Albania
	private String tan06b = null; 
	public void setTan06b (String value){ this.tan06b = value;   }   
	public String getTan06b (){ return this.tan06b;   }              
	
	private String tan06k = null; 
	public void setTan06k (String value){ this.tan06k = value;   }   
	public String getTan06k (){ return this.tan06k;   }              
	
	//Ukraina
	private String tan07b = null; 
	public void setTan07b (String value){ this.tan07b = value;   }   
	public String getTan07b (){ return this.tan07b;   }              
	
	private String tan07k = null; 
	public void setTan07k (String value){ this.tan07k = value;   }   
	public String getTan07k (){ return this.tan07k;   }              
	
	//Jordan
	private String taungb = null; 
	public void setTaungb (String value){ this.taungb = value;   }   
	public String getTaungb (){ return this.taungb;   }              
	
	private String taungk = null; 
	public void setTaungk (String value){ this.taungk = value;   }   
	public String getTaungk (){ return this.taungk;   }              
	
	//Tunisia
	private String taslob = null; 
	public void setTaslob (String value){ this.taslob = value;   }   
	public String getTaslob (){ return this.taslob;   }              
	
	private String taslok = null; 
	public void setTaslok (String value){ this.taslok = value;   }   
	public String getTaslok (){ return this.taslok;   }              
	
	//Min.uland
	private String tamulb = null; 
	public void setTamulb (String value){ this.tamulb = value;   }   
	public String getTamulb (){ return this.tamulb;   }  
	
	private String tamulk = null; 
	public void setTamulk (String value){ this.tamulk = value;   }   
	public String getTamulk (){ return this.tamulk;   }              
	
	//Ord.uland
	private String taoulb = null; 
	public void setTaoulb (String value){ this.taoulb = value;   }   
	public String getTaoulb (){ return this.taoulb;   }              
	
	private String taoulk = null; 
	public void setTaoulk (String value){ this.taoulk = value;   }   
	public String getTaoulk (){ return this.taoulk;   }              
	
	private String tagrlb = null; 
	public void setTagrlb (String value){ this.tagrlb = value;   }   
	public String getTagrlb (){ return this.tagrlb;   }              
	
	private String tagrlk = null; 
	public void setTagrlk (String value){ this.tagrlk = value;   }   
	public String getTagrlk (){ return this.tagrlk;   }              
	
	private String taferb = null; 
	public void setTaferb (String value){ this.taferb = value;   }   
	public String getTaferb (){ return this.taferb;   }              
	
	private String taferk = null; 
	public void setTaferk (String value){ this.taferk = value;   }   
	public String getTaferk (){ return this.taferk;   }              
	
	private String taistb = null; 
	public void setTaistb (String value){ this.taistb = value;   }   
	public String getTaistb (){ return this.taistb;   }              
	
	private String taistk = null; 
	public void setTaistk (String value){ this.taistk = value;   }   
	public String getTaistk (){ return this.taistk;   }              
	        
	
	private String tamarb = null; 
	public void setTamarb (String value){ this.tamarb = value;   }   
	public String getTamarb (){ return this.tamarb;   }              
	
	private String tamark = null; 
	public void setTamark (String value){ this.tamark = value;   }   
	public String getTamark (){ return this.tamark;   }              
	
	//Peru
	private String tan08b = null; 
	public void setTan08b (String value){ this.tan08b = value;   }   
	public String getTan08b (){ return this.tan08b;   }              
	
	private String tan08k = null; 
	public void setTan08k (String value){ this.tan08k = value;   }   
	public String getTan08k (){ return this.tan08k;   }              
	
	//Montenegro
	private String tan09b = null; 
	public void setTan09b (String value){ this.tan09b = value;   }   
	public String getTan09b (){ return this.tan09b;   }              
	
	private String tan09k = null; 
	public void setTan09k (String value){ this.tan09k = value;   }   
	public String getTan09k (){ return this.tan09k;   }              
	
	//Hong Kong
	private String tan10b = null; 
	public void setTan10b (String value){ this.tan10b = value;   }   
	public String getTan10b (){ return this.tan10b;   }              
	
	private String tan10k = null; 
	public void setTan10k (String value){ this.tan10k = value;   }   
	public String getTan10k (){ return this.tan10k;   }              
	
	//Mexico
	private String tamexb = null; 
	public void setTamexb (String value){ this.tamexb = value;   }   
	public String getTamexb (){ return this.tamexb;   }              
	
	private String tamexk = null; 
	public void setTamexk (String value){ this.tamexk = value;   }   
	public String getTamexk (){ return this.tamexk;   }              
	
	//VB & GAZA
	private String tavgab = null; 
	public void setTavgab (String value){ this.tavgab = value;   }   
	public String getTavgab (){ return this.tavgab;   }              
	
	private String tavgak = null; 
	public void setTavgak (String value){ this.tavgak = value;   }   
	public String getTavgak (){ return this.tavgak;   }              
	

	/**
	 * 
	 * @return
	 * @throws Exception
	 */
	public List<Field> getFields() throws Exception{
		Class cl = Class.forName(this.getClass().getCanonicalName());
		Field[] fields = cl.getDeclaredFields();
		List<Field> list = Arrays.asList(fields);
		
		return list;
	}

}