package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Calc extends HttpServlet {

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
		int firstNumb = Integer.parseInt(req.getParameter("firstNumb"));
		String operator = req.getParameter("operator");
		int secondNumb = Integer.parseInt(req.getParameter("secondNumb"));
		
		PrintWriter out = resp.getWriter();
		out.print("<html>");
		out.print("<head><title></title></head");
		out.print("<body>");
		out.print("<b style = 'font-size:13px; font-family:monaco'>");
		out.print(firstNumb + " " + operator + " " + secondNumb + " = " 
		+ calculation(firstNumb, operator, secondNumb));
		out.print("</b>");
		out.print("</script>");
		out.print("</body>");
		out.print("</html>");
		out.close();
	}
	
	protected String calculation(int firstNumb, String operator, int secondNumb){
		String result = "";
		if(operator.equals("+")){
			result = firstNumb+secondNumb + "";
		}else if(operator.equals("-")){
			result = firstNumb-secondNumb + "";
		}else if(operator.equals("*")){
			result = firstNumb*secondNumb+"";
		}else if(operator.equals("/")){
			result = firstNumb*1.0/secondNumb+"";
		}
		return result;
	}
}
