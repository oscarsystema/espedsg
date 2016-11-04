package no.systema.z.main.maintenance.model.jsonjackson.dbtable;
import java.io.Serializable;
import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.List;

import no.systema.main.model.jsonjackson.general.JsonAbstractGrandFatherRecord;

/**
 * 
 * @author oscardelatorre
 * @date Aug 4, 2016
 * 
 */
public class JsonMaintMainFirmRecord extends JsonAbstractGrandFatherRecord {
	
	private String fifirm = null;                             
	public void setFifirm (String value){ this.fifirm = value;   }   
	public String getFifirm (){ return this.fifirm;   }  
	
	private String fift = null;                                 
	public void setFift (String value){ this.fift = value;   }   
	public String getFift (){ return this.fift;   }  
	   
	
	private String fikdul = null;                                
	public void setFikdul (String value){ this.fikdul = value;   }   
	public String getFikdul (){ return this.fikdul;   }  
	
	private String filtb = null;                                
	public void setFiltb (String value){ this.filtb = value;   }   
	public String getFiltb (){ return this.filtb;   }  
	
	private String filfb = null;                                
	public void setFilfb (String value){ this.filfb = value;   }   
	public String getFilfb (){ return this.filfb;   }  
	
	private String fiups = null;                                
	public String getFiupsPropertyName (){ return "fiups"; }
	public void setFiups (String value){ this.fiups = value;   }   
	public String getFiups (){ return this.fiups;   }  
	
	private String fiupsNO = null;                                
	public void setFiupsNO (String value){ this.fiupsNO = value;   }   
	public String getFiupsNO (){
		if(this.fiups!=null && !"".equals(this.fiups)){
			this.fiupsNO = this.numberFormatter.getFormattedEU(this.fiups);
		}
		return this.fiupsNO;  
	}
	
	private String fiupm = null;                                
	public void setFiupm (String value){ this.fiupm = value;   }   
	public String getFiupm (){ return this.fiupm;   }  
	
	private String fikdt = null;                                
	public void setFikdt (String value){ this.fikdt = value;   }   
	public String getFikdt (){ return this.fikdt;   }  
	
	private String fiatk = null;                                
	public void setFiatk (String value){ this.fiatk = value;   }   
	public String getFiatk (){ return this.fiatk;   }  
	
	private String fiurli = null;                                
	public void setFiurli (String value){ this.fiurli = value;   }   
	public String getFiurli (){ return this.fiurli;   }  
	
	private String fiurle = null;                                
	public void setFiurle (String value){ this.fiurle = value;   }   
	public String getFiurle (){ return this.fiurle;   }  
	
	private String fiurfi = null;                                
	public void setFiurfi (String value){ this.fiurfi = value;   }   
	public String getFiurfi (){ return this.fiurfi;   }  
	
	private String fiurfe = null;                                
	public void setFiurfe (String value){ this.fiurfe = value;   }   
	public String getFiurfe (){ return this.fiurfe;   }  
	
	private String fiurfl = null;                                
	public void setFiurfl (String value){ this.fiurfl = value;   }   
	public String getFiurfl (){ return this.fiurfl;   }  
	
	private String fiurbi = null;                                
	public void setFiurbi (String value){ this.fiurbi = value;   }   
	public String getFiurbi (){ return this.fiurbi;   }  
	
	private String fiurbe = null;                                
	public void setFiurbe (String value){ this.fiurbe = value;   }   
	public String getFiurbe (){ return this.fiurbe;   }  
	
	private String fiurbl = null;                                
	public void setFiurbl (String value){ this.fiurbl = value;   }   
	public String getFiurbl (){ return this.fiurbl;   }  
	
	private String fiursi = null;                                
	public void setFiursi (String value){ this.fiursi = value;   }   
	public String getFiursi (){ return this.fiursi;   }  
	
	private String fiurse = null;                                
	public void setFiurse (String value){ this.fiurse = value;   }   
	public String getFiurse (){ return this.fiurse;   }  
	
	private String fimvas = null;                                
	public void setFimvas (String value){ this.fimvas = value;   }   
	public String getFimvas (){ return this.fimvas;   }  
	
