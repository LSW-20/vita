package com.br.vita.notice.model.service;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.br.vita.common.model.vo.PageInfo;
import com.br.vita.notice.model.dao.NoticeDao;
import com.br.vita.notice.model.vo.Notice;

import static com.br.vita.common.template.JDBCTemplate.getConnection;
import static com.br.vita.common.template.JDBCTemplate.close;
import static com.br.vita.common.template.JDBCTemplate.commit;
import static com.br.vita.common.template.JDBCTemplate.rollback;

public class NoticeService {

	private NoticeDao nDao = new NoticeDao();
	
	public int selectNoticeListCount() {
		Connection conn = getConnection();
		int listCount = nDao.selectNoticeListCount(conn);
		close(conn);
		return listCount;
	}
	
	public List<Notice> selectNoticeList(PageInfo pi) {
		Connection conn = getConnection();
		List<Notice> list = nDao.selectNoticeList(conn, pi);
		close(conn);
		return list;
	}

	public int insertNotice(Notice n) {
		Connection conn = getConnection();
		int result = nDao.insertNotice(conn, n);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public Map<String, Object> selectNoticeByNo(int noticeNo) {
		Connection conn = getConnection();
		
		// 1) Board로부터 게시글 데이터 조회
		Notice n = nDao.selectNotice(conn, noticeNo);
		
		Map<String, Object> nmap = new HashMap<>();
		nmap.put("n", n);
		close(conn);

		return nmap;
	}

	public int increaseCount(int noticeNo) {
		Connection conn = getConnection();
		int result = nDao.increaseCount(conn, noticeNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int updateNotice(Notice n) {
		Connection conn = getConnection();
		int result = nDao.updateNotice(conn, n);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int deleteNotice(int noticeNo) {
		Connection conn = getConnection();
		int result = nDao.deleteNotice(conn, noticeNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}



}
