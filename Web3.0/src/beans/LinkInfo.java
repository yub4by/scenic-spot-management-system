package beans;

import java.util.Arrays;

public class LinkInfo {
	
	private int id;//Á´½ÓID
	private String linkName;//Á´½ÓÃû³Æ
	private String linkStr;//Á´½ÓURL
	private int state;//Á´½Ó×´Ì¬
	private byte[] photo;//Á´½ÓÍ¼Ïñ
	
	public byte[] getPhoto() {
		return photo;
	}
	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLinkName() {
		return linkName;
	}
	public void setLinkName(String linkName) {
		this.linkName = linkName;
	}
	public String getLinkStr() {
		return linkStr;
	}
	public void setLinkStr(String linkStr) {
		this.linkStr = linkStr;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "LinkInfo [id=" + id + ", linkName=" + linkName + ", linkStr="
				+ linkStr + ", state=" + state + ", photo="
				+ Arrays.toString(photo) + "]";
	}
	
	
}
