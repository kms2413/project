package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Example05 extends HttpServlet {

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

		req.setCharacterEncoding("euc-kr");
		String name= req.getParameter("name");
		String phone = req.getParameter("phone");
		String addr	= req.getParameter("addr");
//		System.out.println(name+phone+addr);
		
		PrintWriter out = resp.getWriter();
		out.print("<html>");
		out.print("<head><title></title></head");
		out.print("<body>");
		out.print("<b style = 'font-size:13px; font-family:monaco'>");
		out.print("name : " + name+"<br/>");
		out.print("phone : " + phone+"<br/>");
		out.print("address : " + addr+"<br/>");
		out.print("</b>");
		out.print("</script>");
		out.print("</body>");
		out.print("</html>");
		out.close();
	}
	
}
