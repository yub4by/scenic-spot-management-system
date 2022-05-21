package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.DBUtil;
import beans.AreaInfo;
import beans.PageInfo;
import beans.SpotInfo;

public class AreaDao {
	
	//��Ӿ���
	public int addArea(AreaInfo area) {
		// TODO �Զ����ɵķ������
		int result=0;
		Connection con=null;
		PreparedStatement pstm=null;
		try{
			con=DBUtil.getConnection();
			String sql="insert into areaInfo(areaName,note) values(?,?)";
			pstm=con.prepareStatement(sql);
			pstm.setString(1, area.getAreaName());
			pstm.setString(2, area.getNote());
			result=pstm.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.close(con, pstm, null);
		}	
		return result;
	}
	
	//��ȡ��������
	public int getAreaCount() {
		// TODO �Զ����ɵķ������
		Connection con=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		int count=0;
		try{
			con=DBUtil.getConnection();
			String sql="select count(*) from areaInfo ";
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
	
	//������ҳ��ѯ�б�
	public List<AreaInfo> getAreaList(PageInfo page) {
		// TODO �Զ����ɵķ������
		AreaInfo area=null;
		List<AreaInfo> list=new ArrayList<AreaInfo>();
		Connection con=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try{
			con=DBUtil.getConnection();
			String sql="select * from areaInfo limit ?,? ";
			pstm=con.prepareStatement(sql);
			pstm.setInt(1, page.getBeginRow());
			pstm.setInt(2, page.getPageSize());
			rs=pstm.executeQuery();
			while(rs.next()){
				area=new AreaInfo();
				area.setId(rs.getInt("id"));
				area.setAreaName(rs.getString("areaName"));
				area.setNote(rs.getString("note"));
				area.setState(rs.getInt("state"));
				list.add(area);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.close(con, pstm, rs);
		}	
		return list;
	}

	//ɾ������
	public int deleteArea(int id) {
		// TODO �Զ����ɵķ������
		int result=0;
		Connection con=null;
		PreparedStatement pstm=null;
		try{
			con=DBUtil.getConnection();
			String sql="update areaInfo set state=0 where state=1 and id=?";
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

	//����ID��ȡ������Ϣ
	public AreaInfo getAreaById(int id) {
		// TODO �Զ����ɵķ������
		AreaInfo area=null;
		Connection con=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try{
			con=DBUtil.getConnection();
			String sql="select * from areaInfo where id=?";
			pstm=con.prepareStatement(sql);
			pstm.setInt(1, id);
			rs=pstm.executeQuery();
			if(rs.next()){
				area=new AreaInfo();
				area.setId(rs.getInt("id"));
				area.setAreaName(rs.getString("areaName"));
				area.setNote(rs.getString("note"));
				area.setState(rs.getInt("state"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.close(con, pstm, rs);
		}	
		return area;
	}

	//�޸ľ�����Ϣ
	public int updArea(AreaInfo area) {
		// TODO �Զ����ɵķ������
		int result=0;
		Connection con=null;
		PreparedStatement pstm=null;
		try{
			con=DBUtil.getConnection();
			String sql="update areaInfo set areaName=?,note=?,state=? where id=?";
			pstm=con.prepareStatement(sql);
			pstm.setString(1, area.getAreaName());
			pstm.setString(2, area.getNote());
			pstm.setInt(3, area.getState());
			pstm.setInt(4, area.getId());
			result=pstm.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.close(con, pstm, null);
		}	
		return result;
	}

	//ģ����ѯ��ȡ��������
	public int getCountByArea(String name, int id) {
		// TODO �Զ����ɵķ������
		Connection con=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		int count=0;
		try{
			con=DBUtil.getConnection();
			String sql=" select count(*) from areaInfo where 1=1 ";
				if(name!=null || "".equals(name)){
					sql+=" and binary areaName like '%"+name+"%' ";
				}
				if(id!=0){
					sql+=" and id like '%"+id+"%' ";
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

	//ģ����ѯ��ȡ�����б�
	public List<AreaInfo> queryAreaList(PageInfo page, AreaInfo a) {
		// TODO �Զ����ɵķ������
		AreaInfo area=null;
		List<AreaInfo> list=new ArrayList<AreaInfo>();
		Connection con=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try{
			con=DBUtil.getConnection();
			String sql="select * from areaInfo where 1=1 ";
			if(a.getAreaName()!=null || "".equals(a.getAreaName())){
				sql+=" and binary areaName like '%"+a.getAreaName()+"%' ";
			}
			if(a.getId()!=0){
				sql+=" and id like '%"+a.getId()+"%' ";
			}
			sql+="limit ?,?";
			pstm=con.prepareStatement(sql);
			pstm.setInt(1, page.getBeginRow());
			pstm.setInt(2, page.getPageSize());
			rs=pstm.executeQuery();
			while(rs.next()){
				area=new AreaInfo();
				area.setId(rs.getInt("id"));
				area.setAreaName(rs.getString("areaName"));
				area.setNote(rs.getString("note"));
				area.setState(rs.getInt("state"));
				list.add(area);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.close(con, pstm, rs);
		}	
		return list;
	}

	//δ��ҳ��ȡ������Ϣ���������ƣ�
	public List getFatherName() {
		// TODO Auto-generated method stub
		AreaInfo area=null;
		List<AreaInfo> list=new ArrayList<AreaInfo>();
		Connection con=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try{
			con=DBUtil.getConnection();
			String sql="select * from areaInfo  ";
			pstm=con.prepareStatement(sql);
			rs=pstm.executeQuery();
			while(rs.next()){
				area=new AreaInfo();
				area.setId(rs.getInt("id"));
				area.setAreaName(rs.getString("areaName"));
				area.setNote(rs.getString("note"));
				area.setState(rs.getInt("state"));
				list.add(area);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.close(con, pstm, rs);
		}	
		return list;
	}

}
