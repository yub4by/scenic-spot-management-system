package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.PageUtil;
import beans.NewsInfo;
import beans.PageInfo;
import dao.NewsDao;

public class NewsServlet extends HttpServlet {
	
	private NewsDao dao = new NewsDao();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String flag = request.getParameter("flag");

		if ("manage".equals(flag)) {
			this.manageNews(request, response);
		} else if ("add".equals(flag)) {
			this.addNews(request, response);
		} else if ("updateid".equals(flag)) {
			this.updateNewsById(request, response);
		} else if ("update".equals(flag)) {
			this.updateNews(request, response);
		} else if ("del".equals(flag)) {
			this.delNews(request, response);
		}else if ("numdel".equals(flag)) {
			this.delSomeNews(request, response);
		}else if ("seecount".equals(flag)){
			this.addSeeCount(request, response);
		}

	}

	//�������+1
	private void addSeeCount(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		String strID=request.getParameter("id");
		//System.out.println(strID);
		int id=Integer.parseInt(strID);
		NewsInfo news=dao.getNewsById(id);
		if(news!=null){
			int result=dao.addSeeCount(id);
			if(result>0){
				System.out.println("ok +1");
			}else{
				System.out.println("error");
			}
			request.setAttribute("news", news);
			request.getRequestDispatcher("news.jsp").forward(request,response);
		}else{
			request.getRequestDispatcher("error.jsp").forward(request,response);
		}
	}

	// �����û�
	private void addNews(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		response.setContentType("text/html;charset=utf-8");
		String title = request.getParameter("title");// ��Ŀ
		String author = request.getParameter("author");// ����
		String content = request.getParameter("content");// ����
		String seeCount = request.getParameter("seeCount");// �������

		NewsInfo news = new NewsInfo();
		news.setTitle(title);
		news.setAuthor(author);
		news.setContent(content);
		String createDate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date());
		news.setCreateDate(createDate);
		news.setSeeCount(seeCount);
		
		int result = dao.addNews(news);
		if (result > 0) {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('�����ɹ�');</script>");
			out.println("<script>location='NewsServlet?flag=manage'</script>");
			out.close();
			out.flush();
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('����ʧ��');</script>");
			out.println("<script>location='add_news.jsp'</script>");
			out.close();
			out.flush();
		}
	}

	// �޸��Ñ�
	private void updateNews(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		String idStr = request.getParameter("id");
		int id = Integer.parseInt(idStr);
		String title = request.getParameter("title");// ��Ŀ
		String author = request.getParameter("author");// ����
		String content = request.getParameter("content");// ����
		String createDate = request.getParameter("createDate");// ����ʱ��
		String seeCount = request.getParameter("seeCount");//�������

		NewsInfo news = new NewsInfo();
		news.setId(id);
		news.setTitle(title);
		news.setAuthor(author);
		news.setContent(content);
		news.setCreateDate(createDate);
		news.setSeeCount(seeCount);
		
		int result = dao.updateNews(news);
		if (result > 0) {
			this.manageNews(request, response);
		} else {
			request.setAttribute("msg", "�����޸�ʧ��");
			request.getRequestDispatcher("pages/news/upd_news.jsp").forward(request,
					response);
		}
	}

	// ����id��ԃ�Ñ��D���޸Ľ���
	private void updateNewsById(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String idStr = request.getParameter("id");
		int id = Integer.parseInt(idStr);
		NewsInfo news = dao.getNewsById(id);
		request.setAttribute("news", news);
		request.getRequestDispatcher("pages/news/upd_news.jsp").forward(request,
				response);
	}

	// ɾ���û�����ɾ����
	private void delNews(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		String strId = request.getParameter("id");
		int id = Integer.parseInt(strId);
		int result = dao.delNewsById(id);
		if (result > 0) {
			System.out.println("����ɾ���ɹ�");
			this.manageNews(request, response);
		} else {
			System.out.println("����ɾ��ʧ��");
			this.manageNews(request, response);
		}
	}
	
	// ����ɾ��
	private void delSomeNews(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		PrintWriter out = response.getWriter();
		String news[] = request.getParameterValues("check");
		if (news != null) {
			int result = 0;
			for (int i = 0; i < news.length; i++) {
				int id = Integer.parseInt(news[i]);
				result = dao.delNewsById(id);
			}
			if (result > 0) {
				out.println("<script>alert('ɾ���ɹ�');window.location.href='NewsServlet?flag=manage'</script>");
				out.close();
			} else {
				out.println("<script>alert('ɾ��ʧ�ܣ�������');window.location.href='NewsServlet?flag=manage'</script>");
				out.close();
			}
		}else{
			out.println("<script>alert('������ѡ��һ����');window.location.href='NewsServlet?flag=manage'</script>");	
			out.close();
		}

	}

	// ��ҳ��ѯ
	private void manageNews(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		int pageSize = 5;
		int rowCount = dao.getUserCount(); 
		int pageIndex = 1;

		String pageIndexStr = request.getParameter("pageIndex"); 
		if (pageIndexStr != null) {
			pageIndex = Integer.parseInt(pageIndexStr);
		}

		PageInfo page = PageUtil.getPage(pageSize, rowCount, pageIndex);

		List<NewsInfo> userList = dao.getNewsList(page);

		request.setAttribute("page", page);
		request.setAttribute("newsList", userList);

		request.getRequestDispatcher("pages/news/news_list.jsp").forward(request, response);
	}

}
