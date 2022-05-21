package beans;

import java.util.Arrays;

public class SpotInfo {

	private int id;//景点ID
	private String spotName;//景点名称
	private String address;//景点所属景区
	private String note;//景点描述
	private byte[] photo;//景点图像
	private int state;//景点状态
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSpotName() {
		return spotName;
	}
	public void setSpotName(String spotName) {
		this.spotName = spotName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public byte[] getPhoto() {
		return photo;
	}
	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "SpotInfo [id=" + id + ", spotName=" + spotName + ", address="
				+ address + ", note=" + note + ", photo="
				+ Arrays.toString(photo) + ", state=" + state + "]";
	}
	
}
