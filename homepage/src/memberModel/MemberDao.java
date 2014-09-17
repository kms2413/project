package memberModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import dataBase.ConnectionProvider;
import dataBase.JdbcUtil;

public class MemberDao {
	private static MemberDao instance = new MemberDao();
	public static MemberDao getInstance(){
		return instance;	
	}
	
	public int insert(MemberDto member){
		System.out.println(member.getId());
		if(member.getId().equals("manager")){
			member.setMemberLevel("AA");
		}else{
			member.setMemberLevel("BA");
		}
		
		member.setRegisterDate(new Date());
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int value =0;

		try{
			String sql = "insert into member values(member_num_seq.nextval, ?,?,?,?,?,?,?,?,?,?,?,?,?)";
			conn = ConnectionProvider.getConnection();
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getJumin1());
			pstmt.setString(5, member.getJumin2());
			pstmt.setString(6, member.getEmail());
			pstmt.setString(7, member.getZipcode());
			pstmt.setString(8, member.getAddress());
			pstmt.setString(9, member.getJob());
			pstmt.setString(10, member.getMailing());
			pstmt.setString(11, member.getInterest());
			pstmt.setString(12, member.getMemberLevel());
			pstmt.setTimestamp(13, new Timestamp(member.getRegisterDate().getTime()));
			
			value = pstmt.executeUpdate();
			
		}catch(Exception e){
			System.out.println("Member Insert Error");
			e.printStackTrace();
		}finally{
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		
		return value;
	}
	
	public int idCheck(String id){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int value =0;
		
		try{
			String sql = "select id from member where id = ?";
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				value = 1;
			}
		}catch(Exception e){
			System.out.println("Id Check Error");
			e.printStackTrace();
		}finally{
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
			JdbcUtil.close(conn);
		}
		
		return value;
	}
	
	public ArrayList<ZipcodeDto> zipcodeReader(String checkDong){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ZipcodeDto> valueList = null;
		
		valueList = new ArrayList<ZipcodeDto>();
		try{
			String sql = "select * from zipcode where dong =?";
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkDong);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				ZipcodeDto address = new ZipcodeDto();
				address.setZipcode(rs.getString("zipcode"));
				address.setSido(rs.getString("sido"));
				address.setGugun(rs.getString("gugun"));
				address.setDong(rs.getString("dong"));
				address.setRi(rs.getString("ri"));
				address.setBunji(rs.getString("bunji"));
				valueList.add(address);
			}
			
		}catch(Exception e){
			System.out.println("Member Zipcode Error");
			e.printStackTrace();
		}finally{
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		
		return valueList;
	}
	
	public String loginCheck(String id, String password){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String value = null;
		
		try{
			String sql = "select member_level from member where id = ? and password = ?";
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs= pstmt.executeQuery();
			
			if(rs.next()){
				value = rs.getString("member_level");
			}
			
		}catch(Exception e) {
			System.out.println("login Check Error");
			e.printStackTrace();
		}finally{
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return value;
	}
	
	public int exitCheck(String id, String password){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int value = 0;
		try{
			String sql = "select * from member where id = ? and password =?";
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				sql = "delete from member where id = ?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, id);
				value = pstmt.executeUpdate();
			}
			
		}catch(Exception e){
			System.out.println("ExitCheck Error");
			e.printStackTrace();
		}finally{
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return value;
	}
	
	public MemberDto update(String id){ 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDto dto = null;
		
		try{
			String sql = "select * from member where id = ?";
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			

			
			if(rs.next()){
				dto = new MemberDto();
				
				dto.setId(rs.getString("id"));
				dto.setPassword(rs.getString("password"));
				dto.setName(rs.getString("name"));
				dto.setJumin1(rs.getString("jumin1"));
				dto.setJumin2(rs.getString("jumin2"));
				dto.setEmail(rs.getString("email"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddress(rs.getString("address"));
				dto.setJob(rs.getString("job"));
				dto.setMailing(rs.getString("mailing"));
				dto.setInterest(rs.getString("interest"));
			}
			
		}catch(Exception e){
			System.out.println("Update Error");
			e.printStackTrace();
		}finally{
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		
		return dto;
	}
}
