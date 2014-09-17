package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Example07 extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		proRequest(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		proRequest(req, resp);
	}
	
	protected void proRequest(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
//		System.out.println("oka");
		
		req.setCharacterEncoding("euc-kr");
		String userId = req.getParameter("userId");
		String userPass = req.getParameter("userPass");
		
		String id = "abc123";
		String pass = "abc123";
		
		String contextPath = req.getContextPath();
		
		if(userId.equals(id)&& userPass.equals((pass))){
			resp.sendRedirect(contextPath+ "/servlet/Example07_Success");
//			resp.sendRedirect(s);
		}else{
			resp.sendRedirect(contextPath + "/servlet/Example07_Fail");
			
		}
		
	}

}
