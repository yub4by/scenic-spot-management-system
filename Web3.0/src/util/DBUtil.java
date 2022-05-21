package util;

import java.sql.*;


public class DBUtil {
	//测试连接数据库
	/*public static void main(String[] args) {
		getConnection();
		System.out.println("ok");
	}*/
	
	private DBUtil(){};
	
	private static String driver="com.mysql.jdbc.Driver";
	private static String url="jdbc:mysql://localhost:3306/test";
	private static String user="root";
	private static String password="root";
	
	static{
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection(){
		Connection con=null;
		try {
			con=DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return con;
	}
	
	public static void close(Connection con,Statement stm,ResultSet rs){
		if(con!=null){
			try {
				con.close();
			} catch (SQLException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
		}
		if(stm!=null){
			try {
				stm.close();
			} catch (SQLException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
		}
		if(rs!=null){
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
		}
	}
	
}