	private String fivalk = null;                                
	public void setFivalk (String value){ this.fivalk = value;   }   
	public String getFivalk (){ return this.fivalk;   }  
	
	private String ficurr = null;                                
	public void setFicurr (String value){ this.ficurr = value;   }   
	public String getFicurr (){ return this.ficurr;   }  
	
	private String fitax = null;                                
	public void setFitax (String value){ this.fitax = value;   }   
	public String getFitax (){ return this.fitax;   }  
	
	private String fitaxNO = null;                                
	public void setFitaxNO (String value){ this.fitaxNO = value;   }   
	public String getFitaxNO (){
		if(this.fitax!=null && !"".equals(this.fitax)){
			String tmpUSA = this.fitax.replace(",", ".");
			Double tmp = Double.valueOf(tmpUSA) * 100;
			this.fitaxNO = String.valueOf(tmp);
			this.fitaxNO = this.numberFormatter.getFormattedEU(this.fitaxNO);
		}
		return this.fitaxNO;  
	} 
	
	private String fidtfm = null;                                
	public void setFidtfm (String value){ this.fidtfm = value;   }   
	public String getFidtfm (){ return this.fidtfm;   }  
	
	private String fideci = null;                                
	public void setFideci (String value){ this.fideci = value;   }   
	public String getFideci (){ return this.fideci;   }  
	
	private String fiecon = null;                                
	public void setFiecon (String value){ this.fiecon = value;   }   
	public String getFiecon (){ return this.fiecon;   }  
	
	private String fiavte = null;                                
	public void setFiavte (String value){ this.fiavte = value;   }   
	public String getFiavte (){ return this.fiavte;   }  
	
	private String fikont = null;                                
	public void setFikont (String value){ this.fikont = value;   }   
	public String getFikont (){ return this.fikont;   }  
	
	private String filand = null;                                
	public void setFiland (String value){ this.filand = value;   }   
	public String getFiland (){ return this.filand;   }  
	
	private String fitdvi = null;                                
	public void setFitdvi (String value){ this.fitdvi = value;   }   
	public String getFitdvi (){ return this.fitdvi;   }  
	
	private String fistfn = null;                                
	public void setFistfn (String value){ this.fistfn = value;   }   
	public String getFistfn (){ return this.fistfn;   }  
	
	private String fistfe = null;                                
	public void setFistfe (String value){ this.fistfe = value;   }   
	public String getFistfe (){ return this.fistfe;   }  
	
	private String fistft = null;                                
	public void setFistft (String value){ this.fistft = value;   }   
	public String getFistft (){ return this.fistft;   }  
	
	private String file12 = null;                                
	public void setFile12 (String value){ this.file12 = value;   }   
	public String getFile12 (){ return this.file12;   }  
	
	private String file22 = null;                                
	public void setFile22 (String value){ this.file22 = value;   }   
	public String getFile22 (){ return this.file22;   }  
	
	private String file11 = null;                                
	public void setFile11 (String value){ this.file11 = value;   }   
	public String getFile11 (){ return this.file11;   }  
	
	private String file21 = null;                                
	public void setFile21 (String value){ this.file21 = value;   }   
	public String getFile21 (){ return this.file21;   }  
	
	private String file31 = null;                                
	public void setFile31 (String value){ this.file31 = value;   }   
	public String getFile31 (){ return this.file31;   }  
	
	private String file41 = null;                                
	public void setFile41 (String value){ this.file41 = value;   }   
	public String getFile41 (){ return this.file41;   }  
	
	private String fitran = null;                                
	public void setFitran (String value){ this.fitran = value;   }   
	public String getFitran (){ return this.fitran;   }  
	
	private String fikrtn = null;                                
	public void setFikrtn (String value){ this.fikrtn = value;   }   
	public String getFikrtn (){ return this.fikrtn;   }  
	
	private String fitax2 = null;                                
	public void setFitax2 (String value){ this.fitax2 = value;   }   
	public String getFitax2 (){ return this.fitax2; }  
	
	private String fitax2NO = null;                                
	public void setFitax2NO (String value){ this.fitax2NO = value;   }   
	public String getFitax2NO (){
		if(this.fitax2!=null && !"".equals(this.fitax2)){
			String tmpUSA = this.fitax2.replace(",", ".");
			Double tmp = Double.valueOf(tmpUSA) * 100;
			this.fitax2NO = String.valueOf(tmp);
			this.fitax2NO = this.numberFormatter.getFormattedEU(this.fitax2NO);
		}
		return this.fitax2NO;  
	} 

