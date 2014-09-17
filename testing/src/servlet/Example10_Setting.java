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
 * Servlet implementation class Example10_Setting
 */
@WebServlet("/servlet/Example10_Setting")
public class Example10_Setting extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Example10_Setting() {
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
		String userId=request.getParameter("userId");
		String userPass=request.getParameter("userPass");
		System.out.println(userId+userPass);
		
		HttpSession session = request.getSession();
		//if session is already exist then return current session else return new session
		
		String msg = "";
		if(session.isNew()){
			msg = "Seesion has been created";
			session.setAttribute("userId", userId);
			session.setAttribute("userPass", userPass);
		}else{
			msg = "Already Exist.";
		}
		
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out=response.getWriter();
		
		out.print("<html>");
		out.print("<head><title></title></head>");
		out.print("<body style='font-size:13px; font-family:monaco'>");
		out.print("<script type='text/javascript'>");
		out.print("window.alert('"+msg+"');");
		out.print("location.href='/testing/04_Servlet/10_example.html';");
		out.print("</script>");
		out.print("</body>");
		out.print("</html>");
		out.close();
	}

}
