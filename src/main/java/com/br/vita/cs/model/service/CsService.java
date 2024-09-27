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
	 * @author 최보겸
	 * @param category 해당 카테고리 같이 넘김
	 * @return listCount 
	 */
	public int selectBoardListCount(String category) {
		Connection conn = getConnection();
		int listCount = cDao.selectBoardListCount(conn, category);
		return listCount;
	}
	
	/**
	 * 그 페이지에 맞는 게시글 리스트 데이터 가져오기
	 * @author 최보겸
	 * @param pi
	 * @param category
	 * @return csList
	 */
	public List<Cs> selectBoardList(PageInfo pi, String category) {
		Connection conn = getConnection();
		List<Cs> csList = cDao.selectBoardList(conn, pi, category);
		close(conn);
		return csList;
	}
	
	/**
	 * 게시글 번호로 게시글 상세조회 가져오기
	 * @author 최보겸
	 * @param boardNo 해당 게시글번호
	 * @return c 상세 조회할 게시글 상세 내용
	 */
	public Cs selectBoardByNo(int boardNo) {
		Connection conn = getConnection();
		Cs c = cDao.selectBoardByNo(conn, boardNo);
		
		close(conn);
		
		return c;
	}//selectBoardByNo

	/**
	 * 조회수 증가 메소드
	 * @author 최보겸
	 * @param boardNo 해당 게시글번호
	 * @return result : 조회수 증가 요청결과 행 수
	 */
	public int increaseCount(int boardNo) {
		Connection conn = getConnection();
		int result = cDao.increaseCount(conn, boardNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}//increaseCount

	/**
	 * 게시글 insert
	 * @author 최보겸
	 * @param c
	 * @return result 처리행수
	 */
	public int insertCs(Cs c) {
		Connection conn = getConnection();
		int result = cDao.insertCs(conn, c);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}//insertCs

	/**
	 * 게시글 삭제
	 * @author 최보겸
	 * @param boardNo 삭제할 게시글 글번호
	 * @return result 처리행수반환
	 */
	public int deleteCs(int boardNo) {
		Connection conn = getConnection();
		int result = cDao.deleteCs(conn, boardNo);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}//deleteCs

	/**
	 * 게시글 수정
	 * @author 최보겸
	 * @param c
	 * @return result 처리 행수 반환
	 */
	public int updateCs(Cs c, int boardNo) {
		Connection conn = getConnection();
		int result = cDao.updateCs(conn, c, boardNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}//updateCs

	
	
	
	/**
	 * qna 답변 삭제하기
	 * author : 임상우
	 * @param boardNo
	 * @return 삭제된 행 수
	 */
	public int replyDelete(String boardNo) {
		Connection conn = getConnection();
		int result = cDao.replyDelete(conn, boardNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	/**
	 * qna 답변 작성하기
	 * author : 임상우
	 * @param boardNo
	 * @param replyContent
	 * @return insert한 행 수
	 */
	public int replyInsert(String boardNo, String replyContent) {
		Connection conn = getConnection();
		int result = cDao.replyInsert(conn, boardNo, replyContent);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}






	
}
