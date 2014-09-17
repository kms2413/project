package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Example09_Delete
 */
@WebServlet("/servlet/Example09_Delete")
public class Example09_Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Example09_Delete() {
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
		Cookie[] cookies = request.getCookies();
		
		if(cookies!=null){
			for(int i =0; i<cookies.length;i++){
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
			}
		}
		
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();

		out.print("<html>");
		out.print("<head><title></title></head>");
		out.print("<body style='font-size:13px;font-family:맑은 고딕'>");
		out.print("<a href='/testing/04_Servlet/09_example.html'><font color='red'>전 단계이동</font></a>");
		out.print("<br/><br/>");

		out.print("<b>삭제되었습니다.</b>");
		
		out.print("</body>");
		out.print("</html>");
		out.close();
	}

}
