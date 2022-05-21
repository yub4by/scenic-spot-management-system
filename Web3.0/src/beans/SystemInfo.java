package beans;

public class SystemInfo {

	private String Webname;//网站名称
	private String WebYu;//网站域名
	private String Webdescribe;//站点描述
	private String copyright;//版权所有
	private String Num;//备案编号
	private String Tel;//联系电话
	private String Other;//其他
	private int id;//唯一ID
	
	public String getWebname() {
		return Webname;
	}
	public void setWebname(String webname) {
		Webname = webname;
	}
	public String getWebYu() {
		return WebYu;
	}
	public void setWebYu(String webYu) {
		WebYu = webYu;
	}
	public String getWebdescribe() {
		return Webdescribe;
	}
	public void setWebdescribe(String webdescribe) {
		Webdescribe = webdescribe;
	}
	public String getCopyright() {
		return copyright;
	}
	public void setCopyright(String copyright) {
		this.copyright = copyright;
	}
	public String getNum() {
		return Num;
	}
	public void setNum(String num) {
		Num = num;
	}
	public String getTel() {
		return Tel;
	}
	public void setTel(String tel) {
		Tel = tel;
	}
	public String getOther() {
		return Other;
	}
	public void setOther(String other) {
		Other = other;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "SystemInfo [Webname=" + Webname + ", WebYu=" + WebYu
				+ ", Webdescribe=" + Webdescribe + ", copyright=" + copyright
				+ ", Num=" + Num + ", Tel=" + Tel + ", Other=" + Other
				+ ", id=" + id + "]";
	}
	
	
}
