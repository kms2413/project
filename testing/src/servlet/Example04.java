package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Example04 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("post");
		proRequest(req, resp);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("get");
		proRequest(req, resp);
	}
	
	protected void proRequest(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");
		String msg = req.getParameter("msg");
		System.out.println("msg: "+msg);
		
		PrintWriter out = resp.getWriter();
		out.print("<html>");
		out.print("<head><title></title></head");
		out.print("<body>");
		out.print("<b style = 'font-size:13px; font-family:monaco'>");
		out.print("Received Message : " + msg);
		out.print("</b>");
		out.print("</script>");
		out.print("</body>");
		out.print("</html>");
		out.close();

	}
}
