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
 * Servlet implementation class Example09_Getting
 */
@WebServlet("/servlet/Example09_Getting")
public class Example09_Getting extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Example09_Getting() {
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
//		System.out.println("ok");
		request.setCharacterEncoding("euc-kr");
		Cookie[] cookies = request.getCookies();
		System.out.println(cookies.length);
		

		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();

		
		out.print("<html>");
		out.print("<head><title></title></head>");
		out.print("<body>");
		out.print("<b style='font-size:13px;font-family:monaco'>");
		out.print("<a href='/testing/04_Servlet/09_example.html'><font color='red'>전 단계이동</font></a>");
		out.print("<br/><br/>");
		
		if(cookies!=null){
			String imgStr="";
			for(int i=0; i<cookies.length; i++){
				out.print("쿠키의 이름 : " + cookies[i].getName() + "<br/>");
				out.print("쿠키의 값 : " + cookies[i].getValue() + "<br/><br/>");
			
				if(cookies[i].getValue().equals("Ferrari")){
					imgStr="/testing/04_Servlet/Ferrari.jpg";
				}
				if(cookies[i].getValue().equals("Ferrari2")){
					imgStr="/testing/04_Servlet/Ferrari2.jpg";
				}
				if(cookies[i].getValue().equals("Bridge")){
					imgStr="/testing/04_Servlet/Bridge.jpg";
				}
				out.print("<img src='" + imgStr + "'width='300' height='300'/><br/><br/>");
			}
		}
		out.print("</b>");
		out.print("</body>");
		out.print("</html>");
		out.close();
		
		
	}

}
