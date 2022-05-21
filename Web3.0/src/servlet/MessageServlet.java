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

	//ǰ̨�ο�����
	private void leave(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userName=request.getParameter("userName");
		String message=request.getParameter("message");
		int result=dao.leave(userName,message);
		if(result>0){
			request.setAttribute("msg", "���Գɹ�");
		}else{
			request.setAttribute("msg", "����ʧ��");
		}
		HttpSession session=request.getSession();
		session.removeAttribute("user");
		session.invalidate();
    	request.getRequestDispatcher("MainServlet").forward(request, response);
	}

	//�ָ����������Ϊ��ʼδ���״̬
	private void hupasMsg(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String strID=request.getParameter("id");
		int id=Integer.parseInt(strID);
		int result=dao.recoverPasMsg(id);
		if(result>0){
			System.out.println("���Իָ��ɹ�");
			this.passMsg(request,response);
		}else{
			System.out.println("���Իָ�ʧ��");
			this.passMsg(request,response);
		}
	}

	//�ָ���ɾ������Ϊ��ʼδ���״̬
	private void hudelMsg(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String strID=request.getParameter("id");
		int id=Integer.parseInt(strID);
		int result=dao.recoverDelMsg(id);
		if(result>0){
			System.out.println("���Իָ��ɹ�");
			this.dellMsg(request,response);
		}else{
			System.out.println("���Իָ�ʧ��");
			this.dellMsg(request,response);
		}
	}

	//�鿴�����б�
	private void seeeMsg(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<MessageInfo> msgList=dao.getMsgList();
		request.setAttribute("msgList", msgList);
		request.getRequestDispatcher("pages/message/message_see.jsp").forward(request, response);
	}

	//�ظ������б�
	private void reppMsg(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<MessageInfo> msgList=dao.getMsgList();
		request.setAttribute("msgList", msgList);
		request.getRequestDispatcher("pages/message/message_rep.jsp").forward(request, response);
	}

	//��������б�
	private void passMsg(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<MessageInfo> msgList=dao.getMsgList();
		request.setAttribute("msgList", msgList);
		request.getRequestDispatcher("pages/message/message_pass.jsp").forward(request, response);
	}

	//ɾ�������б�
	private void dellMsg(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<MessageInfo> msgList=dao.getMsgList();
		request.setAttribute("msgList", msgList);
		request.getRequestDispatcher("pages/message/message_del.jsp").forward(request, response);
	}

	//ʵʩ�ظ�
	private void doRepMsg(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO �Զ����ɵķ������
		String strID=request.getParameter("id");
		int id=Integer.parseInt(strID);
		String replayMsg=request.getParameter("content");
		int result=dao.replayMsg(replayMsg,id);
		if(result>0){
			System.out.println("���Իظ��ɹ�");
			this.reppMsg(request,response);
		}else{
			System.out.println("���Իظ�ʧ��");
			this.reppMsg(request,response);
		}
	}

	//�鿴������ϸ����
	private void seeMsg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String strID=request.getParameter("id");
		int id=Integer.parseInt(strID);
		MessageInfo msgInfo=dao.getMsgById(id);
		request.setAttribute("msg", msgInfo);
		request.getRequestDispatcher("pages/message/message_info.jsp").forward(request, response);
	}

	//ɾ������
	private void delMsg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String strID=request.getParameter("id");
		int id=Integer.parseInt(strID);
		int result=dao.deleteMsg(id);
		if(result>0){
			System.out.println("����ɾ���ɹ�");
			this.dellMsg(request,response);
		}else{
			System.out.println("����ɾ��ʧ��");
			this.dellMsg(request,response);
		}
	}

	//�������
	private void pasMsg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String strID=request.getParameter("id");
		int id=Integer.parseInt(strID);
		int result=dao.passMsg(id);
		if(result>0){
			System.out.println("������˳ɹ�");
			this.passMsg(request,response);
		}else{
			System.out.println("�������ʧ��");
			this.passMsg(request,response);
		}
	}

	//���Իظ�ҳ
	private void repMsg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String strID=request.getParameter("id");
		int id=Integer.parseInt(strID);
		MessageInfo msgInfo=dao.getMsgById(id);
		request.setAttribute("msg", msgInfo);
		request.getRequestDispatcher("pages/message/message_replay.jsp").forward(request, response);
	}

	//�����б�
	private void selMsg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<MessageInfo> msgList=dao.getMsgList();
		request.setAttribute("msgList", msgList);
		request.getRequestDispatcher("pages/message/message_list.jsp").forward(request, response);
	}

}
