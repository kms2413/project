package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Example10_Getting
 */
@WebServlet("/servlet/Example10_Getting")
public class Example10_Getting extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Example10_Getting() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		proRequest(request, response);
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		proRequest(request, response);

	}
	protected void proRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		HttpSession session = request.getSession();
		String userId= (String) session.getAttribute("userId");
		String userPass= (String) session.getAttribute("userPass");
		
		
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out=response.getWriter();
		
		out.print("<html>");
		out.print("<head><title></title></head>");
		out.print("<body style='font-size:13px; font-family:monaco'>");
		out.print("<a href='/testing/04_Servlet/10_example.html'><font color=pink>전 단계이동</font></a>");
		out.print("<br/><br/>");
		out.print("<b>"+userId + "," +userPass+"</b>");
		out.print("</body>");
		out.print("</html>");
		out.close();
	}

}
