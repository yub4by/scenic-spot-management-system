package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.DBUtil;

import beans.MessageInfo;
import beans.UserInfo;

public class MessageDao {

	//¡Ù—‘¡–±Ì
	public List<MessageInfo> getMsgList() {
		// TODO Auto-generated method stub
		MessageInfo msg=null;
		List<MessageInfo> list=new ArrayList<MessageInfo>();
		Connection con=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try{
			con=DBUtil.getConnection();
			String sql="select * from msgInfo ";
			pstm=con.prepareStatement(sql);
			rs=pstm.executeQuery();
			while(rs.next()){
				msg=new MessageInfo();
				msg.setId(rs.getInt("id"));
				msg.setUserName(rs.getString("userName"));
				msg.setMessage(rs.getString("message"));
				msg.setState(rs.getInt("state"));
				msg.setLeaveTime(rs.getDate("leaveTime"));
				msg.setReplayTime(rs.getDate("replayTime"));
				msg.setReplayMsg(rs.getString("replayMsg"));
				list.add(msg);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.close(con, pstm, rs);
		}	
		return list;
	}

	//∏˘æ›IDªÒ»°¡Ù—‘–≈œ¢
	public MessageInfo getMsgById(int id) {
		// TODO Auto-generated method stub
		MessageInfo msg=null;
		Connection con=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try{
			con=DBUtil.getConnection();
			String sql="select * from msgInfo where id=?";
			pstm=con.prepareStatement(sql);
			pstm.setInt(1, id);
			rs=pstm.executeQuery();
			if(rs.next()){
				msg=new MessageInfo();
				msg.setId(rs.getInt("id"));
				msg.setUserName(rs.getString("userName"));
				msg.setMessage(rs.getString("message"));
				msg.setState(rs.getInt("state"));
				msg.setLeaveTime(rs.getDate("leaveTime"));
				msg.setReplayTime(rs.getDate("replayTime"));
				msg.setReplayMsg(rs.getString("replayMsg"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.close(con, pstm, rs);
		}	
		return msg;
	}

	//…æ≥˝¡Ù—‘
	public int deleteMsg(int id) {
		// TODO Auto-generated method stub
		int result=0;
		Connection con=null;
		PreparedStatement pstm=null;
		try{
			con=DBUtil.getConnection();
			String sql="update msgInfo set state=0 where id=?";
			pstm=con.prepareStatement(sql);
			pstm.setInt(1, id);
			result=pstm.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.close(con, pstm, null);
		}	
		return result;
	}

	//…Û∫À¡Ù—‘
	public int passMsg(int id) {
		// TODO Auto-generated method stub
		int result=0;
		Connection con=null;
		PreparedStatement pstm=null;
		try{
			con=DBUtil.getConnection();
			String sql="update msgInfo set state=2 where state=1 and id=?";
			pstm=con.prepareStatement(sql);
			pstm.setInt(1, id);
			result=pstm.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.close(con, pstm, null);
		}	
		return result;
	}

	//ªÿ∏¥¡Ù—‘
	public int replayMsg(String replayMsg,int id) {
		// TODO Auto-generated method stub
		int result=0;
		Connection con=null;
		PreparedStatement pstm=null;
		try{
			con=DBUtil.getConnection();
			String sql="update msgInfo set replayMsg=? , replayTime=now() where id=?";
			pstm=con.prepareStatement(sql);
			pstm.setString(1, replayMsg);
			pstm.setInt(2, id);
			result=pstm.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.close(con, pstm, null);
		}	
		return result;
	}

	//ª÷∏¥…æ≥˝¡Ù—‘
	public int recoverDelMsg(int id) {
		// TODO Auto-generated method stub
		int result=0;
		Connection con=null;
		PreparedStatement pstm=null;
		try{
			con=DBUtil.getConnection();
			String sql="update msgInfo set state=1 where state=0 and id=?";
			pstm=con.prepareStatement(sql);
			pstm.setInt(1, id);
			result=pstm.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.close(con, pstm, null);
		}	
		return result;
	}

	//ª÷∏¥…Û∫À¡Ù—‘
	public int recoverPasMsg(int id) {
		// TODO Auto-generated method stub
		int result=0;
		Connection con=null;
		PreparedStatement pstm=null;
		try{
			con=DBUtil.getConnection();
			String sql="update msgInfo set state=1 where state=2 and id=?";
			pstm=con.prepareStatement(sql);
			pstm.setInt(1, id);
			result=pstm.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.close(con, pstm, null);
		}	
		return result;
	}

	//¡Ù—‘
	public int leave(String userName, String message) {
		// TODO Auto-generated method stub
		int result=0;
		Connection con=null;
		PreparedStatement pstm=null;
		try{
			con=DBUtil.getConnection();
			String sql="insert into msgInfo(userName,message,leaveTime)  values(?,?,now())";
			pstm=con.prepareStatement(sql);
			pstm.setString(1, userName);
			pstm.setString(2, message);
			result=pstm.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.close(con, pstm, null);
		}	
		return result;
	}

}
