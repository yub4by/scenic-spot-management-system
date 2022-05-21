package beans;

import java.util.Date;

public class MessageInfo {
	
	private int id;//留言ID
	private String userName;//留言者
	private String message;//留言内容
	private Date leaveTime;//留言时间
	private Date replayTime;//回复时间
	private String replayMsg;//回复内容
	private int state;//1未审核2通过审核0删除（删除之后不可恢复）
	
	
	public String getReplayMsg() {
		return replayMsg;
	}
	public void setReplayMsg(String replayMsg) {
		this.replayMsg = replayMsg;
	}
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
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Date getLeaveTime() {
		return leaveTime;
	}
	public void setLeaveTime(Date leaveTime) {
		this.leaveTime = leaveTime;
	}
	public Date getReplayTime() {
		return replayTime;
	}
	public void setReplayTime(Date replayTime) {
		this.replayTime = replayTime;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "MessageInfo [id=" + id + ", userName=" + userName
				+ ", message=" + message + ", leaveTime=" + leaveTime
				+ ", replayTime=" + replayTime + ", replayMsg=" + replayMsg
				+ ", state=" + state + "]";
	}
	
}
