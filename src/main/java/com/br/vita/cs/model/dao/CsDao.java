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
	 * @param conn
	 * @return listCount
	 */
	public int selectBoardListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBoardListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
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
	 * @param conn
	 * @param pi 페이지정보 갖고 있는 객체
	 * @return csList
	 */
	public List<Cs> selectBoardList(Connection conn, PageInfo pi) {
		List<Cs> csList = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectBoardList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit();
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
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
	
	public Cs selectBoard(Connection conn, int boardNo) {
		return null;
	}




}
