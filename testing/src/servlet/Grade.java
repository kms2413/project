package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Grade extends HttpServlet {

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
		String name = req.getParameter("name");
		int kor = Integer.parseInt(req.getParameter("kor"));
		int eng = Integer.parseInt(req.getParameter("eng"));
		int math = Integer.parseInt(req.getParameter("math"));
		int total = math+eng+kor;
		double avg = total/3.0;
		
		PrintWriter out = resp.getWriter();
		out.print("<html>");
		out.print("<head><title></title></head");
		out.print("<body>");
		out.print("<b style = 'font-size:13px; font-family:monaco'>");
		out.print(name+"'s total is " + total +" and his average is " + avg);
		out.print("</b>");
		out.print("</script>");
		out.print("</body>");
		out.print("</html>");
		out.close();
		
	}
}
