package com.br.vita.cs.model.dao;

import static com.br.vita.common.template.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.br.vita.common.model.vo.PageInfo;
import com.br.vita.cs.model.vo.Cs;

public class CsDao {
	private Properties prop = new Properties();
	
	public CsDao() {
		try {
			prop.loadFromXML(new FileInputStream(CsDao.class.getResource("/db/mappers/cs-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}//CsDao

	/**
	 * 페이징을 위한 
	 * 게시글 개수를 DB에서 뽑아와 반환
	 * author: 최보겸
	 * @param conn
	 * @param cetegory
	 * @return listCount
	 */
	public int selectBoardListCount(Connection conn, String category) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBoardListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);//카테고리 설정
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}//selectBoardListCount
	
	/**
	 * 페이지에 맞는 게시글 리스트 가져오기
	 * select해오는 거니까 rset
	 * author: 최보겸
	 * @param conn
	 * @param pi 페이지정보 갖고 있는 객체
	 * @param category 불러올 게시글 카테고리
	 * @return csList
	 */
	public List<Cs> selectBoardList(Connection conn, PageInfo pi, String category) {
		List<Cs> csList = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectBoardList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit()-1;
			
			pstmt.setString(1, category);
			
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				csList.add(new Cs(rset.getInt("BOARD_NO")
								, rset.getString("BOARD_TITLE")		
								, rset.getString("USER_ID")								
								, rset.getDate("REGIST_DATE")
								, rset.getInt("BOARD_COUNT")
								, rset.getString("CATEGORY")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return csList;
	}//selectBoardList

	/**
	 * 게시글 번호로 게시글 상세조회 가져오기
	 * select => rset
	 * @author 최보겸
	 * @param conn
	 * @param boardNo
	 * @return board : 글번호 맞는 게시글 상세정보
	 */
	public Cs selectBoardByNo(Connection conn, int boardNo) {
		Cs board = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBoardByNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				board = new Cs(rset.getInt("BOARD_NO")
							 , rset.getString("BOARD_TITLE")
							 , rset.getString("BOARD_CONTENT")
							 , rset.getString("USER_ID")
							 , rset.getDate("REGIST_DATE")
							 , rset.getInt("BOARD_COUNT")
							 , rset.getString("CATEGORY")
							 , rset.getString("C_EMP")
							 , rset.getString("C_DEPT")
							 , rset.getString("ANSWER_CONTENT")
						);
				board.setPhone(rset.getString("PHONE"));
				board.setEmail(rset.getString("EMAIL"));
				board.setUserName(rset.getString("USER_NAME"));
				board.setUserDate(rset.getString("USER_DATE"));
				board.setUserType(rset.getString("USER_TYPE"));
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return board;
	}//selectBoardByNo

	/**
	 * 조회수 증가 요청 - UPDATE
	 * @author 최보겸
	 * @param conn
	 * @param boardNo
	 * @return result : update결과 여부 반환
	 */
	public int increaseCount(Connection conn, int boardNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}//increaseCount

	/**
	 * @author 최보겸
	 * @param conn
	 * @param c 작성게시글 정보
	 * @return result 처리행수
	 */
	public int insertCs(Connection conn, Cs c) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCs");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getUserNo());
			pstmt.setString(2, c.getBoardTitle());
			pstmt.setString(3, c.getBoardContent());
			pstmt.setString(4, c.getCategory());
			pstmt.setString(5, c.getcEmp());
			pstmt.setString(6, c.getcDept());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}//insertCs

	/**
	 * 게시글 삭제
	 * @author 최보겸
	 * @param conn
	 * @param boardNo
	 * @return result 처리행수 반환
	 */
	public int deleteCs(Connection conn, int boardNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteCs");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}//deleteCs
	





}
