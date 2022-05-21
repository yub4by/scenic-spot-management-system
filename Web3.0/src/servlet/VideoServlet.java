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

import util.PageUtil;

import beans.PageInfo;
import beans.VideoInfo;

import com.jspsmart.upload.SmartFile;
import com.jspsmart.upload.SmartRequest;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import dao.VideoDao;

public class VideoServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String flag = request.getParameter("flag");
		
		if("add".equals(flag)){
			this.Add(request,response);
		}else if("sel".equals(flag)){
			this.Select(request,response);
		}else if("del".equals(flag)){
			this.Delete(request,response);
		}else if("update".equals(flag)){
			this.Update(request,response);
		}else if("doUpdate".equals(flag)){
			this.doUpdate(request,response);
		}else if ("numdel".equals(flag)) {
			this.delSomeVedio(request, response);
		}
	}

	//批量删除
	private void delSomeVedio(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String vedio[] = request.getParameterValues("check");
		if (vedio != null) {
			int result = 0;
			VideoDao dao = new VideoDao();
			for (int i = 0; i < vedio.length; i++) {
				int id = Integer.parseInt(vedio[i]);
				result = dao.deleteVideo(id);
			}
			if (result > 0) {
				out.println("<script>alert('删除成功');window.location.href='VideoServlet?flag=sel'</script>");
				out.close();
			} else {
				out.println("<script>alert('删除失败，请重试');window.location.href='VideoServlet?flag=sel'</script>");
				out.close();
			}
		}else{
			out.println("<script>alert('请至少选择一个！');window.location.href='VideoServlet?flag=sel'</script>");	
		}

	}

	//实施更新
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
			String strid = req.getParameter("id");
			int id = Integer.parseInt(strid);
			String video_full_name = req.getParameter("video_full_name");
			String video_introduction = req.getParameter("video_introduction");
			String author_email = req.getParameter("author_email");
			String link = req.getParameter("link");
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String time = sdf.format(date); 
			VideoInfo vd= new VideoInfo();
			vd.setId(id);
			vd.setVideo_full_name(video_full_name);
			vd.setVideo_introduction(video_introduction);
			vd.setAuthor_email(author_email);
			vd.setTime(time);
			vd.setLink(link);
			SmartFile file= smart.getFiles().getFile(0);
			int fileSize = file.getSize(); 
			byte[] photo = new byte [fileSize];
			for (int i = 0; i < fileSize; i++) {
				photo[i] = file.getBinaryData(i); 
			}
			vd.setPhoto(photo);
			VideoDao dao = new VideoDao();
			int result = dao.updateVideo(vd);
			if(result>0){
				System.out.println("视频修改成功");
				this.Select(request, response);
	    	}else{
	    		System.out.println("视频修改失败");
	    		this.Select(request, response);
	    	}						
		} catch (SmartUploadException e) {
			e.printStackTrace();
		}
	}

	//获取更新信息
	private void Update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String strid = request.getParameter("id");
		int id = Integer.parseInt(strid);
		
		VideoDao dao = new VideoDao();
		VideoInfo vd = dao.getVideoById(id);
		
		request.setAttribute("vd", vd);
		request.getRequestDispatcher("pages/video/upd_video.jsp").forward(request, response);
	}

	//删除视频（真删！）
	private void Delete(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		String strid = request.getParameter("id");
		int id = Integer.parseInt(strid);
		VideoDao dao = new VideoDao();
		int result = dao.deleteVideo(id);
		if(result > 0){
			System.out.println("视频删除成功");
			this.Select(request, response);
		}else{
			System.out.println("视频删除成功");
			this.Select(request, response);
		}
	}

	//分页视频列表
	private void Select(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		VideoDao dao = new VideoDao();
		int pageSize = 5;
		int rowCount = dao.getVideoCount(); // 一共多少条数据
		int pageIndex = 1;
		
		String pageindexstr = request.getParameter("pageIndex");
		if(pageindexstr != null){
			pageIndex = Integer.parseInt(pageindexstr);
		}
		
		PageInfo page = PageUtil.getPage(pageSize, rowCount, pageIndex);
		
		List<VideoInfo> videolist = dao.selectAllVideo(page);
		
		request.setAttribute("page", page);
		request.setAttribute("videolist", videolist);
		
		request.getRequestDispatcher("pages/video/video_list.jsp").forward(request, response);
	}

	//新增视频
	private void Add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SmartUpload smart = new SmartUpload();
		JspFactory _jspxFactory =JspFactory.getDefaultFactory();
		PageContext  pageContext = _jspxFactory.getPageContext(this, request, response,null, true, 8192, true);
		smart.initialize(pageContext);
		try {
			smart.upload();
			SmartRequest req = smart.getRequest();
			String video_full_name = req.getParameter("video_full_name");
			String video_introduction = req.getParameter("video_introduction");
			String author_email = req.getParameter("author_email");
			String link = req.getParameter("link");
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String time = sdf.format(date); 
			VideoInfo vd= new VideoInfo();
			vd.setVideo_full_name(video_full_name);
			vd.setVideo_introduction(video_introduction);
			vd.setAuthor_email(author_email);
			vd.setTime(time);
			vd.setLink(link);
			SmartFile file= smart.getFiles().getFile(0);
			int fileSize = file.getSize(); 
			byte[] photo = new byte [fileSize];
			for (int i = 0; i < fileSize; i++) {
				photo[i] = file.getBinaryData(i); 
			}
			vd.setPhoto(photo);
			VideoDao dao = new VideoDao();
			int result=dao.addVideo(vd);
			if(result > 0){
				System.out.println("上传成功");
				this.Select(request, response);
			}else{
				System.out.println("上传成功");
				this.Select(request, response);
			}
		} catch (SmartUploadException e) {
			e.printStackTrace();
		}
	}

}
