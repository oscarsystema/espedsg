/**
 * 
 */
package no.systema.skat.nctsimport.model.jsonjackson.topic.unloading.items;

import java.util.Collection;


/**
 * 
 * @author oscardelatorre
 * @date Apr 24, 2014
 * 
 *
 */
public class JsonSkatNctsImportSpecificTopicUnloadingItemContainer {
	private String user = null;
	public void setUser(String value) {  this.user = value; }
	public String getUser() { return this.user;}
	
	private String tvavd = null;
	public void setTvavd(String value) {  this.tvavd = value; }
	public String getTvavd() { return this.tvavd;}
	
	private String tvtdn = null;
	public void setTvtdn(String value) {  this.tvtdn = value; }
	public String getTvtdn() { return this.tvtdn;}
	
	private String errMsg = null;
	public void setErrMsg(String value) {  this.errMsg = value; }
	public String getErrMsg() { return this.errMsg;}
		
	private Collection<JsonSkatNctsImportSpecificTopicUnloadingItemRecord> orderList;
	public void setOrderList(Collection<JsonSkatNctsImportSpecificTopicUnloadingItemRecord> value){ this.orderList = value; }
	public Collection<JsonSkatNctsImportSpecificTopicUnloadingItemRecord> getOrderList(){ return orderList; }
	
}
