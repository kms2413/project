package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Example03 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
//		System.out.println("doGet");
		
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter(); //soc, out, buffered
		
		out.print("<html");
		out.print("<head><title></title></head>");
		out.print("<body>");
		out.print("<b style = 'font-size:15px; font-family:monaco;'>Nice Catch</b>");
		out.print("<script type = 'text/javascript'/>");
		out.print("window.alert('hahaha')");
		out.print("</body>");
		out.print("</html>");
		out.close();
	}
}
