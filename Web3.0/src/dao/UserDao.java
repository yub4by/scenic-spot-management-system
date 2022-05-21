package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.DBUtil;
import util.Des;
import beans.PageInfo;
import beans.UserInfo;

public class UserDao {

	//����Ա����û����û�ע�ᣩ
	public int addUser(UserInfo user) {
		// TODO Auto-generated method stub
		int result=0;
		Connection con=null;
		PreparedStatement pstm=null;
		try{
			con=DBUtil.getConnection();
			String sql="insert into userInfo(userName,password,note) values(?,?,?)";
			pstm=con.prepareStatement(sql);
			pstm.setString(1, user.getUserName());
			pstm.setString(2, user.getPassword());//������
			pstm.setString(3, user.getNote());
			result=pstm.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.close(con, pstm, null);
		}	
		return result;
	}
	
	//��ȡ���ݿ���һ���ж������û�����
	public int getUserCount() {
		// TODO Auto-generated method stub
		Connection con=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		int count=0;
		try{
			con=DBUtil.getConnection();
			String sql="select count(*) from userInfo where state=1 ";
			pstm=con.prepareStatement(sql);
			rs=pstm.executeQuery();
			if(rs.next()){
				count=rs.getInt(1);//���ص���һ��һ�е�һ������
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.close(con, pstm, rs);
		}	
		return count;
	}
	
	//��ҳ��ѯ
	public List<UserInfo> getUserList(PageInfo page) {
		// TODO Auto-generated method stub
		UserInfo user=null;
		List<UserInfo> list=new ArrayList<UserInfo>();
		Connection con=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try{
			con=DBUtil.getConnection();
			String sql="select * from userInfo where state=1 limit ?,? ";//where photo is not null and
			pstm=con.prepareStatement(sql);
			pstm.setInt(1, page.getBeginRow());
			pstm.setInt(2, page.getPageSize());
			rs=pstm.executeQuery();
			while(rs.next()){
				user=new UserInfo();
				user.setId(rs.getInt("id"));
				user.setUserName(rs.getString("userName"));
				user.setPassword(Des.desStr(rs.getString("password")));//���ݿ�������ת������
				user.setNote(rs.getString("note"));
				user.setPhoto(rs.getBytes("photo"));
				list.add(user);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.close(con, pstm, rs);
		}	
		return list;
	}
	
	//��ȡ���ݿ���һ���ж��������ϲ�ѯ�������û�����
	public int getCountByUser(String name,String note) {
		// TODO �Զ����ɵķ������
		Connection con=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		int count=0;
		try{
			con=DBUtil.getConnection();
			String sql=" select count(*) from userInfo where 1=1 ";
				if(name!=null || "".equals(name)){
					sql+=" and binary userName like '%"+name+"%' ";
				}
				if(note!=null || "".equals(note)){
					sql+=" and binary note like '%"+note+"%' ";
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
	
	//ģ����ѯ    
	public List<UserInfo> queryListUser(PageInfo page, UserInfo u) {
		// TODO �Զ����ɵķ������
		UserInfo user=null;
		List<UserInfo> list=new ArrayList<UserInfo>();
		Connection con=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try{
			con=DBUtil.getConnection();
			String sql="select * from userInfo  where 1=1 ";
			if(u.getUserName()!=null || "".equals(u.getUserName())){
				sql+=" and binary userName like '%"+u.getUserName()+"%' ";
			}
			if(u.getNote()!=null || "".equals(u.getNote())){
				sql+=" and binary note like '%"+u.getNote()+"%' ";
			}
			sql+="limit ?,?";
			pstm=con.prepareStatement(sql);
			pstm.setInt(1, page.getBeginRow());
			pstm.setInt(2, page.getPageSize());
			rs=pstm.executeQuery();
			while(rs.next()){
				user=new UserInfo();
				user.setId(rs.getInt("id"));
				user.setUserName(rs.getString("userName"));
				user.setPassword(Des.desStr(rs.getString("password")));//���ݿ�������ת������
				user.setNote(rs.getString("note"));
				user.setPhoto(rs.getBytes("photo"));
				list.add(user);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.close(con, pstm, rs);
		}	
		return list;
	}
	
	//����ID��ȡ�û���Ϣ
	public UserInfo getUserById(int id) {
		// TODO �Զ����ɵķ������
		UserInfo user=null;
		Connection con=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try{
			con=DBUtil.getConnection();
			String sql="select * from userInfo where id=?";
			pstm=con.prepareStatement(sql);
			pstm.setInt(1, id);
			rs=pstm.executeQuery();
			if(rs.next()){
				user=new UserInfo();
				user.setId(rs.getInt("id"));
				user.setUserName(rs.getString("userName"));
				user.setPassword(Des.desStr(rs.getString("password")));//���ݿ�������ת������
				user.setNote(rs.getString("note"));
				user.setPhoto(rs.getBytes("photo"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.close(con, pstm, rs);
		}	
		return user;
	}

	//ɾ���û�
	public int deleteUser(int id) {
		// TODO �Զ����ɵķ������
		int result=0;
		Connection con=null;
		PreparedStatement pstm=null;
		try{
			con=DBUtil.getConnection();
			String sql="update userInfo set state=0 where state=1 and id=?";
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
	
	//�޸��û���Ϣ
	public int updateUser(UserInfo user) {
		// TODO �Զ����ɵķ������
		int result=0;
		Connection con=null;
		PreparedStatement pstm=null;
		try{
			con=DBUtil.getConnection();
			String sql="";
			if(user.getPhoto().length!=0){
				sql="update userInfo set userName=?,password=?,note=?,photo=? where id=?";
			}else{
				sql="update userInfo set userName=?,password=?,note=? where id=?";
			}
			pstm=con.prepareStatement(sql);
			if(user.getPhoto().length!=0){
				pstm.setString(1, user.getUserName());
				pstm.setString(2, user.getPassword());//������
				pstm.setString(3, user.getNote());
				pstm.setBytes(4, user.getPhoto());
				pstm.setInt(5, user.getId());
			}else{
				pstm.setString(1, user.getUserName());
				pstm.setString(2, user.getPassword());//������
				pstm.setString(3, user.getNote());
				pstm.setInt(4, user.getId());
			}
			result=pstm.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.close(con, pstm, null);
		}	
		return result;
	}

	//��ȡ��¼�û���Ϣ
	public UserInfo getLoginUser(String userName, String password) {
		// TODO �Զ����ɵķ������
		UserInfo user=null;
		Connection con=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try{
			con=DBUtil.getConnection();
			String sql="select * from userInfo where binary userName=? and binary password=?";//���ִ�Сд
			pstm=con.prepareStatement(sql);
			pstm.setString(1, userName);
			//pstm.setString(2, password);
			pstm.setString(2, Des.encStr(password));//������
			rs=pstm.executeQuery();
			if(rs.next()){
				user=new UserInfo();
				user.setId(rs.getInt("id"));
				user.setUserName(rs.getString("userName"));
				user.setPassword(rs.getString("password"));
				user.setNote(rs.getString("note"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.close(con, pstm, rs);
		}	
		return user;
	}

	//�����û�����ȡ�û���Ϣ
	public UserInfo getUserByName(String name) {
		// TODO Auto-generated method stub
		UserInfo user=null;
		Connection con=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try{
			con=DBUtil.getConnection();
			String sql="select * from userInfo where userName=?";
			pstm=con.prepareStatement(sql);
			pstm.setString(1, name);
			rs=pstm.executeQuery();
			if(rs.next()){
				user=new UserInfo();
				user.setId(rs.getInt("id"));
				user.setUserName(rs.getString("userName"));
				user.setPassword(Des.desStr(rs.getString("password")));//���ݿ�������ת������
				user.setNote(rs.getString("note"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.close(con, pstm, rs);
		}	
		return user;
	}

	//��ȡ��ɾ�����û��б�
	public List<UserInfo> getDelUserList() {
		// TODO Auto-generated method stub
		UserInfo user=null;
		List<UserInfo> list=new ArrayList<UserInfo>();
		Connection con=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try{
			con=DBUtil.getConnection();
			String sql="select * from userInfo where state=0";
			pstm=con.prepareStatement(sql);
			rs=pstm.executeQuery();
			while(rs.next()){
				user=new UserInfo();
				user.setId(rs.getInt("id"));
				user.setUserName(rs.getString("userName"));
				user.setPassword(Des.desStr(rs.getString("password")));//���ݿ�������ת������
				user.setNote(rs.getString("note"));
				user.setPhoto(rs.getBytes("photo"));
				list.add(user);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBUtil.close(con, pstm, rs);
		}	
		return list;
	}

	//�ָ���ɾ�����û�
	public int recoverUser(int id) {
		// TODO Auto-generated method stub
		int result=0;
		Connection con=null;
		PreparedStatement pstm=null;
		try{
			con=DBUtil.getConnection();
			String sql="update userInfo set state=1 where state=0 and id=?";
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

	//����ɾ��
	public int allDelUser(int id) {
		// TODO Auto-generated method stub
		int result=0;
		Connection con=null;
		PreparedStatement pstm=null;
		try{
			con=DBUtil.getConnection();
			String sql=" update userInfo set state=0 where state=1 and id=? ";
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

}
