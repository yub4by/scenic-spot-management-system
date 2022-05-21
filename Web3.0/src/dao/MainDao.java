package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import util.DBUtil;

import beans.AreaInfo;
import beans.LinkInfo;
import beans.MessageInfo;
import beans.NewsInfo;
import beans.SpotInfo;
import beans.SystemInfo;
import beans.UserInfo;
import beans.VideoInfo;

public class MainDao {

	//景点列表
	public List<SpotInfo> getSpotList() {
		// TODO Auto-generated method stub
		SpotInfo spot=null;
		List<SpotInfo> list=new ArrayList<SpotInfo>();
		Connection con=null;
		PreparedStatement pstm=null;
		//Statement stm=null;
		ResultSet rs=null;
		try{
			con=DBUtil.getConnection();
			//stm=con.createStatement();
			String sql="select * from spotInfo where state=1";
			pstm=con.prepareStatement(sql);
			rs=pstm.executeQuery();
			//rs=stm.executeQuery(sql);
			while(rs.next()){
				spot=new SpotInfo();
				spot.setId(rs.getInt("id"));
				spot.setSpotName(rs.getString("spotName"));
				spot.setAddress(rs.getString("address"));
				spot.setNote(rs.getString("note"));
				list.add(spot);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.close(con, pstm, rs);
		}	
		return list;
	}

	//景区列表
	public List<AreaInfo> getAreaList() {
		// TODO Auto-generated method stub
		AreaInfo area=null;
		List<AreaInfo> list=new ArrayList<AreaInfo>();
		Connection con=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try{
			con=DBUtil.getConnection();
			String sql="select * from areaInfo where state=1";
			pstm=con.prepareStatement(sql);
			rs=pstm.executeQuery();
			while(rs.next()){
				area=new AreaInfo();
				area.setId(rs.getInt("id"));
				area.setAreaName(rs.getString("areaName"));
				area.setNote(rs.getString("note"));
				list.add(area);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.close(con, pstm, rs);
		}	
		return list;
	}

	//留言列表
	public List<MessageInfo> getMsgList() {
		// TODO Auto-generated method stub
		MessageInfo msg=null;
		List<MessageInfo> list=new ArrayList<MessageInfo>();
		Connection con=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try{
			con=DBUtil.getConnection();
			String sql="select * from msgInfo where state=2";
			pstm=con.prepareStatement(sql);
			rs=pstm.executeQuery();
			while(rs.next()){
				msg=new MessageInfo();
				msg.setId(rs.getInt("id"));
				msg.setUserName(rs.getString("userName"));
				msg.setMessage(rs.getString("message"));
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

	//新闻列表
	public List<NewsInfo> getNewsList() {
		// TODO Auto-generated method stub
		NewsInfo news=null;
		List<NewsInfo> list=new ArrayList<NewsInfo>();
		Connection con=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try{
			con=DBUtil.getConnection();
			String sql="select * from newsInfo ";
			pstm=con.prepareStatement(sql);
			rs=pstm.executeQuery();
			while(rs.next()){
				news = new NewsInfo();
				news.setId(rs.getInt("id"));
				news.setTitle(rs.getString("title"));
				news.setAuthor(rs.getString("author"));
				news.setContent(rs.getString("content"));
				news.setCreateDate(rs.getString("createDate"));
				news.setSeeCount(rs.getString("seeCount"));
				list.add(news);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.close(con, pstm, rs);
		}	
		return list;
	}

	//视频列表
	public List<VideoInfo> getVideoList() {
		// TODO Auto-generated method stub
		VideoInfo vd = null;
		List<VideoInfo> list=new ArrayList<VideoInfo>();
		Connection con=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try{
			con=DBUtil.getConnection();
			String sql="select * from videoInfo ";
			pstm=con.prepareStatement(sql);
			rs=pstm.executeQuery();
			while(rs.next()){
				vd = new VideoInfo();
				vd.setId(rs.getInt("id"));
				vd.setVideo_full_name(rs.getString("video_full_name"));
				vd.setVideo_introduction(rs.getString("video_introduction"));
				vd.setAuthor_email(rs.getString("author_email"));
				vd.setTime(rs.getString("time"));
				vd.setLink(rs.getString("link"));
				list.add(vd);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.close(con, pstm, rs);
		}	
		return list;
	}

	//回复列表
	public List<MessageInfo> getMsgListt() {
		// TODO Auto-generated method stub
		MessageInfo msg=null;
		List<MessageInfo> list=new ArrayList<MessageInfo>();
		Connection con=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try{
			con=DBUtil.getConnection();
			String sql="select * from msgInfo where state=2 and replayMsg is not null ";
			pstm=con.prepareStatement(sql);
			rs=pstm.executeQuery();
			while(rs.next()){
				msg=new MessageInfo();
				msg.setId(rs.getInt("id"));
				msg.setUserName(rs.getString("userName"));
				msg.setMessage(rs.getString("message"));
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

	//链接列表
	public List<LinkInfo> getLinkList() {
		// TODO Auto-generated method stub
		LinkInfo link=null;
		List<LinkInfo> list = new ArrayList<LinkInfo>();
		Connection con=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try{
			con=DBUtil.getConnection();
			String sql="select * from linkinfo where state=1 ";
			pstm=con.prepareStatement(sql);
			rs=pstm.executeQuery();
			while(rs.next()){
				link=new LinkInfo();
				link.setId(rs.getInt("id"));
				link.setLinkName(rs.getString("linkName"));
				link.setLinkStr(rs.getString("linkStr"));
				link.setPhoto(rs.getBytes("photo"));
				list.add(link);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.close(con, pstm, rs);
		}	
		return list;
	}

}
