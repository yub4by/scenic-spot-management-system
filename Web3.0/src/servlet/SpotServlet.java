package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;

import util.PageUtil;

import beans.PageInfo;
import beans.SpotInfo;
import beans.UserInfo;

import com.jspsmart.upload.SmartFile;
import com.jspsmart.upload.SmartRequest;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import dao.SpotDao;
import dao.UserDao;

public class SpotServlet extends HttpServlet {
	
	private SpotDao dao=new SpotDao();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String flag=request.getParameter("flag");
		
		if("deld".equals(flag)){
			this.deldSpot(request,response);
		}if("rcv".equals(flag)){
			this.rcvSpot(request,response);
		}if("add".equals(flag)){
			this.addSpot(request,response);
		}if("del".equals(flag)){
			this.delSpot(request,response);
		}if("upd".equals(flag)){
			this.updSpot(request,response);
		}if("doUpdate".equals(flag)){
			this.doUpdate(request,response);
		}if("sel".equals(flag)){
			this.selSpot(request,response);
		}if("mh".equals(flag)){
			this.queryListSpot(request,response);
		}if("alldel".equals(flag)){
			this.allDelSpot(request,response);
		}
	}

	//批量删除
	private void allDelSpot(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String news[] = request.getParameterValues("check");
		if (news != null) {
			int result = 0;
			for (int i = 0; i < news.length; i++) {
				int id = Integer.parseInt(news[i]);
				result = dao.deleteSpot(id);
			}
			if (result > 0) {
				System.out.println("景点删除成功");
			} else {
				System.out.println("景点删除失败");
			}
		}else{
			System.out.println("未选择数据");
		}
		this.selSpot(request, response);
	}

	//恢复已删景点
	private void rcvSpot(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String strID=request.getParameter("id");
		int id=Integer.parseInt(strID);
		int result=dao.recoverSpot(id);
		if(result>0){
			System.out.println("景点恢复成功");
			this.selSpot(request, response);
		}else{
			System.out.println("景点恢复失败");
			this.selSpot(request, response);
		}
	}

	//已删除景点页
	private void deldSpot(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<SpotInfo> list=dao.getDelSpotList();
		request.setAttribute("list", list);
		request.getRequestDispatcher("pages/spot/spot_del.jsp").forward(request, response);
	}

	//实施修改
	private void doUpdate(HttpServletRequest request,
			HttpServletResponse response) throws ServletException {
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
			String spotName = req.getParameter("spotName");
			String address = req.getParameter("address");
			String note = req.getParameter("note");
			SpotInfo spot=new SpotInfo();
			spot.setId(id);
			spot.setNote(note);
			spot.setAddress(address);
			spot.setSpotName(spotName);
			
			SmartFile file= smart.getFiles().getFile(0);
			int fileSize = file.getSize();  
			byte[] photo = new byte [fileSize];
			for (int i = 0; i < fileSize; i++) {
				photo[i] = file.getBinaryData(i);   
			}
			spot.setPhoto(photo);
			
			int result=dao.updateSpot(spot);
			if(result>0){
				System.out.println("景点修改成功");
				this.selSpot(request, response);
			}else{
				System.out.println("景点修改失败");
				this.selSpot(request, response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	//模糊查询
	private void queryListSpot(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name=request.getParameter("name");
		String address=request.getParameter("address");
		
		int pageSize=5;
		int rowCount=dao.getCountBySpot(name,address);
		int pageIndex=1;
	
		String pageIndexStr=request.getParameter("pageIndex");
		if(pageIndexStr!=null){
			pageIndex=Integer.parseInt(pageIndexStr);
		}
		
		PageInfo newPage=PageUtil.getPage(pageSize,rowCount,pageIndex);
		
		SpotInfo spot=new SpotInfo();
		spot.setAddress(address);
		spot.setSpotName(name);
		
		List<SpotInfo> newSpotList=dao.queryListSpot(newPage,spot);
		
		request.setAttribute("page", newPage);
		request.setAttribute("spotList", newSpotList);
		request.setAttribute("list", "sel");
		
		request.getRequestDispatcher("pages/spot/spot_list.jsp").forward(request, response);
	}

	//修改景点
	private void updSpot(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String strID=request.getParameter("id");
		int id=Integer.parseInt(strID);
		SpotInfo spot=dao.getSpotById(id);
		request.setAttribute("spot", spot);
		request.getRequestDispatcher("pages/spot/upd_spot.jsp").forward(request, response);
	}

	//删除景点
	private void delSpot(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String strID=request.getParameter("id");
		int id=Integer.parseInt(strID);
		int result=dao.deleteSpot(id);
		if(result>0){
			System.out.println("景点删除成功");
			this.selSpot(request, response);
		}else{
			System.out.println("景点删除失败");
			this.selSpot(request, response);
		}
	}

	//增加景点
	private void addSpot(HttpServletRequest request,
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
			String spotName = req.getParameter("spotName");
			String address = req.getParameter("address");
			SpotInfo spot= new SpotInfo();
			spot.setNote(note);
			spot.setSpotName(spotName);
			spot.setAddress(address);
			
			
			SmartFile file= smart.getFiles().getFile(0);
			int fileSize = file.getSize();  
			byte[] photo = new byte [fileSize];
			for (int i = 0; i < fileSize; i++) {
				photo[i] = file.getBinaryData(i);   
			}
			spot.setPhoto(photo);
			
			SpotDao dao = new SpotDao();
			int result=dao.addSpot(spot);
			if(result>0){
				System.out.println("景点添加成功");
				this.selSpot(request, response);
			}else{
				System.out.println("景点添加失败");
				this.selSpot(request, response);
			}
		}catch(SmartUploadException e){
			e.printStackTrace();
		}
	}
	
	//分页景点列表
	private void selSpot(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int pageSize=5;
		int rowCount=dao.getSpotCount();//获取数据库中一共有多少条数据
		int pageIndex=1;
	
		String pageIndexStr=request.getParameter("pageIndex");//获取当前页是第几页
		if(pageIndexStr!=null){
			pageIndex=Integer.parseInt(pageIndexStr);
		}
		
		PageInfo page=PageUtil.getPage(pageSize,rowCount,pageIndex);
		
		List<SpotInfo> spotList=dao.getSpotList(page);
		
		request.setAttribute("page", page);
		request.setAttribute("spotList", spotList);
		request.setAttribute("list", "sel");
		
		request.getRequestDispatcher("pages/spot/spot_list.jsp").forward(request, response);
	}

}
