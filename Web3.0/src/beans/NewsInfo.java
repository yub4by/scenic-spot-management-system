package beans;

import java.util.Date;

public class NewsInfo {

	private int id;// ����ID
	private String author;// ����
	private String title;// ��Ŀ
	private String content;// ����
	private String seeCount;// �������
	private String createDate;// ����ʱ��
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSeeCount() {
		return seeCount;
	}
	public void setSeeCount(String seeCount) {
		this.seeCount = seeCount;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	@Override
	public String toString() {
		return "NewsInfo [id=" + id + ", author=" + author + ", title=" + title
				+ ", content=" + content + ", seeCount=" + seeCount
				+ ", createDate=" + createDate + "]";
	}
	
}
