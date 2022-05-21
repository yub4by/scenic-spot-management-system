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
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;

import com.jspsmart.upload.SmartFile;
import com.jspsmart.upload.SmartRequest;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import util.PageUtil;
import beans.LinkInfo;
import beans.NewsInfo;
import beans.PageInfo;
import beans.SpotInfo;
import dao.LinkDao;
import dao.SpotDao;

public class LinkServlet extends HttpServlet {
	
	LinkDao dao=new LinkDao();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String flag = request.getParameter("flag");

		if ("sel".equals(flag)) {
			this.select(request, response);
		} else if ("add".equals(flag)) {
			this.add(request, response);
		} else if ("upd".equals(flag)) {
			this.update(request, response);
		} else if ("doUpd".equals(flag)) {
			this.doUpdate(request, response);
		} else if ("del".equals(flag)) {
			this.delect(request, response);
		}else if ("numDel".equals(flag)) {
			this.numDelect(request, response);
		}
	}

	//����ɾ��
	private void numDelect(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String link[] = request.getParameterValues("check");
		if (link != null) {
			int result = 0;
			for (int i = 0; i < link.length; i++) {
				int id = Integer.parseInt(link[i]);
				result = dao.delById(id);
			}
			if (result > 0) {
				out.println("<script>alert('ɾ���ɹ�');window.location.href='LinkServlet?flag=sel'</script>");
				out.close();
			} else {
				out.println("<script>alert('ɾ��ʧ�ܣ�������');window.location.href='LinkServlet?flag=sel'</script>");
				out.close();
			}
		}else{
			out.println("<script>alert('������ѡ��һ����');window.location.href='LinkServlet?flag=sel'</script>");	
			out.close();
		}
	}

	//����ɾ��
	private void delect(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String strId = request.getParameter("id");
		int id = Integer.parseInt(strId);
		int result = dao.delById(id);
		if (result > 0) {
			System.out.println("����ɾ���ɹ�");
			this.select(request, response);
		} else {
			System.out.println("����ɾ��ʧ��");
			this.select(request, response);
		}
	}

	//ʵʩ�޸�
	private void doUpdate(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SmartUpload smart = new SmartUpload();
		JspFactory _jspxFactory =JspFactory.getDefaultFactory();
		PageContext  pageContext = _jspxFactory.getPageContext(this, request, response,null, true, 8192, true);
		smart.initialize(pageContext);
		
		try {
			smart.upload();
			SmartRequest req = smart.getRequest();
			
			String strID=req.getParameter("id");
			int id=Integer.parseInt(strID);
			String name=req.getParameter("linkName");
			String str=req.getParameter("linkStr");
			String stateStr=req.getParameter("state");
			int state=Integer.parseInt(stateStr);
			
			LinkInfo link=new LinkInfo();
			link.setId(id);
			link.setLinkName(name);
			link.setLinkStr(str);
			link.setState(state);
			
			SmartFile file= smart.getFiles().getFile(0);
			int fileSize = file.getSize();  
			byte[] photo = new byte [fileSize];
			for (int i = 0; i < fileSize; i++) {
				photo[i] = file.getBinaryData(i);   
			}
			link.setPhoto(photo);
			
			int result = dao.update(link);
			if (result > 0) {
				System.out.println("���Ӹ��³ɹ�");
				this.select(request, response);
			} else {
				System.out.println("���Ӹ���ʧ��");
				request.getRequestDispatcher("pages/link/upd_link.jsp").forward(request,response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	//��ȡ�޸���Ϣ
	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String idStr = request.getParameter("id");
		int id = Integer.parseInt(idStr);
		LinkInfo link= dao.getlinkById(id);
		request.setAttribute("link", link);
		request.getRequestDispatcher("pages/link/upd_link.jsp").forward(request,response);
	}

	//��������
	private void add(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		SmartUpload smart = new SmartUpload();
		JspFactory _jspxFactory =JspFactory.getDefaultFactory();
		PageContext  pageContext = _jspxFactory.getPageContext(this, request, response,null, true, 8192, true);
		smart.initialize(pageContext);
		
		try {
			smart.upload();
			SmartRequest req = smart.getRequest();
			
			String name=req.getParameter("linkName");
			String str=req.getParameter("linkStr");
			LinkInfo link=new LinkInfo();
			link.setLinkName(name);
			link.setLinkStr(str);
			
			SmartFile file= smart.getFiles().getFile(0);
			int fileSize = file.getSize();  
			byte[] photo = new byte [fileSize];
			for (int i = 0; i < fileSize; i++) {
				photo[i] = file.getBinaryData(i);   
			}
			link.setPhoto(photo);
			
			int result = dao.addlink(link);
			if (result > 0) {
				System.out.println("������ӳɹ�");
				this.select(request, response);
			} else {
				System.out.println("�������ʧ��");
				this.select(request, response);
			}
			
		}catch(SmartUploadException e){
			e.printStackTrace();
		}
	}

	//�����б�
	private void select(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int pageSize = 5;
		int rowCount = dao.getLinkCount(); // һ������������
		int pageIndex = 1;

		String pageIndexStr = request.getParameter("pageIndex"); // ��ǰ�ڼ�ҳ
		if (pageIndexStr != null) {
			pageIndex = Integer.parseInt(pageIndexStr);
		}

		PageInfo page = PageUtil.getPage(pageSize, rowCount, pageIndex);

		List<LinkInfo> linkList = dao.getLinkList(page);

		request.setAttribute("page", page);
		request.setAttribute("linkList", linkList);

		request.getRequestDispatcher("pages/link/link_list.jsp").forward(request, response);
	}

}
