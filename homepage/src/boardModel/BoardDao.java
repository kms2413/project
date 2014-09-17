package boardModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import dataBase.ConnectionProvider;
import dataBase.JdbcUtil;

public class BoardDao {
	private static BoardDao instance = new BoardDao();
	public static BoardDao getInstance(){
		return instance;
	}
	
	public int insert(BoardDto board){
		board.setWriteDate(new Date());
		board.setReadCount(0);
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int value = 0;

		writeNumber(conn, board);
		
		try{
			
		}catch(Exception e){
			System.out.println("Insert Error");
			e.printStackTrace();
		}finally{
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
			
		}
		return value;
	}
	
	public void writeNumber(Connection conn, BoardDto board){
		//루트(그룹번호, 글순서, 글레벨), 답글(그룹번호, 글순서, 글레벨)
		int boardNumber = board.getBoardNumber();
		int groupNumber = board.getGroupNumber();
		int sequenceNumber = board.getSequenceNumber();
		int sequenceLevel = board.getSequenceLevel();
		
		int max =0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try{
			if(boardNumber!=0){
				sql = "update board set sequence_number=sequence_number+1 where group_number =? and sequence_level>?";
				conn = ConnectionProvider.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,  groupNumber);
				pstmt.setInt(2, sequenceNumber);
				pstmt.executeUpdate();
				
				sequenceNumber = sequenceNumber+1;
				sequenceLevel = sequenceLevel+1;
				
				
			}else{
				sql ="select max(group_Num) from board";
				conn = ConnectionProvider.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
			}
			
			
			
			//그룹번호 지정
			if(rs.next()){
				max = rs.getInt(1) +1;
			}else{
				max = board.getGroupNumber();
			}
			
			if(boardNumber!=0){
				
			}else{
				groupNumber=max;
				sequenceNumber=board.getSequenceNumber();
				sequenceLevel = board.getSequenceLevel();
			}
			
			board.setGroupNumber(groupNumber);
			board.setSequenceNumber(sequenceNumber);
			board.setSequenceLevel(sequenceLevel);
			
		}catch(Exception e){
			System.out.println("Insert Error");
			e.printStackTrace();
		}finally{
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
			
		}
	}
}
