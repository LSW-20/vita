package com.br.vita.notice.model.service;

import static com.br.vita.common.template.JDBCTemplate.close;
import static com.br.vita.common.template.JDBCTemplate.commit;
import static com.br.vita.common.template.JDBCTemplate.getConnection;
import static com.br.vita.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.br.vita.notice.model.dao.NoticeDao;
import com.br.vita.notice.model.vo.Notice;

public class NoticeService {

//	public int selectNoticeListCount() {
//		
//	private NoticeDao nDao = new NoticeDao();
//		
//	public int selectBoardListCount() {
//		Connection conn = getConnection();
//		int listCount = nDao.selectNoticeListCount(conn);
//		close(conn);
//		
//		return listCount;
//	}
//	
//	public List<Notice> selectBoardList(PageInfo pi){
//		Connection conn = getConnection();
//		List<Notice> list = nDao.selectBoardList(conn, pi);
//		close(conn);
//		return list;
//	}

}
