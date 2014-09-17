package dataBase;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class DBCPInit extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	public void init(ServletConfig config) throws ServletException {
		String jdbcDriver =config.getInitParameter("jdbcDriver");
		try{
			Class.forName(jdbcDriver);
		}catch(ClassNotFoundException e){
			System.out.println("DBCPInit Error");
			e.printStackTrace();
		}
	}

	
}
