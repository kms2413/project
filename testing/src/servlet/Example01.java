package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Example01 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Example01() {
		super();
	}
	
	@Override
	public void init() throws ServletException {
		System.out.println("Servlet File Initialize");
	}

	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1)
			throws ServletException, IOException {
		System.out.println("Servlet Main..");
	}

	@Override
	public void destroy() {
		System.out.println("Servlet File Data Destroy");

	}
}
