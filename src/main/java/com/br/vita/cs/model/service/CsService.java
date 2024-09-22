package com.br.vita.cs.model.service;

import static com.br.vita.common.template.JDBCTemplate.getConnection;
import static com.br.vita.common.template.JDBCTemplate.commit;
import static com.br.vita.common.template.JDBCTemplate.close;
import static com.br.vita.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.br.vita.common.model.vo.PageInfo;
import com.br.vita.cs.model.dao.CsDao;
import com.br.vita.cs.model.vo.Cs;

public class CsService {
	private CsDao cDao = new CsDao();

	/**
	 * 게시글개수 DB에서 가져오기
	 * author: 최보겸
	 * @return listCount 
	 */
	public int selectBoardListCount() {
		Connection conn = getConnection();
		int listCount = cDao.selectBoardListCount(conn);
		return listCount;
	}
	
	/**
	 * 그 페이지에 맞는 게시글 리스트 데이터 가져오기
	 * author: 최보겸
	 * @param pi
	 * @return csList
	 */
	public List<Cs> selectBoardList(PageInfo pi) {
		Connection conn = getConnection();
		List<Cs> csList = cDao.selectBoardList(conn, pi);
		close(conn);
		return csList;
	}
	
	public Cs selectBoardByNo(int boardNo) {
		Connection conn = getConnection();
		//cs로부터 게시글 데이터 조회
		Cs c = cDao.selectBoard(conn, boardNo);
		
		close(conn);
		
		return c;
	}//selectBoardByNo




	
}
