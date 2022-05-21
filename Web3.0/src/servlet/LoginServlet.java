package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.Des;

import beans.UserInfo;
import dao.UserDao;

public class LoginServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userName=request.getParameter("userName");
    	String password=request.getParameter("password");
    	//password=Des.encStr(password);//明文密码变密文去匹配数据库中的密文
    	if(password==null){
    		request.setAttribute("msg", "用户名或密码错误");
    		request.getRequestDispatcher("login.jsp").forward(request, response);
    	}else{
    		UserDao dao=new UserDao();
        	UserInfo user=dao.getLoginUser(userName, password);
        	if(user!=null){
        		HttpSession session=request.getSession();//first session
        		session.setAttribute("user", user);
        		
        		if(user.getId()==1||user.getId()==2){
        			System.out.println("管理员登陆成功");
        			request.getRequestDispatcher("pages/main/index.jsp").forward(request, response);
        		}else{
        			System.out.println("游客登陆成功");
        			request.getRequestDispatcher("MainServlet").forward(request, response);
        		}
        	}else{
        		request.setAttribute("msg", "用户名或密码错误");
        		request.getRequestDispatcher("login.jsp").forward(request, response);
        	}
    	}
	}

}
