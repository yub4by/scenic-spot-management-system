package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.LinkInfo;
import beans.NewsInfo;
import beans.PageInfo;

import util.DBUtil;

public class LinkDao {

	//删除链接
	public int delById(int id) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement stm = null;
		int result = 0;
		try {
			conn = DBUtil.getConnection();
			String sql = "update linkInfo set state=0 where id=?";
			stm = conn.prepareStatement(sql);
			stm.setInt(1, id);
			result = stm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, stm, null);
		}
		return result;
	}

	//修改链接
	public int update(LinkInfo link) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement stm = null;
		int result = 0;
		try {
			conn = DBUtil.getConnection();
			String sql="";
			if(link.getPhoto().length!=0){
				sql="update linkinfo set linkName=?,linkStr=?,state=?,photo=? where id=?";
			}else{
				sql = " update linkinfo set linkName=?,linkStr=?,state=? where id=?";
			}
			stm = conn.prepareStatement(sql);
			if(link.getPhoto().length!=0){
				stm.setInt(5, link.getId());
				stm.setString(1, link.getLinkName());
				stm.setString(2, link.getLinkStr());
				stm.setInt(3, link.getState());
				stm.setBytes(4, link.getPhoto());
			}else{
				stm.setInt(4, link.getId());
				stm.setString(1, link.getLinkName());
				stm.setString(2, link.getLinkStr());
				stm.setInt(3, link.getState());
			}
			result = stm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, stm, null);
		}
		return result;
	}

	//根据ID获取链接信息
	public LinkInfo getlinkById(int id) {
		// TODO Auto-generated method stub
		LinkInfo link = null;
		Connection conn = null;
		PreparedStatement stm = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConnection();
			String sql = "select * from linkinfo where  id=? ";
			stm = conn.prepareStatement(sql);
			stm.setInt(1, id);
			rs = stm.executeQuery();
			while (rs.next()) {
				link=new LinkInfo();
				link.setId(rs.getInt("id"));
				link.setLinkName(rs.getString("linkName"));
				link.setLinkStr(rs.getString("linkStr"));
				link.setState(rs.getInt("state"));
				link.setPhoto(rs.getBytes("photo"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, stm, rs);
		}
		return link;
	}

	//新增链接
	public int addlink(LinkInfo link) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement stm = null;
		int result = 0;
		try {
			conn = DBUtil.getConnection();
			String sql = "insert into linkinfo (linkName,linkStr,photo) values(?,?,?) ";
			stm = conn.prepareStatement(sql);
			stm.setString(1, link.getLinkName());
			stm.setString(2, link.getLinkStr());
			stm.setBytes(3, link.getPhoto());
			result = stm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, stm, null);
		}
		return result;
	}

	//获取链接数量
	public int getLinkCount() {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement stm = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = DBUtil.getConnection();
			String sql = "select count(*) from linkinfo ";
			stm = conn.prepareStatement(sql);
			rs = stm.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, stm, rs);
		}
		return result;
	}

	//链接分页列表
	public List<LinkInfo> getLinkList(PageInfo page) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement stm = null;
		ResultSet rs = null;
		LinkInfo link=null;
		List<LinkInfo> list = new ArrayList<LinkInfo>();
		try {
			conn = DBUtil.getConnection();
			String sql = "select * from linkinfo limit ?,?";
			stm = conn.prepareStatement(sql);
			stm.setInt(1, page.getBeginRow());
			stm.setInt(2, page.getPageSize());
			rs = stm.executeQuery();
			while (rs.next()) {
				link=new LinkInfo();
				link.setId(rs.getInt("id"));
				link.setLinkName(rs.getString("linkName"));
				link.setLinkStr(rs.getString("linkStr"));
				link.setState(rs.getInt("state"));
				list.add(link);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, stm, rs);
		}
		return list;
	}

}
