package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DBUtil;
import beans.PageInfo;
import beans.VideoInfo;

public class VideoDao {

	//新增视频
	public int addVideo(VideoInfo vd) {
		// TODO Auto-generated method stub
		int result = 0;
		Connection con = null;
		PreparedStatement stm =null;
		try {
			con = DBUtil.getConnection();
			String sql = "insert into videoInfo(video_full_name,video_introduction,author_email,time,photo,link) value (?,?,?,?,?,?)";
			stm = con.prepareStatement(sql);
			stm.setString(1, vd.getVideo_full_name());
			stm.setString(2, vd.getVideo_introduction());
			stm.setString(3, vd.getAuthor_email());
			stm.setString(4, vd.getTime());
			stm.setBytes(5, vd.getPhoto());
			stm.setString(6, vd.getLink());
			result = stm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.close(con, stm, null);
		}
		return result;
	}
	
	//获取视频数量
	public int getVideoCount() {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement stm =null;
		ResultSet rs = null;
		int result =0;
		try {
			con = DBUtil.getConnection();
			String sql = "select count(*) from videoInfo ";
			stm = con.prepareStatement(sql);
			rs = stm.executeQuery();
			if(rs.next()){
				result=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.close(con, stm, null);
		}
		return result;
	}

	//分页视频列表
	public List<VideoInfo> selectAllVideo(PageInfo page) {
		// TODO Auto-generated method stub
		VideoInfo vd = null;
		Connection con =null;
		PreparedStatement stm = null;
		ResultSet rs = null;
		List<VideoInfo> videolist = new ArrayList<VideoInfo>();
		try{
			con = DBUtil.getConnection();
			String sql = "select * from videoInfo limit ?,?";
			stm = con.prepareStatement(sql);
			stm.setInt(1, page.getBeginRow());
			stm.setInt(2, page.getPageSize());
			rs = stm.executeQuery();
			while(rs.next()){
				vd = new VideoInfo();
				vd.setId(rs.getInt("id"));
				vd.setVideo_full_name(rs.getString("video_full_name"));
				vd.setVideo_introduction(rs.getString("video_introduction"));
				vd.setAuthor_email(rs.getString("author_email"));
				vd.setTime(rs.getString("time"));
				vd.setPhoto(rs.getBytes("photo"));
				vd.setLink(rs.getString("link"));
				videolist.add(vd);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DBUtil.close(con, stm, rs);
		}
		return videolist;
	}
	
	//根据ID获取视频信息
	public VideoInfo getVideoById(int id) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement stm =null;
		ResultSet rs = null;
		VideoInfo vd = null;
		try {
			con = DBUtil.getConnection();
			String sql = "select * from videoInfo where id = ?";
			stm = con.prepareStatement(sql);
			stm.setInt(1, id);
			rs = stm.executeQuery();
			while(rs.next()){
				vd = new VideoInfo();
				vd.setId(rs.getInt("id"));
				vd.setVideo_full_name(rs.getString("video_full_name"));
				vd.setVideo_introduction(rs.getString("video_introduction"));
				vd.setAuthor_email(rs.getString("author_email"));
				vd.setTime(rs.getString("time"));
				vd.setPhoto(rs.getBytes("photo"));
				vd.setLink(rs.getString("link"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.close(con, stm, null);
		}
		return vd;
	}

	//删除视频（真删！）
	public int deleteVideo(int id) {
		// TODO Auto-generated method stub
		int result = 0;
		Connection con = null;
		PreparedStatement stm =null;
		try {
			con = DBUtil.getConnection();
			String sql = "delete from videoInfo where id in ("+id+")";
			stm = con.prepareStatement(sql);
			result = stm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.close(con, stm, null);
		}
		return result;
	}

	//更新视频
	public int updateVideo(VideoInfo vd) {
		// TODO Auto-generated method stub
		int result = 0;
		Connection con = null;
		PreparedStatement stm =null;
		try {
			con = DBUtil.getConnection();
			String sql = "update videoInfo set video_full_name= ? , video_introduction = ? , author_email = ? ,time = ? , photo = ? , link = ? where id = ? ";
			stm = con.prepareStatement(sql);
			stm.setString(1, vd.getVideo_full_name());
			stm.setString(2, vd.getVideo_introduction());
			stm.setString(3, vd.getAuthor_email());
			stm.setString(4, vd.getTime());
			stm.setBytes(5, vd.getPhoto());
			stm.setString(6, vd.getLink());
			stm.setInt(7, vd.getId());
			result = stm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.close(con, stm, null);
		}
		return result;
	}
	
}
