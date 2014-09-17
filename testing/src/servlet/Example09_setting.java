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
 * Servlet implementation class Example09_setting
 */
@WebServlet("/servlet/Example09_setting")
public class Example09_setting extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Example09_setting() {
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
		System.out.println("ok");
		request.setCharacterEncoding("euc-kr");
		String[] car = request.getParameterValues("car");
		System.out.println(car.length);
		
		if(car.length!=0){
			for(int i =0; i <car.length; i++){
				Cookie cookie = new Cookie("car" + i, car[i]); 
				cookie.setMaxAge(60*20); // sec * min * hr * day 60*60*24*365
				response.addCookie(cookie);
			}
		}
		
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out=response.getWriter();

		out.print("<html>");
		out.print("<head><title></title></head>");
		out.print("<body>");
		out.print("<b style='font-size:13px;font-family:monaco'>");
		out.print("<script type='text/javascript'>");
		out.print("window.alert('장바구니에 담겼습니다.');");
		out.print("location.href='/testing/04_Servlet/09_example.html';");
		out.print("</script>");
		out.print("</b>");
		out.print("</body>");
		out.print("</html>");
		out.close();
	}


}
