package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.AreaInfo;
import beans.LinkInfo;
import beans.MessageInfo;
import beans.NewsInfo;
import beans.SpotInfo;
import beans.SystemInfo;
import beans.UserInfo;
import beans.VideoInfo;
import dao.MainDao;
import dao.SystemDao;
import dao.UserDao;

public class MainServlet extends HttpServlet {
	
	private MainDao dao=new MainDao();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//����
		List<SpotInfo> spotList=dao.getSpotList();
		request.setAttribute("spotList", spotList);
		
		//����
		List<AreaInfo> areaList=dao.getAreaList();
		request.setAttribute("areaList", areaList);
		
		//����
		List<MessageInfo> msgList=dao.getMsgList();
		request.setAttribute("msgList", msgList);
		
		//�ظ�
		List<MessageInfo> msgListt=dao.getMsgListt();
		request.setAttribute("msgListt", msgListt);
		
		//����
		List<NewsInfo> newsList=dao.getNewsList();
		request.setAttribute("newsList", newsList);
		
		//��Ƶ
		List<VideoInfo> videoList=dao.getVideoList();
		request.setAttribute("videoList", videoList);
		
		//����
		List<LinkInfo> linkList=dao.getLinkList();
		request.setAttribute("linkList", linkList);
		
		//ϵͳ
		SystemInfo system = new SystemDao().getSysById(1);
		request.setAttribute("system", system);
		
		request.getRequestDispatcher("main.jsp").forward(request, response);
	}


}
