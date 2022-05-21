package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.DBUtil;
import beans.PageInfo;
import beans.SpotInfo;
import beans.UserInfo;

public class SpotDao {

	//增加景点
	public int addSpot(SpotInfo spot) {
		// TODO Auto-generated method stub
		int result=0;
		Connection con=null;
		PreparedStatement pstm=null;
		try{
			con=DBUtil.getConnection();
			String sql="insert into spotInfo(spotName,address,note,photo) values(?,?,?,?)";
			pstm=con.prepareStatement(sql);
			pstm.setString(1, spot.getSpotName());
			pstm.setString(2, spot.getAddress());
			pstm.setString(3, spot.getNote());
			pstm.setBytes(4, spot.getPhoto());
			result=pstm.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.close(con, pstm, null);
		}	
		return result;
	}

	//获取景点数量
	public int getSpotCount() {
		// TODO Auto-generated method stub
		Connection con=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		int count=0;
		try{
			con=DBUtil.getConnection();
			String sql="select count(*) from spotInfo where state='1' ";
			pstm=con.prepareStatement(sql);
			rs=pstm.executeQuery();
			if(rs.next()){
				count=rs.getInt(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.close(con, pstm, rs);
		}	
		return count;
	}

	//分页显示景点列表
	public List<SpotInfo> getSpotList(PageInfo page) {
		// TODO Auto-generated method stub
		SpotInfo spot=null;
		List<SpotInfo> list=new ArrayList<SpotInfo>();
		Connection con=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try{
			con=DBUtil.getConnection();
			String sql="select * from spotInfo where photo is not null and state='1' limit ?,? ";
			pstm=con.prepareStatement(sql);
			pstm.setInt(1, page.getBeginRow());
			pstm.setInt(2, page.getPageSize());
			rs=pstm.executeQuery();
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
	
	//根据ID获取景点信息
	public SpotInfo getSpotById(int id) {
		// TODO 自动生成的方法存根
		SpotInfo spot=null;
		Connection con=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try{
			con=DBUtil.getConnection();
			String sql="select * from spotInfo where id=?";
			pstm=con.prepareStatement(sql);
			pstm.setInt(1, id);
			rs=pstm.executeQuery();
			if(rs.next()){
				spot=new SpotInfo();
				spot.setId(rs.getInt("id"));
				spot.setSpotName(rs.getString("spotName"));
				spot.setAddress(rs.getString("address"));
				spot.setNote(rs.getString("note"));
				spot.setPhoto(rs.getBytes("photo"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.close(con, pstm, rs);
		}	
		return spot;
	}

	//删除景点
	public int deleteSpot(int id) {
		// TODO Auto-generated method stub
		int result=0;
		Connection con=null;
		PreparedStatement pstm=null;
		try{
			con=DBUtil.getConnection();
			String sql="update spotInfo set state=0 where state=1 and id=?";
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

	//修改景点信息
	public int updateSpot(SpotInfo spot) {
		// TODO Auto-generated method stub
		int result=0;
		Connection con=null;
		PreparedStatement pstm=null;
		try{
			con=DBUtil.getConnection();
			String sql="";
			if(spot.getPhoto().length!=0){
				sql="update spotInfo set spotName=?,address=?,note=?,photo=? where id=?";
			}else{
				sql="update spotInfo set spotName=?,address=?,note=? where id=?";
			}
			pstm=con.prepareStatement(sql);
			if(spot.getPhoto().length!=0){
				pstm.setString(1, spot.getSpotName());
				pstm.setString(2, spot.getAddress());
				pstm.setString(3, spot.getNote());
				pstm.setBytes(4, spot.getPhoto());
				pstm.setInt(5, spot.getId());
			}else{
				pstm.setString(1, spot.getSpotName());
				pstm.setString(2, spot.getAddress());
				pstm.setString(3, spot.getNote());
				pstm.setInt(4, spot.getId());
			}
			result=pstm.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.close(con, pstm, null);
		}	
		return result;
	}

	//已删除景点列表
	public List<SpotInfo> getDelSpotList() {
		// TODO Auto-generated method stub
		SpotInfo spot=null;
		List<SpotInfo> list=new ArrayList<SpotInfo>();
		Connection con=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try{
			con=DBUtil.getConnection();
			String sql="select * from spotInfo where state=0";
			pstm=con.prepareStatement(sql);
			rs=pstm.executeQuery();
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

	//恢复已删除景点
	public int recoverSpot(int id) {
		// TODO Auto-generated method stub
		int result=0;
		Connection con=null;
		PreparedStatement pstm=null;
		try{
			con=DBUtil.getConnection();
			String sql="update spotInfo set state=1 where state=0 and id=?";
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

	//模糊查询获取景点数量
	public int getCountBySpot(String name, String address) {
		// TODO Auto-generated method stub
		Connection con=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		int count=0;
		try{
			con=DBUtil.getConnection();
			String sql=" select count(*) from spotInfo where 1=1 ";
				if(name!=null || "".equals(name)){
					sql+=" and binary spotName like '%"+name+"%' ";
				}
				if(address!=null || "".equals(address)){
					sql+=" and binary address like '%"+address+"%' ";
				}
			pstm=con.prepareStatement(sql);
			rs=pstm.executeQuery();
			if(rs.next()){
				count=rs.getInt(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.close(con, pstm, rs);
		}	
		return count;
	}

	//模糊查询分页景点列表
	public List<SpotInfo> queryListSpot(PageInfo page, SpotInfo s) {
		// TODO Auto-generated method stub
		SpotInfo spot=null;
		List<SpotInfo> list=new ArrayList<SpotInfo>();
		Connection con=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try{
			con=DBUtil.getConnection();
			String sql="select * from spotInfo  where 1=1 ";
			if(s.getSpotName()!=null || "".equals(s.getSpotName())){
				sql+=" and binary spotName like '%"+s.getSpotName()+"%' ";
			}
			if(s.getAddress()!=null || "".equals(s.getAddress())){
				sql+=" and binary address like '%"+s.getAddress()+"%' ";
			}
			sql+="limit ?,?";
			pstm=con.prepareStatement(sql);
			pstm.setInt(1, page.getBeginRow());
			pstm.setInt(2, page.getPageSize());
			rs=pstm.executeQuery();
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

	//未分页获取景点信息（景点名称）
	public List<SpotInfo> getSonName() {
		// TODO Auto-generated method stub
		SpotInfo spot=null;
		List<SpotInfo> list=new ArrayList<SpotInfo>();
		Connection con=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try{
			con=DBUtil.getConnection();
			String sql="select * from spotInfo ";
			pstm=con.prepareStatement(sql);
			rs=pstm.executeQuery();
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

}
