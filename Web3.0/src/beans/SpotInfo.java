package beans;

import java.util.Arrays;

public class SpotInfo {

	private int id;//����ID
	private String spotName;//��������
	private String address;//������������
	private String note;//��������
	private byte[] photo;//����ͼ��
	private int state;//����״̬
	
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
