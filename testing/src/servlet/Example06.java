package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Example06 extends HttpServlet {
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

		String serverName = req.getServerName();
		int serverPort = req.getServerPort();
		String protocol = req.getProtocol();
		
		String remoteHost = req.getRemoteAddr(); //Client address
		int remotePort = req.getRemotePort();
		
		//Really Important***************************
		StringBuffer URL = req.getRequestURL();
		String URI = req.getRequestURI();
		
		String servletPath = req.getServletPath();
		String contextPath = req.getContextPath();
		
		
		System.out.println("serverName: " +serverName);
		System.out.println("serverPort: " + serverPort);
		System.out.println("protocol: " + protocol);
		
		System.out.println("remoteHost:" +remoteHost);
		System.out.println("remotePort:" + remotePort);
		System.out.println("URL:" + URL);
		System.out.println("URI: " + URI);
		
		System.out.println("servletPath: " + servletPath );
		System.out.println("contextPath: " + contextPath);
		
	}
}
