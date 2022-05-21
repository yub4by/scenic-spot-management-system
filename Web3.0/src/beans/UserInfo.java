package beans;

import java.util.Arrays;

public class UserInfo {
	
	private int id;//�û�ID
	private String userName;//�û�����
	private String password;//��½����
	private String note;//��ע
	private byte[] photo;//ͷ��
	private int state;//״̬
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
		return "UserInfo [id=" + id + ", userName=" + userName + ", password="
				+ password + ", note=" + note + ", photo="
				+ Arrays.toString(photo) + ", state=" + state + "]";
	}
	
}
