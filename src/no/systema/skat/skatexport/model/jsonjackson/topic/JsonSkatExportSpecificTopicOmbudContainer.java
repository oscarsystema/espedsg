/**
 * 
 */
package no.systema.skat.skatexport.model.jsonjackson.topic;
import java.util.Collection;
/**
 * 
 * @author oscardelatorre
 * @date Mar 18, 2014
 * 
 */
public class JsonSkatExportSpecificTopicOmbudContainer {
	
	private String user = null;
	public void setUser(String value) {  this.user = value; }
	public String getUser() {return this.user;}
	
	private String avd = null;
	public void setAvd(String value) {  this.avd = value; }
	public String getAvd() {return this.avd;}
	
	private String errMsg = null;
	public void setErrMsg(String value) {  this.errMsg = value; }
	public String getErrMsg() {return this.errMsg;}
	
	private Collection<JsonSkatExportSpecificTopicOmbudRecord> getGetdepinf = null;
	public void setGetdepinf(Collection<JsonSkatExportSpecificTopicOmbudRecord> value) {  this.getGetdepinf = value; }
	public Collection<JsonSkatExportSpecificTopicOmbudRecord> getGetdepinf() {return this.getGetdepinf;}
	
	
}
