package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import beans.SystemInfo;

import util.DBUtil;

public class SystemDao {

	//获取系统设置信息
	public SystemInfo getSysById(int i) {
		SystemInfo system = null;
		Connection con=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try{
			con=DBUtil.getConnection();
			String sql="select * from systemInfo where id=?";
			pstm=con.prepareStatement(sql);
			pstm.setInt(1, i);
			rs=pstm.executeQuery();
			if(rs.next()){
				system = new SystemInfo();
				system.setWebname(rs.getString("Webname"));
				system.setWebYu(rs.getString("WebYu"));
				system.setWebdescribe(rs.getString("Webdescribe"));
				system.setCopyright(rs.getString("copyright"));
				system.setNum(rs.getString("Num"));
				system.setTel(rs.getString("Tel"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.close(con, pstm, rs);
		}	
		return system;
	}
	
	//更新系统设置
	public int updataSystem(SystemInfo system) {
		
		int result=0;
		Connection con=null;
		PreparedStatement pstm=null;
		try{
			con=DBUtil.getConnection();
			String sql="update systemInfo set Webname=?,WebYu=?,Webdescribe=?,copyright=?,Num=?,Tel=?,Other=? where id=?";
			pstm=con.prepareStatement(sql);
			pstm.setString(1, system.getWebname());
			pstm.setString(2, system.getWebYu());
			pstm.setString(3, system.getWebdescribe());
			pstm.setString(4, system.getCopyright());
			pstm.setString(5, system.getNum());
			pstm.setString(6, system.getTel());
			pstm.setString(7, system.getOther());
			pstm.setInt(8, system.getId());
			result=pstm.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.close(con, pstm, null);
		}	
		return result;
	}
}
