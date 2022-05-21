package beans;

import java.util.Arrays;
import java.util.Date;

import javax.xml.crypto.Data;

public class VideoInfo {
	
	private int id;//��ƵID
	private String video_full_name;//��Ƶ����
	private String video_introduction;//��Ƶ����
	private String author_email;//���ߣ�email��
	private String time;//����ʱ��
	private byte[] photo;//Ԥ��ͼ��
	private String link;//��Ƶ����
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getVideo_full_name() {
		return video_full_name;
	}
	public void setVideo_full_name(String video_full_name) {
		this.video_full_name = video_full_name;
	}
	public String getVideo_introduction() {
		return video_introduction;
	}
	public void setVideo_introduction(String video_introduction) {
		this.video_introduction = video_introduction;
	}
	public String getAuthor_email() {
		return author_email;
	}
	public void setAuthor_email(String author_email) {
		this.author_email = author_email;
	}
	
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public byte[] getPhoto() {
		return photo;
	}
	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	
	@Override
	public String toString() {
		return "VideoInfo [id=" + id + ", video_full_name=" + video_full_name
				+ ", video_introduction=" + video_introduction
				+ ", author_email=" + author_email + ", time=" + time
				+ ", photo=" + Arrays.toString(photo) + ", link=" + link + "]";
	}
	
}
