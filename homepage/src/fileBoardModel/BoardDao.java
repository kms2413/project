package fileBoardModel;

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

	public static BoardDao getInstance() {
		return instance;
	}

	public int insert(BoardDto board) {
		board.setWriteDate(new Date());
		board.setReadCount(0);

		Connection conn = null;
		PreparedStatement pstmt = null;
		int value = 0;

		writeNumber(conn, board);
		// System.out.println(board.getGroupNumber() + "," +
		// board.getSequenceNumber() + "," + board.getSequenceLevel());
		try {
			String sql="insert into board(board_number, writer, subject, email,"
		               + " content, password, write_date, read_count, ip, group_number,"
		               + " sequence_number, sequence_level, file_name, path, file_size)"
		               + "values(board_board_number_seq.nextval, ?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);

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
			
			pstmt.setString(12, board.getFileName());
			pstmt.setString(13, board.getPath());
			pstmt.setLong(14, board.getFileSize());

			value = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("Insert Error");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);

		}
		return value;
	}

	public void writeNumber(Connection conn, BoardDto board) {
		// �뙴�뫂�뱜(域밸챶竊숃린�뜇�깈, 疫뀐옙占쎈떄占쎄퐣, 疫뀐옙占쎌쟿甕곤옙), 占쎈뼗疫뀐옙(域밸챶竊숃린�뜇�깈,
		// 疫뀐옙占쎈떄占쎄퐣, 疫뀐옙占쎌쟿甕곤옙)
		int boardNumber = board.getBoardNumber();
		int groupNumber = board.getGroupNumber();
		int sequenceNumber = board.getSequenceNumber();
		int sequenceLevel = board.getSequenceLevel();

		int max = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";

		try {
			if (boardNumber != 0) {
				sql = "update board set sequence_number=sequence_number+1 where group_number =? and sequence_number>?";
				conn = ConnectionProvider.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, groupNumber);
				pstmt.setInt(2, sequenceNumber);
				pstmt.executeUpdate();

				sequenceNumber = sequenceNumber + 1;
				sequenceLevel = sequenceLevel + 1;

			} else {
				sql = "select max(group_Number) from board";
				conn = ConnectionProvider.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();

				// 域밸챶竊숃린�뜇�깈 筌욑옙占쎌젟
				if (rs.next()) {
					max = rs.getInt(1) + 1;
				} else {
					max = board.getGroupNumber();
				}

			}

			board.setGroupNumber(groupNumber);
			board.setSequenceNumber(sequenceNumber);
			board.setSequenceLevel(sequenceLevel);

		} catch (Exception e) {
			System.out.println("Insert Error");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);

		}
	}

	public ArrayList<BoardDto> getBoardList(int startRow, int endRow) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<BoardDto> valueList = null;

		try {
			String sql = "select * from(select rownum as rnum, a.* from((select * from board order by group_number desc, sequence_number asc)a))b where b.rnum >=? and b.rnum<=?";
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();

			valueList = new ArrayList<BoardDto>();
			while (rs.next()) {
				BoardDto board = new BoardDto();
				board.setBoardNumber(rs.getInt("board_number"));
				board.setWriter(rs.getString("writer"));
				board.setSubject(rs.getString("subject"));
				board.setEmail(rs.getString("email"));
				board.setContent(rs.getString("content"));
				board.setPassword(rs.getString("password"));

				board.setWriteDate(rs.getTimestamp("write_date"));
				board.setReadCount(rs.getInt("read_count"));
				board.setIp(rs.getString("ip"));
				board.setGroupNumber(rs.getInt("group_number"));
				board.setSequenceNumber(rs.getInt("sequence_number"));
				board.setSequenceLevel(rs.getInt("sequence_level"));
				valueList.add(board);
			}

		} catch (Exception e) {
			System.out.println(" getBoard Error");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}

		return valueList;
	}

	public int getCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int value = 0;

		try {
			String sql = "select count(*) from board";
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next())
				value = rs.getInt(1);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getCount ERror");
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		return value;
	}

	public BoardDto read(int boardNumber) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDto board = null;

		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);

			String sqlUpdate = "update board set read_count=read_count+1 where board_number=?";
			pstmt = conn.prepareStatement(sqlUpdate);
			pstmt.setInt(1, boardNumber);
			pstmt.executeUpdate();
			if (pstmt != null)
				pstmt.close();

			String sqlSelect = "select * from board where board_number=?";
			pstmt = conn.prepareStatement(sqlSelect);
			pstmt.setInt(1, boardNumber);
			rs = pstmt.executeQuery();
			if (rs.next()) {

				board = new BoardDto();
				board.setBoardNumber(rs.getInt("board_number"));
				board.setWriter(rs.getString("writer"));
				board.setSubject(rs.getString("subject"));
				board.setEmail(rs.getString("email"));
				board.setContent(rs.getString("content"));
				board.setPassword(rs.getString("password"));

				board.setWriteDate(rs.getTimestamp("write_date"));
				board.setReadCount(rs.getInt("read_count"));
				board.setIp(rs.getString("ip"));
				board.setGroupNumber(rs.getInt("group_number"));
				board.setSequenceNumber(rs.getInt("sequence_number"));
				board.setSequenceLevel(rs.getInt("sequence_level"));
				
				board.setFileName(rs.getString("file_name"));
				board.setPath(rs.getString("path"));
				board.setFileSize(rs.getLong("file_size"));
			}
			conn.commit();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("read Error");
			JdbcUtil.rollback(conn);
		} finally {

			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}

		return board;
	}

	public int delete(int boardNumber, String password) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int value = 0;

		try {
			String sql = "delete from board where board_number=? and password =?";
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNumber);
			pstmt.setString(2, password);
			value = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("delete Error");
		} finally {

			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}

		return value;
	}

	public BoardDto updateBoard(int boardNumber) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDto board = null;

		try {
			String sqlSelect = "select * from board where board_number=?";
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sqlSelect);
			pstmt.setInt(1, boardNumber);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				board = new BoardDto();
				board.setBoardNumber(rs.getInt("board_number"));
				board.setWriter(rs.getString("writer"));
				board.setSubject(rs.getString("subject"));
				board.setEmail(rs.getString("email"));
				board.setContent(rs.getString("content"));
				board.setPassword(rs.getString("password"));

				board.setWriteDate(rs.getTimestamp("write_date"));
				board.setReadCount(rs.getInt("read_count"));
				board.setIp(rs.getString("ip"));
				board.setGroupNumber(rs.getInt("group_number"));
				board.setSequenceNumber(rs.getInt("sequence_number"));
				board.setSequenceLevel(rs.getInt("sequence_level"));
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("read Error");
		} finally {

			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}

		return board;
	}

	public int update(BoardDto board) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int value = 0;
		
		try{
			String sql = "update board set email=?, subject=?, content=? where board_number = ?";
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, board.getEmail());
			pstmt.setString(2, board.getSubject());
			pstmt.setString(3, board.getContent());
			pstmt.setInt(4, board.getBoardNumber());
			
			value = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("update Error");
		} finally {

			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}
		
		return value;
	}
}