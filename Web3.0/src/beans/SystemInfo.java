package beans;

public class SystemInfo {

	private String Webname;//��վ����
	private String WebYu;//��վ����
	private String Webdescribe;//վ������
	private String copyright;//��Ȩ����
	private String Num;//�������
	private String Tel;//��ϵ�绰
	private String Other;//����
	private int id;//ΨһID
	
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
