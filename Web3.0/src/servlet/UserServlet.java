package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;

import com.jspsmart.upload.SmartFile;
import com.jspsmart.upload.SmartRequest;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import util.Des;
import util.PageUtil;
import beans.PageInfo;
import beans.UserInfo;
import dao.UserDao;


public class UserServlet extends HttpServlet {
	
	private UserDao dao=new UserDao();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String flag=request.getParameter("flag");
		
		if("deld".equals(flag)){
			this.deldUser(request,response);
		}if("rcv".equals(flag)){
			this.rcvUser(request,response);
		}if("add".equals(flag)){
			this.addUser(request,response);
		}if("del".equals(flag)){
			this.delUser(request,response);
		}if("upd".equals(flag)){
			this.updUser(request,response);
		}if("doUpdate".equals(flag)){
			this.doUpdate(request,response);
		}if("reg".equals(flag)){
			this.regUser(request,response);
		}if("logout".equals(flag)){
			this.logout(request,response);
		}if("checkName".equals(flag)){
			this.checkName(request,response);
		}if("query".equals(flag)){
			this.queryListUser(request,response);
		}if("sel".equals(flag)){
			this.selUser(request,response);
		}if("mh".equals(flag)){
			this.queryListUser(request,response);
		}if("alldel".equals(flag)){
			this.allDelUser(request,response);
		}
	}
	
	//����ɾ��
	private void allDelUser(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//out���ַ�ʽ̫����
		PrintWriter out = response.getWriter();
		
		String news[] = request.getParameterValues("check");
		if (news != null) {
			int result = 0;
			for (int i = 0; i < news.length; i++) {
				int id = Integer.parseInt(news[i]);
				result = dao.allDelUser(id);
			}
			if (result > 0) {
				//out.println("<script>alert('ɾ���ɹ�');window.location.href='UserServlet?flag=sel'</script>");
				System.out.println("�û�ɾ���ɹ�");
			} else {
				//out.println("<script>alert('ɾ��ʧ��');window.location.href='UserServlet?flag=sel'</script>");
				System.out.println("�û�ɾ��ʧ��");
			}
		}else{
			//out.println("<script>alert('������ѡ��һ�����ݣ�');window.location.href='UserServlet?flag=sel'</script>");	
			System.out.println("δѡ������");
		}
		//out.close();
		this.selUser(request, response);
	}

	//�ָ���ɾ�û�
	private void rcvUser(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String strID=request.getParameter("id");
		int id=Integer.parseInt(strID);
		int result=dao.recoverUser(id);
		if(result>0){
			System.out.println("�û��ָ��ɹ�");
			this.selUser(request, response);
		}else{
			System.out.println("�û��ָ�ʧ��");
			this.selUser(request, response);
		}
	}

	//��ɾ�û��б�
	private void deldUser(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<UserInfo> list=dao.getDelUserList();
		request.setAttribute("list", list);
		request.getRequestDispatcher("pages/user/user_del.jsp").forward(request, response);
	}

	//����֤����û���
	private void checkName(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		String userName=request.getParameter("userName");
		if("".equals(userName)||userName==null){
			response.getWriter().print("����д�û���");
		}else{
			UserInfo user=dao.getUserByName(userName);
			if(user!=null){
				response.getWriter().print("�û����Ѵ���");
			}else{
				response.getWriter().print("ok");
			}
		}
	}

	//��½�û�ע��
	private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
	  HttpSession session=request.getSession();
	  /*session.removeAttribute("user");*/
	  session.invalidate();
	  request.setAttribute("msg", "��ע���������µ�¼");
	  request.getRequestDispatcher("/login.jsp").forward(request, response);
	}

	//ģ����ѯ
	private void queryListUser(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO �Զ����ɵķ������
		
		String name=request.getParameter("name");
		String note=request.getParameter("note");
		
		/*name=new String(name.getBytes("iso8859-1"),"utf-8");
		note=new String(note.getBytes("iso8859-1"),"utf-8");*/
		//System.out.println(name+note);
		
		int pageSize=5;
		int rowCount=dao.getCountByUser(name,note);//����Ϊ0����Ϊȫ��
		
		int pageIndex=1;//���ݳ�ʼ����ǰҳ    ���鲻������(����0������  1/1ҳ  ��ҳβҳ����ҳ�������� ��ʱת��ֻ��1�Ҳ��ɱ䶯)
		
		String pageIndexStr=request.getParameter("pageIndex");//��ȡ��ǰҳ  ������û�����ݳ�ʼ��   ��ǰҳ��Ϊ1
		if(pageIndexStr!=null){
			pageIndex=Integer.parseInt(pageIndexStr);
		}
		
		PageInfo pageNew=PageUtil.getPage(pageSize,rowCount,pageIndex);
		
		UserInfo user=new UserInfo();
		user.setUserName(name);
		user.setNote(note);
		
		List<UserInfo> userListNew=dao.queryListUser(pageNew,user);
		
		request.setAttribute("page", pageNew);
		request.setAttribute("userList", userListNew);
		request.setAttribute("list", "query");
		
		request.getRequestDispatcher("pages/user/user_list.jsp").forward(request, response);
	}

	//ע���û�
	private void regUser(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO �Զ����ɵķ������
			String name=request.getParameter("userName");
			String pswd=request.getParameter("password");
			String note=request.getParameter("email");
			UserInfo user=new UserInfo();
			user.setUserName(name);
			String miStr=Des.encStr(pswd);
			user.setPassword(miStr);
			user.setNote(note);
			int result=dao.addUser(user);
			if(result>0){
				request.setAttribute("msg", "ע��ɹ����¼");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}else{
				request.setAttribute("msg", "ע��ʧ��������");
				request.getRequestDispatcher("enroll.jsp").forward(request, response);
			}
	}

	//ʵʩ����
	private void doUpdate(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO �Զ����ɵķ������
		SmartUpload smart = new SmartUpload();
		JspFactory _jspxFactory =JspFactory.getDefaultFactory();
		PageContext  pageContext = _jspxFactory.getPageContext(this, request, response,null, true, 8192, true);
		smart.initialize(pageContext);
		
		try {
			smart.upload();
			SmartRequest req = smart.getRequest();
			
			String strID=req.getParameter("id");
			int id=Integer.parseInt(strID);
			String userName = req.getParameter("userName");
			String password = req.getParameter("password");
			String note = req.getParameter("note");
			UserInfo user= new UserInfo();
			user.setId(id);
			user.setNote(note);
			user.setUserName(userName);
			String miStr=Des.encStr(password);
			user.setPassword(miStr);
			
			SmartFile file= smart.getFiles().getFile(0);
			int fileSize = file.getSize();  
			byte[] photo = new byte [fileSize];
			for (int i = 0; i < fileSize; i++) {
				photo[i] = file.getBinaryData(i);   
			}
			user.setPhoto(photo);
			
			int result=dao.updateUser(user);
			if(result>0){
				System.out.println("�û��޸ĳɹ�");
				this.selUser(request, response);
			}else{
				System.out.println("�û��޸�ʧ��");
				this.selUser(request, response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	//��ҳ�û��б�
	private void selUser(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int pageSize=5;
		int rowCount=dao.getUserCount();//��ȡ���ݿ���һ���ж���������
		int pageIndex=1;
	
		String pageIndexStr=request.getParameter("pageIndex");//��ȡ��ǰҳ�ǵڼ�ҳ
		if(pageIndexStr!=null){
			pageIndex=Integer.parseInt(pageIndexStr);
		}
		
		PageInfo page=PageUtil.getPage(pageSize,rowCount,pageIndex);
		
		List<UserInfo> userList=dao.getUserList(page);
		/*List<UserInfo> list=new ArrayList<UserInfo>();
		for(UserInfo user:userList){
			user.setPassword(Des.desStr(user.getPassword()));
			list.add(user);
		}*/
		
		
		request.setAttribute("page", page);
		request.setAttribute("userList", userList);
		request.setAttribute("list", "sel");
		
		request.getRequestDispatcher("pages/user/user_list.jsp").forward(request, response);
	}

	//��ȡ������Ϣ
	private void updUser(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String strID=request.getParameter("id");
		int id=Integer.parseInt(strID);
		UserInfo user=dao.getUserById(id);
		request.setAttribute("user", user);
		request.getRequestDispatcher("pages/user/upd_user.jsp").forward(request, response);
	}

	//ɾ���û�
	private void delUser(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String strID=request.getParameter("id");
		int id=Integer.parseInt(strID);
		int result=dao.deleteUser(id);
		if(result>0){
			System.out.println("�û�ɾ���ɹ�");
			this.selUser(request, response);
		}else{
			System.out.println("�û�ɾ��ʧ��");
			this.selUser(request, response);
		}
	}

	//����û�
	private void addUser(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SmartUpload smart = new SmartUpload();
		JspFactory _jspxFactory =JspFactory.getDefaultFactory();
		PageContext  pageContext = _jspxFactory.getPageContext(this, request, response,null, true, 8192, true);
		smart.initialize(pageContext);
		
		try {
			smart.upload();
			SmartRequest req = smart.getRequest();
			
			String note = req.getParameter("note");
			String userName = req.getParameter("userName");
			String password = req.getParameter("password");
			UserInfo user= new UserInfo();
			user.setNote(note);
			user.setUserName(userName);
			String miStr=Des.encStr(password);
			user.setPassword(miStr);

			
			SmartFile file= smart.getFiles().getFile(0);
			int fileSize = file.getSize();  
			byte[] photo = new byte [fileSize];
			for (int i = 0; i < fileSize; i++) {
				photo[i] = file.getBinaryData(i);   
			}
			user.setPhoto(photo);
			
			UserDao dao = new UserDao();
			int result=dao.addUser(user);
			if(result>0){
				System.out.println("�û���ӳɹ�");
				this.selUser(request, response);
			}else{
				System.out.println("�û����ʧ��");
				this.selUser(request, response);
			}
		}catch(SmartUploadException e){
			e.printStackTrace();
		}
	}

}
