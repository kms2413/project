package gradeModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dataBase.ConnectionProvider;
import dataBase.JdbcUtil;

public class GradeDao {
	private static GradeDao instance = new GradeDao();
	
	public static GradeDao getInstance(){
		return instance;
	}
	
	public int insert(GradeDto grade){
		int total = grade.getEng()+grade.getKor()+grade.getMath();
		grade.setTotal(total);
		
		float average = (float) grade.getTotal()/3;
		grade.setAverage(average);
		
		int value = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try{
			String sql = "insert into grade values(grade_num_seq.nextval, ?,?,?,?,?,?)";
			conn = ConnectionProvider.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, grade.getName());
			pstmt.setInt(2, grade.getKor());
			pstmt.setInt(3, grade.getMath());
			pstmt.setInt(4, grade.getEng());
			pstmt.setInt(5, grade.getTotal());
			pstmt.setFloat(6, grade.getAverage());
			
			value = pstmt.executeUpdate();
		}catch(Exception e){
			System.out.println("Insert Error");
			e.printStackTrace();
		}finally{
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return value;
	}
	
	public GradeDto read(int num){
		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		GradeDto dto = null;
		
		try{
			String sql = "select * from grade where num = ?";
			conn=ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				dto=new GradeDto();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMath(rs.getInt("math"));
				dto.setTotal(rs.getInt("total"));
				dto.setAverage(rs.getFloat("average"));
			}
			
			
		}catch(Exception e){
			System.out.println("GradeDao >> read Error");
			e.printStackTrace();
		}finally{
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return dto;
	}
	
	public int delete(int num, String name){
		Connection conn = null;
		PreparedStatement pstmt=null;
		int value = 0;
		
		try{
			String sql = "delete from grade where num = ? and name = ?";
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, name);
			value = pstmt.executeUpdate();
			
		}catch(Exception e){
			System.out.println("GradeDao >> Delete ERror");
			e.printStackTrace();
		}finally{
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		
		return value;
	}
	
	public int update(GradeDto dto){
		Connection conn = null;
		PreparedStatement pstmt= null;
		
		int value= 0;
		int total = dto.getKor()+dto.getEng()+dto.getMath();
		dto.setTotal(total);
		
		float average = (float)dto.getTotal()/3;
		dto.setAverage(average);
		
		try{
			String sql = "update grade set kor = ?, eng = ?, math=?, total=?, average=? where num = ?";
			conn=ConnectionProvider.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getKor());
			pstmt.setInt(2, dto.getEng());
			pstmt.setInt(3, dto.getMath());
			pstmt.setInt(4, dto.getTotal());
			pstmt.setFloat(5, dto.getAverage());
			pstmt.setInt(6, dto.getNum());
			
			value = pstmt.executeUpdate();
		
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("GradeDao >> Update Error");
		}finally{
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		
		return value;
	}
}
