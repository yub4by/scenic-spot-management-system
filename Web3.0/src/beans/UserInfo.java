package beans;

import java.util.Arrays;

public class UserInfo {
	
	private int id;//用户ID
	private String userName;//用户名称
	private String password;//登陆密码
	private String note;//备注
	private byte[] photo;//头像
	private int state;//状态
	
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
