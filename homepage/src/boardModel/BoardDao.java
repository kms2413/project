package boardModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
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
			String sql = "insert into board values(board_board_number_seq.nextval,?,?,?,?,?,?,?,?,?,?,?)";
			
			conn = ConnectionProvider.getConnection();
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, board.getWriter());
			pstmt.setString(2, board.getSubject());
			pstmt.setString(3, board.getEmail());
			pstmt.setString(4, board.getContent());
			pstmt.setString(5, board.getPassword());
			pstmt.setTimestamp(6, new Timestamp(board.getWriteDate().getTime()));
			pstmt.setInt(7, board.getReadCount());
			pstmt.setString(8, board.getIp());
			pstmt.setInt(9, board.getGroupNumber());
			pstmt.setInt(10, board.getSequenceNumber());
			pstmt.setInt(11, board.getSequenceLevel());
			
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
				sql = "update board set sequence_number=sequence_number+1 where group_number =? and sequence_number>?";
				conn = ConnectionProvider.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,  groupNumber);
				pstmt.setInt(2, sequenceNumber);
				pstmt.executeUpdate();
				
				sequenceNumber = sequenceNumber+1;
				sequenceLevel = sequenceLevel+1;
				
				
			}else{
				sql ="select max(group_Number) from board";
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
	
	public ArrayList<BoardDto> getBoardList(int startRow, int endRow){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<BoardDto> valueList = null;
		
		try{
			String sql = "select * from(select rownum as rnum, a.* from((select * from board order by group_number desc, sequence_number asc)a))b where b.rnum >=? and b.rnum<=?";
			conn = ConnectionProvider.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs=pstmt.executeQuery();
			
			valueList=new ArrayList<BoardDto>();
			while(rs.next()){
				BoardDto board = new BoardDto();
				board.setBoardNumber(rs.getInt("board_number"));
				board.setWriter(rs.getString("writer"));
				board.setSubject(rs.getString("subject"));
				board.setEmail(rs.getString("email"));
				board.setContent(rs.getString("content"));
				
				valueList.add(board);
			}
			
			
		}catch(Exception e){
			System.out.println(" getBoard Error");
			e.printStackTrace();
		}finally{
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		
		return valueList;
	}
	
	public int getCount(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int value = 0;
		
		try{
			String sql = "select count(*) from board";
			conn=ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next())value = rs.getInt(1);
			
		}catch(Exception e)	{
			e.printStackTrace();
			System.out.println("getCount ERror");
		}finally{
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return value;
	}
}
