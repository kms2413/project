package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Example07_Success extends HttpServlet {
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
		
		resp.setContentType("text/html;charset=euc-kr");
		PrintWriter out = resp.getWriter();
		
		out.print("<html>");
		out.print("<head><title></title></head>");
		out.print("<body>");
		out.print("<b>Log in succeed</b>");
		out.print("</body>");
		out.print("</html>");
		out.close();
	}

}
