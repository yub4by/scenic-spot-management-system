package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.PageUtil;

import beans.AreaInfo;
import beans.PageInfo;
import beans.SpotInfo;
import dao.AreaDao;
import dao.SpotDao;

public class AreaServlet extends HttpServlet {
	
	private AreaDao dao=new AreaDao();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String flag=request.getParameter("flag");
		if("add".equals(flag)){
			this.addArea(request,response);
		}if("del".equals(flag)){
			this.delArea(request,response);
		}if("upd".equals(flag)){
			this.updArea(request,response);
		}if("doupd".equals(flag)){
			this.doupdArea(request,response);
		}if("son".equals(flag)){
			this.sonSpot(request,response);
		}if("sel".equals(flag)){
			this.selArea(request,response);
		}if("mh".equals(flag)){
			this.queryListArea(request,response);
		}if("alldel".equals(flag)){
			this.allDelArea(request,response);
		}
		
	}

	//批量删除
	private void allDelArea(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String news[] = request.getParameterValues("check");
		if (news != null) {
			int result = 0;
			for (int i = 0; i < news.length; i++) {
				int id = Integer.parseInt(news[i]);
				result = dao.deleteArea(id);
			}
			if (result > 0) {
				System.out.println("景区删除成功");
			} else {
				System.out.println("景区删除失败");
			}
		}else{
			System.out.println("未选择数据");
		}
		this.selArea(request, response);
	}

	//下设景点
	private void sonSpot(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<AreaInfo> area=dao.getFatherName();
		request.setAttribute("area", area);
		
		SpotDao sd=new SpotDao();
		List<SpotInfo> spot=sd.getSonName();
		request.setAttribute("spot", spot);
		
		request.getRequestDispatcher("pages/area/area_son.jsp").forward(request, response);
	}

	//模糊查询
	private void queryListArea(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO 自动生成的方法存根
		String name=request.getParameter("name");
		String strId=request.getParameter("id");
		int id=0;
		if(!("".equals(strId)||strId==null)){
			id=Integer.parseInt(strId);
		}
		
		int pageSize=5;
		int rowCount=dao.getCountByArea(name,id);
		int pageIndex=1;
	
		String pageIndexStr=request.getParameter("pageIndex");
		if(pageIndexStr!=null){
			pageIndex=Integer.parseInt(pageIndexStr);
		}
		
		PageInfo newPage=PageUtil.getPage(pageSize,rowCount,pageIndex);
		
		AreaInfo area=new AreaInfo();
		area.setAreaName(name);
		area.setId(id);
		
		List<AreaInfo> areaList=dao.queryAreaList(newPage,area);
		
		request.setAttribute("page", newPage);
		request.setAttribute("areaList", areaList);
		request.setAttribute("list", "sel");
		
		request.getRequestDispatcher("pages/area/area_list.jsp").forward(request, response);
	}

	//分页查询
	private void selArea(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO 自动生成的方法存根
		int pageSize=5;
		int rowCount=dao.getAreaCount();//获取数据库中一共有多少条数据
		int pageIndex=1;
	
		String pageIndexStr=request.getParameter("pageIndex");//获取当前页是第几页
		if(pageIndexStr!=null){
			pageIndex=Integer.parseInt(pageIndexStr);
		}
		
		PageInfo page=PageUtil.getPage(pageSize,rowCount,pageIndex);
		
		List<AreaInfo> areaList=dao.getAreaList(page);
		
		request.setAttribute("page", page);
		request.setAttribute("areaList", areaList);
		request.setAttribute("list", "sel");
		
		request.getRequestDispatcher("pages/area/area_list.jsp").forward(request, response);
	}

	//实施修改
	private void doupdArea(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO 自动生成的方法存根
		String strId=request.getParameter("id");
		int id=Integer.parseInt(strId);
		String areaName=request.getParameter("areaName");
		String note=request.getParameter("note");
		String strState=request.getParameter("state");
		int state=Integer.parseInt(strState);
		
		AreaInfo area=new AreaInfo();
		area.setId(id);
		area.setAreaName(areaName);
		area.setNote(note);
		area.setState(state);
		
		int result=dao.updArea(area);
		if(result>0){
			System.out.println("景区修改成功");
			this.selArea(request, response);
		}else{
			System.out.println("景区修改失败");
			this.selArea(request, response);
		}
	}

	//获取修改信息
	private void updArea(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO 自动生成的方法存根
		String strID=request.getParameter("id");
		int id=Integer.parseInt(strID);
		AreaInfo area=dao.getAreaById(id);
		request.setAttribute("area", area);
		request.getRequestDispatcher("pages/area/upd_area.jsp").forward(request, response);
	}

	//删除景区
	private void delArea(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO 自动生成的方法存根
		String strID=request.getParameter("id");
		int id=Integer.parseInt(strID);
		int result=dao.deleteArea(id);
		if(result>0){
			System.out.println("景区删除成功");
			this.selArea(request, response);
		}else{
			System.out.println("景区删除失败");
			this.selArea(request, response);
		}
	}

	//添加景区
	private void addArea(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO 自动生成的方法存根
		String areaName=request.getParameter("areaName");
		String note=request.getParameter("note");
		
		AreaInfo area=new AreaInfo();
		area.setAreaName(areaName);
		area.setNote(note);
		
		int result=dao.addArea(area);
		if(result>0){
			System.out.println("景区添加成功");
			this.selArea(request, response);
		}else{
			System.out.println("景区添加失败");
			this.selArea(request, response);
		}
	}
		
}
