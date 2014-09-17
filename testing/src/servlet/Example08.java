package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Example08 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("euc-kr");
		String userId = req.getParameter("userId");
		String userPass = req.getParameter("userPass");

		String id = "abc123";
		String pass = "abc123";
		
		if(userId.equals(id)&& userPass.equals(pass)){
			resp.setContentType("text/html;charset=euc-kr");
			
			ServletContext sc = super.getServletContext();
			RequestDispatcher rd = sc.getRequestDispatcher("/servlet/Example08_Sub");
			rd.include(req, resp);
			
			PrintWriter out=resp.getWriter();

			out.print("<html>");
			out.print("<head><title></title></head>");
			out.print("<body>");
			
			rd.include(req, resp);
			out.print("<hr width='400px' align = 'left' color='red'/>");
			
			rd.include(req, resp);
			out.print("<hr width='400px' align = 'left' color='red'/>");
			
			rd.include(req, resp);
			out.print("<hr width='400px' align = 'left' color='red'/>");

			out.print("</body>");
			out.print("</html>");
			out.close();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("euc-kr");
		String userId = req.getParameter("userId");
		String userPass = req.getParameter("userPass");

		String id = "abc123";
		String pass = "abc123";
		
		if(userId.equals(id)&& userPass.equals(pass)){
			resp.setContentType("text/html;charset=euc-kr");
			
			ServletContext sc = super.getServletContext();
			RequestDispatcher rd = sc.getRequestDispatcher("/servlet/Example08_Sub");
			rd.forward(req, resp);
			
			PrintWriter out=resp.getWriter();

			out.print("<html>");
			out.print("<head><title></title></head>");
			out.print("<body>");
			
			out.print("</body>");
			out.print("</html>");
			out.close();
		}
	}

	
}
