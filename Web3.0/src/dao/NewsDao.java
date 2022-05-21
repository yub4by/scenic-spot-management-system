package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DBUtil;
import beans.NewsInfo;
import beans.PageInfo;
import beans.UserInfo;

public class NewsDao {

	// 分页查询
	public List<NewsInfo> getNewsList(PageInfo page) {
		Connection conn = null;
		PreparedStatement stm = null;
		ResultSet rs = null;
		NewsInfo news = null;
		List<NewsInfo> list = new ArrayList<NewsInfo>();
		try {
			conn = DBUtil.getConnection();
			String sql = "select * from newsinfo limit ?,?";
			stm = conn.prepareStatement(sql);
			stm.setInt(1, page.getBeginRow());
			stm.setInt(2, page.getPageSize());
			rs = stm.executeQuery();
			while (rs.next()) {
				news = new NewsInfo();
				news.setId(rs.getInt("id"));
				news.setTitle(rs.getString("title"));
				news.setAuthor(rs.getString("author"));
				news.setContent(rs.getString("content"));
				news.setCreateDate(rs.getString("createDate"));
				news.setSeeCount(rs.getString("seeCount"));
				list.add(news);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, stm, rs);
		}
		return list;
	}

	// 查询一共多少条数据
	public int getUserCount() {
		Connection conn = null;
		PreparedStatement stm = null;
		ResultSet rs = null;
		int result = 0;
		try {
			conn = DBUtil.getConnection();
			String sql = "select count(*) from newsinfo ";
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

	// 查询所有
	public List<NewsInfo> selectAllUser() {
		Connection conn = null;
		PreparedStatement stm = null;
		ResultSet rs = null;
		NewsInfo news = null;
		List<NewsInfo> list = new ArrayList<NewsInfo>();
		try {
			conn = DBUtil.getConnection();
			String sql = "select * from newsinfo ";
			stm = conn.prepareStatement(sql);
			rs = stm.executeQuery();
			while (rs.next()) {
				news = new NewsInfo();
				news.setId(rs.getInt("id"));
				news.setTitle(rs.getString("title"));
				news.setAuthor(rs.getString("author"));
				news.setContent(rs.getString("content"));
				news.setCreateDate(rs.getString("createDate"));
				news.setSeeCount(rs.getString("seeCount"));
				list.add(news);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, stm, rs);
		}
		return list;
	}

	// 增加
	public int addNews(NewsInfo news) {
		Connection conn = null;
		PreparedStatement stm = null;
		int result = 0;
		try {
			conn = DBUtil.getConnection();
			String sql = "insert into newsinfo (title,author,content,createDate,seeCount) values(?,?,?,?,?) ";
			stm = conn.prepareStatement(sql);
			stm.setString(1, news.getTitle());
			stm.setString(2, news.getAuthor());
			stm.setString(3, news.getContent());
			stm.setString(4, news.getCreateDate());
			stm.setString(5, news.getSeeCount());
			result = stm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, stm, null);
		}
		return result;
	}

	// 根據title查詢到新闻再進行修改
	public NewsInfo getNewsByName(String title) {
		// TODO Auto-generated method stub
		NewsInfo news = null;
		Connection conn = null;
		PreparedStatement stm = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConnection();
			String sql = "select * from newsinfo where  title=? ";
			stm = conn.prepareStatement(sql);
			stm.setString(1, title);
			rs = stm.executeQuery();
			while (rs.next()) {
				news = new NewsInfo();
				news.setId(rs.getInt("id"));
				news.setTitle(rs.getString("title"));
				news.setAuthor(rs.getString("author"));
				news.setContent(rs.getString("content"));
				news.setCreateDate(rs.getString("createDate"));
				news.setSeeCount(rs.getString("seeCount"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, stm, rs);
		}
		return news;
	}

	// 根據id查詢到新闻再進行修改
	public NewsInfo getNewsById(int id) {
		// TODO Auto-generated method stub
		NewsInfo news = null;
		Connection conn = null;
		PreparedStatement stm = null;
		ResultSet rs = null;
		try {
			conn = DBUtil.getConnection();
			String sql = "select * from newsinfo where  id=? ";
			stm = conn.prepareStatement(sql);
			stm.setInt(1, id);
			rs = stm.executeQuery();
			while (rs.next()) {
				news = new NewsInfo();
				news.setId(rs.getInt("id"));
				news.setTitle(rs.getString("title"));
				news.setAuthor(rs.getString("author"));
				news.setContent(rs.getString("content"));
				news.setCreateDate(rs.getString("createDate"));
				news.setSeeCount(rs.getString("seeCount"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, stm, rs);
		}
		return news;
	}

	// 修改新闻内容
	public int updateNews(NewsInfo news) {
		Connection conn = null;
		PreparedStatement stm = null;
		int result = 0;
		try {
			conn = DBUtil.getConnection();
			String sql = " update newsinfo set title=?,author=?,content=?,createDate=?,seeCount=? where id=?";
			stm = conn.prepareStatement(sql);
			stm.setInt(6, news.getId());
			stm.setString(1, news.getTitle());
			stm.setString(2, news.getAuthor());
			stm.setString(3, news.getContent());
			stm.setString(4, news.getCreateDate());
			stm.setString(5, news.getSeeCount());
			result = stm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.close(conn, stm, null);
		}
		return result;
	}

	// 根据id删除用新闻（真删！）
	public int delNewsById(int id) {
		Connection conn = null;
		PreparedStatement stm = null;
		int result = 0;
		try {
			conn = DBUtil.getConnection();
			String sql = " delete from newsinfo where id=? ";
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

	//浏览次数+1
	public int addSeeCount(int id) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement stm = null;
		int result = 0;
		try {
			conn = DBUtil.getConnection();
			String sql = " update newsinfo set seeCount=seeCount+1 where id=? ";
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
	
}
