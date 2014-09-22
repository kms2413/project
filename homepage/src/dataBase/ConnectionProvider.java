package dataBase;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
	public static Connection getConnection(){
		Connection conn = null;
		
		String url = "jdbc:oracle:thin:@192.168.7.138:1521:xe";
		String id = "jsp";
		String pass = "1234";
		
		try{
			conn=DriverManager.getConnection(url, id, pass);
		}catch(Exception e){
			System.out.println("ConnectionProvider Error");
			e.printStackTrace();
		}
		
		return conn;
	}
}
