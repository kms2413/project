package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Example08_Sub extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		proRequest(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		proRequest(req, resp);
	}

	protected void proRequest(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");
		String userId = req.getParameter("userId");
		String userPass = req.getParameter("userPass");
		
		resp.setContentType("text/html;charset=euc-kr");
		PrintWriter out = resp.getWriter();
		
		out.print("<html>");
		out.print("<head><title></title></head>");
		out.print("<body>");
		out.print("<b>");
		out.print(userId + "<br/>"+userPass);
		out.print("<b>");
		out.print("</body>");
		out.print("<html>");
	}	
	

	
}
