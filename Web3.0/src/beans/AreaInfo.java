package beans;

public class AreaInfo {
	
	private int id;//�������
	private String areaName;//��������
	private String note;//��������
	private int state;//����״̬
	private String spotName;//�������辰������
	
	public String getSpotName() {
		return spotName;
	}
	public void setSpotName(String spotName) {
		this.spotName = spotName;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAreaName() {
		return areaName;
	}
	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "AreaInfo [id=" + id + ", areaName=" + areaName + ", note="
				+ note + ", state=" + state + "]";
	}
	
	
	
}
