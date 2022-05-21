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
	
	//批量删除
	private void allDelUser(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//out这种方式太慢了
		PrintWriter out = response.getWriter();
		
		String news[] = request.getParameterValues("check");
		if (news != null) {
			int result = 0;
			for (int i = 0; i < news.length; i++) {
				int id = Integer.parseInt(news[i]);
				result = dao.allDelUser(id);
			}
			if (result > 0) {
				//out.println("<script>alert('删除成功');window.location.href='UserServlet?flag=sel'</script>");
				System.out.println("用户删除成功");
			} else {
				//out.println("<script>alert('删除失败');window.location.href='UserServlet?flag=sel'</script>");
				System.out.println("用户删除失败");
			}
		}else{
			//out.println("<script>alert('请至少选择一条数据！');window.location.href='UserServlet?flag=sel'</script>");	
			System.out.println("未选择数据");
		}
		//out.close();
		this.selUser(request, response);
	}

	//恢复已删用户
	private void rcvUser(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String strID=request.getParameter("id");
		int id=Integer.parseInt(strID);
		int result=dao.recoverUser(id);
		if(result>0){
			System.out.println("用户恢复成功");
			this.selUser(request, response);
		}else{
			System.out.println("用户恢复失败");
			this.selUser(request, response);
		}
	}

	//已删用户列表
	private void deldUser(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<UserInfo> list=dao.getDelUserList();
		request.setAttribute("list", list);
		request.getRequestDispatcher("pages/user/user_del.jsp").forward(request, response);
	}

	//表单验证检查用户名
	private void checkName(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		String userName=request.getParameter("userName");
		if("".equals(userName)||userName==null){
			response.getWriter().print("请填写用户名");
		}else{
			UserInfo user=dao.getUserByName(userName);
			if(user!=null){
				response.getWriter().print("用户名已存在");
			}else{
				response.getWriter().print("ok");
			}
		}
	}

	//登陆用户注销
	private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
	  HttpSession session=request.getSession();
	  /*session.removeAttribute("user");*/
	  session.invalidate();
	  request.setAttribute("msg", "已注销，请重新登录");
	  request.getRequestDispatcher("/login.jsp").forward(request, response);
	}

	//模糊查询
	private void queryListUser(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO 自动生成的方法存根
		
		String name=request.getParameter("name");
		String note=request.getParameter("note");
		
		/*name=new String(name.getBytes("iso8859-1"),"utf-8");
		note=new String(note.getBytes("iso8859-1"),"utf-8");*/
		//System.out.println(name+note);
		
		int pageSize=5;
		int rowCount=dao.getCountByUser(name,note);//可能为0可能为全部
		
		int pageIndex=1;//数据初始化当前页    若查不到数据(共有0条数据  1/1页  首页尾页上下页都不可用 此时转到只有1且不可变动)
		
		String pageIndexStr=request.getParameter("pageIndex");//获取当前页  不管有没有数据初始化   当前页都为1
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

	//注册用户
	private void regUser(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO 自动生成的方法存根
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
				request.setAttribute("msg", "注册成功请登录");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}else{
				request.setAttribute("msg", "注册失败请重试");
				request.getRequestDispatcher("enroll.jsp").forward(request, response);
			}
	}

	//实施更新
	private void doUpdate(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO 自动生成的方法存根
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
				System.out.println("用户修改成功");
				this.selUser(request, response);
			}else{
				System.out.println("用户修改失败");
				this.selUser(request, response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	//分页用户列表
	private void selUser(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int pageSize=5;
		int rowCount=dao.getUserCount();//获取数据库中一共有多少条数据
		int pageIndex=1;
	
		String pageIndexStr=request.getParameter("pageIndex");//获取当前页是第几页
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

	//获取更新信息
	private void updUser(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String strID=request.getParameter("id");
		int id=Integer.parseInt(strID);
		UserInfo user=dao.getUserById(id);
		request.setAttribute("user", user);
		request.getRequestDispatcher("pages/user/upd_user.jsp").forward(request, response);
	}

	//删除用户
	private void delUser(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String strID=request.getParameter("id");
		int id=Integer.parseInt(strID);
		int result=dao.deleteUser(id);
		if(result>0){
			System.out.println("用户删除成功");
			this.selUser(request, response);
		}else{
			System.out.println("用户删除失败");
			this.selUser(request, response);
		}
	}

	//添加用户
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
				System.out.println("用户添加成功");
				this.selUser(request, response);
			}else{
				System.out.println("用户添加失败");
				this.selUser(request, response);
			}
		}catch(SmartUploadException e){
			e.printStackTrace();
		}
	}

}
