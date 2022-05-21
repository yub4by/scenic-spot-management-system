package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.MessageInfo;
import beans.UserInfo;
import dao.MessageDao;

public class MessageServlet extends HttpServlet {

	MessageDao dao=new MessageDao();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String flag=request.getParameter("flag");
		
		if("sel".equals(flag)){
			this.selMsg(request,response);
		}if("rep".equals(flag)){
			this.repMsg(request,response);
		}if("dorep".equals(flag)){
			this.doRepMsg(request,response);
		}if("pas".equals(flag)){
			this.pasMsg(request,response);
		}if("del".equals(flag)){
			this.delMsg(request,response);
		}if("see".equals(flag)){
			this.seeMsg(request,response);
		}if("dell".equals(flag)){
			this.dellMsg(request,response);
		}if("pass".equals(flag)){
			this.passMsg(request,response);
		}if("repp".equals(flag)){
			this.reppMsg(request,response);
		}if("seee".equals(flag)){
			this.seeeMsg(request,response);
		}if("hudel".equals(flag)){
			this.hudelMsg(request,response);
		}if("hupas".equals(flag)){
			this.hupasMsg(request,response);
		}if("leave".equals(flag)){
			this.leave(request,response);
		}
	}

	//«∞Ã®”ŒøÕ¡Ù—‘
	private void leave(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userName=request.getParameter("userName");
		String message=request.getParameter("message");
		int result=dao.leave(userName,message);
		if(result>0){
			request.setAttribute("msg", "¡Ù—‘≥…π¶");
		}else{
			request.setAttribute("msg", "¡Ù—‘ ß∞‹");
		}
		HttpSession session=request.getSession();
		session.removeAttribute("user");
		session.invalidate();
    	request.getRequestDispatcher("MainServlet").forward(request, response);
	}

	//ª÷∏¥“—…Û∫À¡Ù—‘Œ™≥ı ºŒ¥…Û∫À◊¥Ã¨
	private void hupasMsg(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String strID=request.getParameter("id");
		int id=Integer.parseInt(strID);
		int result=dao.recoverPasMsg(id);
		if(result>0){
			System.out.println("¡Ù—‘ª÷∏¥≥…π¶");
			this.passMsg(request,response);
		}else{
			System.out.println("¡Ù—‘ª÷∏¥ ß∞‹");
			this.passMsg(request,response);
		}
	}

	//ª÷∏¥“—…æ≥˝¡Ù—‘Œ™≥ı ºŒ¥…Û∫À◊¥Ã¨
	private void hudelMsg(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String strID=request.getParameter("id");
		int id=Integer.parseInt(strID);
		int result=dao.recoverDelMsg(id);
		if(result>0){
			System.out.println("¡Ù—‘ª÷∏¥≥…π¶");
			this.dellMsg(request,response);
		}else{
			System.out.println("¡Ù—‘ª÷∏¥ ß∞‹");
			this.dellMsg(request,response);
		}
	}

	//≤Èø¥¡Ù—‘¡–±Ì
	private void seeeMsg(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<MessageInfo> msgList=dao.getMsgList();
		request.setAttribute("msgList", msgList);
		request.getRequestDispatcher("pages/message/message_see.jsp").forward(request, response);
	}

	//ªÿ∏¥¡Ù—‘¡–±Ì
	private void reppMsg(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<MessageInfo> msgList=dao.getMsgList();
		request.setAttribute("msgList", msgList);
		request.getRequestDispatcher("pages/message/message_rep.jsp").forward(request, response);
	}

	//…Û∫À¡Ù—‘¡–±Ì
	private void passMsg(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<MessageInfo> msgList=dao.getMsgList();
		request.setAttribute("msgList", msgList);
		request.getRequestDispatcher("pages/message/message_pass.jsp").forward(request, response);
	}

	//…æ≥˝¡Ù—‘¡–±Ì
	private void dellMsg(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<MessageInfo> msgList=dao.getMsgList();
		request.setAttribute("msgList", msgList);
		request.getRequestDispatcher("pages/message/message_del.jsp").forward(request, response);
	}

	// µ ©ªÿ∏¥
	private void doRepMsg(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO ◊‘∂Ø…˙≥…µƒ∑Ω∑®¥Ê∏˘
		String strID=request.getParameter("id");
		int id=Integer.parseInt(strID);
		String replayMsg=request.getParameter("content");
		int result=dao.replayMsg(replayMsg,id);
		if(result>0){
			System.out.println("¡Ù—‘ªÿ∏¥≥…π¶");
			this.reppMsg(request,response);
		}else{
			System.out.println("¡Ù—‘ªÿ∏¥ ß∞‹");
			this.reppMsg(request,response);
		}
	}

	//≤Èø¥¡Ù—‘œÍœ∏ƒ⁄»›
	private void seeMsg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String strID=request.getParameter("id");
		int id=Integer.parseInt(strID);
		MessageInfo msgInfo=dao.getMsgById(id);
		request.setAttribute("msg", msgInfo);
		request.getRequestDispatcher("pages/message/message_info.jsp").forward(request, response);
	}

	//…æ≥˝¡Ù—‘
	private void delMsg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String strID=request.getParameter("id");
		int id=Integer.parseInt(strID);
		int result=dao.deleteMsg(id);
		if(result>0){
			System.out.println("¡Ù—‘…æ≥˝≥…π¶");
			this.dellMsg(request,response);
		}else{
			System.out.println("¡Ù—‘…æ≥˝ ß∞‹");
			this.dellMsg(request,response);
		}
	}

	//…Û∫À¡Ù—‘
	private void pasMsg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String strID=request.getParameter("id");
		int id=Integer.parseInt(strID);
		int result=dao.passMsg(id);
		if(result>0){
			System.out.println("¡Ù—‘…Û∫À≥…π¶");
			this.passMsg(request,response);
		}else{
			System.out.println("¡Ù—‘…Û∫À ß∞‹");
			this.passMsg(request,response);
		}
	}

	//¡Ù—‘ªÿ∏¥“≥
	private void repMsg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String strID=request.getParameter("id");
		int id=Integer.parseInt(strID);
		MessageInfo msgInfo=dao.getMsgById(id);
		request.setAttribute("msg", msgInfo);
		request.getRequestDispatcher("pages/message/message_replay.jsp").forward(request, response);
	}

	//¡Ù—‘¡–±Ì
	private void selMsg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<MessageInfo> msgList=dao.getMsgList();
		request.setAttribute("msgList", msgList);
		request.getRequestDispatcher("pages/message/message_list.jsp").forward(request, response);
	}

}