	private String fitaxd = null;                                
	public void setFitaxd (String value){ this.fitaxd = value;   }   
	public String getFitaxd (){ return this.fitaxd;   }  
	
	private String fitaxdNO = null; 
	public void setFitaxdNO (String value){ this.fitaxdNO = value;   }   
	public String getFitaxdNO() {
		if (fitaxdNO != null) { // from UI
			return fitaxdNO;
		} else { 				// from DB
			return this.dateFormatter.convertToDate_NO(this.fitaxd);
		}
	}
	
	private String fisadk = null;                                
	public void setFisadk (String value){ this.fisadk = value;   }   
	public String getFisadk (){ return this.fisadk;   }  
	
	private String filibf = null;                                
	public void setFilibf (String value){ this.filibf = value;   }   
	public String getFilibf (){ return this.filibf;   }  
	
	private String filibo = null;                                
	public void setFilibo (String value){ this.filibo = value;   }   
	public String getFilibo (){ return this.filibo;   }  
	
	private String innutl = null;                                
	public void setInnutl (String value){ this.innutl = value;   }   
	public String getInnutl (){ return this.innutl;   }  
	
	private String zipcod = null;                                
	public void setZipcod (String value){ this.zipcod = value;   }   
	public String getZipcod (){ return this.zipcod;   }  
	
	//--------------
	//FIRFB -table
	//--------------
	private String fifbnr = null;                                
	public void setFifbnr (String value){ this.fifbnr = value;   }   
	public String getFifbnr (){ return this.fifbnr;   }  
	
	private String fitpnr = null;                                
	public void setFitpnr (String value){ this.fitpnr = value;   }   
	public String getFitpnr (){ return this.fitpnr;   }  
	
	private String firecn = null;                                
	public void setFirecn (String value){ this.firecn = value;   }   
	public String getFirecn (){ return this.firecn;   }  
	
	private String firecm = null;                                
	public void setFirecm (String value){ this.firecm = value;   }   
	public String getFirecm (){ return this.firecm;   }  
	
	private String fisnla = null;                                
	public void setFisnla (String value){ this.fisnla = value;   }   
	public String getFisnla (){ return this.fisnla;   }  
	
	private String fisnle = null;                                
	public void setFisnle (String value){ this.fisnle = value;   }   
	public String getFisnle (){ return this.fisnle;   }  
	
	private String fiidla = null;                                
	public void setFiidla (String value){ this.fiidla = value;   }   
	public String getFiidla (){ return this.fiidla;   }  
	
	private String fiidle = null;                                
	public void setFiidle (String value){ this.fiidle = value;   }   
	public String getFiidle (){ return this.fiidle;   }  
	
	private String fiidnr = null;                                
	public void setFiidnr (String value){ this.fiidnr = value;   }   
	public String getFiidnr (){ return this.fiidnr;   }  
	
	private String fiidmx = null;                                
	public void setFiidmx (String value){ this.fiidmx = value;   }   
	public String getFiidmx (){ return this.fiidmx;   }  
	//END FIRFB-table


	//--------------
	//FIRMKOS -table
	//--------------
	private String tillat = null;                                
	public void setTillat (String value){ this.tillat = value;   }   
	public String getTillat (){ return this.tillat;   }  
	
	private String interr = null;                                
	public void setInterr (String value){ this.interr = value;   }   
	public String getInterr (){ return this.interr;   }  
	//END FIRMKOS
	
	//--------------
	//FIRKU -table
	//--------------
	private String fikufr = null;                                
	public void setFikufr (String value){ this.fikufr = value;   }   
	public String getFikufr (){ return this.fikufr;   }  
	
	private String fikuti = null;                                
	public void setFikuti (String value){ this.fikuti = value;   }   
	public String getFikuti (){ return this.fikuti;   } 
	
	private String fikune = null;                                
	public void setFikune (String value){ this.fikune = value;   }   
	public String getFikune (){ return this.fikune;   } 
	//END FIRKU
	
	
    
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
