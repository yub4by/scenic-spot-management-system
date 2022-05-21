package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.SystemInfo;
import beans.UserInfo;

import dao.SystemDao;

public class SystemServlet extends HttpServlet {

	private SystemDao dao = new SystemDao();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String flag=request.getParameter("flag");
		
		if("a".equals(flag))
		{
			String webname = request.getParameter("webname");
			String webyu = request.getParameter("webyu");
			String webdescribe = request.getParameter("webdescribe");
			String copyright = request.getParameter("copyright");
			String num = request.getParameter("num");
			String tel = request.getParameter("tel");
			String other = request.getParameter("other");
			int id = 1; 
			SystemInfo system = new SystemInfo();
			system.setWebname(webname);
			system.setWebYu(webyu);
			system.setWebdescribe(webdescribe);
			system.setCopyright(copyright);
			system.setNum(num);
			system.setTel(tel);
			system.setOther(other);
			system.setId(id);
			int res = dao.updataSystem(system);
			if(res>0)
			{
				request.setAttribute("msg", "修改成功");
				request.setAttribute("system", system);
				request.getRequestDispatcher("pages/system/SystemSet.jsp").forward(request, response);
			}
			else
			{
				request.setAttribute("msg","修改失败！！");
				request.getRequestDispatcher("pages/system/SystemSet.jsp").forward(request, response);
			}
			
		}
		else
		{
			SystemInfo system = dao.getSysById(1);
			request.setAttribute("system", system);
			request.getRequestDispatcher("pages/system/SystemSet.jsp").forward(request, response);
		}
	}

}
