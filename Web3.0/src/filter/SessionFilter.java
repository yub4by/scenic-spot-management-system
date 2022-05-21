package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.UserInfo;

public class SessionFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest request=(HttpServletRequest)req;
		HttpServletResponse response=(HttpServletResponse)resp;
		
		String requestURI = request.getRequestURI();  
		String contextPath =request.getContextPath();  // localhost:8080/Web3.0
		if((!requestURI.equals(contextPath+"/")) && (!requestURI.contains("login.jsp"))){
			HttpSession session=request.getSession();
			UserInfo user=(UserInfo)session.getAttribute("user");
			if(user==null){
				request.setAttribute("msg", "暂不允许访问，请先登录");
	    		request.getRequestDispatcher("/login.jsp").forward(request, response);
			}else if(!( (user.getId()==1) || (user.getId()==2) )){
				request.setAttribute("msg", "游客不允许访问后台！");
	    		request.getRequestDispatcher("/login.jsp").forward(request, response); 
			}else{
				chain.doFilter(req, resp);
			}
			/*if(user!=null){
				if( (user.getId()!=1) || (user.getId()!=2)){
					request.setAttribute("msg", "游客不允许访问后台！");
		    		request.getRequestDispatcher("/login.jsp").forward(request, response);
				}else{
					chain.doFilter(req, resp);
				}
			}else{
				request.setAttribute("msg", "暂不允许访问，请先登录");
	    		request.getRequestDispatcher("/login.jsp").forward(request, response);
			}*/
		}else{
			chain.doFilter(req, resp);
		}
		
		
		

		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
