/**
 * 
 */
package no.systema.tds.tdsexport.model.jsonjackson.topic;

import java.util.Collection;

import no.systema.main.util.NumberFormatterLocaleAware;

/**
 * @author oscardelatorre
 * @date Oct 26, 2015
 *
 */
public class JsonTdsExportTopicInvoiceExternalContainer {
	private String user = null;
	public void setUser(String value) {  this.user = value; }
	public String getUser() { return this.user;}
	
	private String datum = null;
	public void setDatum(String value) {  this.datum = value; }
	public String getDatum() { return this.datum;}
	
	private String reff = null;
	public void setReff(String value) {  this.reff = value; }
	public String getReff() { return this.reff;}
	
	private String errMsg = null;
	public void setErrMsg(String value) {  this.errMsg = value; }
	public String getErrMsg() { return this.errMsg;}
	
	private Double calculatedItemLinesTotalAmount = 0.000D;
	public void setCalculatedItemLinesTotalAmount(Double value) {  this.calculatedItemLinesTotalAmount = value; }
	public String getCalculatedItemLinesTotalAmount() {
		NumberFormatterLocaleAware formatter = new NumberFormatterLocaleAware();
		return formatter.getDoubleEuropeanFormat(this.calculatedItemLinesTotalAmount, 3, false);
	}
	private Double diffItemLinesTotalAmountWithInvoiceTotalAmount = 0.000D;
	public void setDiffItemLinesTotalAmountWithInvoiceTotalAmount(Double value) {  this.diffItemLinesTotalAmountWithInvoiceTotalAmount = value; }
	public String getDiffItemLinesTotalAmountWithInvoiceTotalAmount() {
		NumberFormatterLocaleAware formatter = new NumberFormatterLocaleAware();
		return formatter.getDoubleEuropeanFormat(this.diffItemLinesTotalAmountWithInvoiceTotalAmount, 3, false);
	}
	
	//Used when different currencies exist. The main currency must be = NOK
	private String calculatedValidCurrency = null;
	public void setCalculatedValidCurrency(String value) {  this.calculatedValidCurrency = value; }
	public String getCalculatedValidCurrency() { return this.calculatedValidCurrency; }
	
	
	/**
	 * This is usually done in the JSP but in this case (Fakturalista) we do it right here since there are some
	 * presentation issues that unable the counter on the JSP to work in the correct time line.
	 * Here we just send the size of the item list.
	 * 
	 */
	private String totalNumberOfItemLines = "";
	public String getTotalNumberOfItemLines() {
		String retval = "";
		if(this.listexternfakt!=null){
			retval = String.valueOf(this.listexternfakt.size());
		}
		return retval;
	}
	
	
	/**
	 * 
	 */
	private Collection<JsonTdsExportTopicInvoiceExternalRecord> listexternfakt;
	public void setListexternfakt(Collection<JsonTdsExportTopicInvoiceExternalRecord> value){ this.listexternfakt = value; }
	public Collection<JsonTdsExportTopicInvoiceExternalRecord> getListexternfakt(){ return listexternfakt; }
	
	private Collection<JsonTdsExportTopicInvoiceExternalRecord> getexternfakt;
	public void setGetexternfakt(Collection<JsonTdsExportTopicInvoiceExternalRecord> value){ this.getexternfakt = value; }
	public Collection<JsonTdsExportTopicInvoiceExternalRecord> getGetexternfakt(){ return getexternfakt; }
	
	
}
