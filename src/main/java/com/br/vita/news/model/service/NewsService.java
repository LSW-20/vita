package com.br.vita.news.model.service;

import static com.br.vita.common.template.JDBCTemplate.close;
import static com.br.vita.common.template.JDBCTemplate.commit;
import static com.br.vita.common.template.JDBCTemplate.getConnection;
import static com.br.vita.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.br.vita.common.model.vo.PageInfo;
import com.br.vita.news.model.dao.NewsDao;
import com.br.vita.news.model.vo.News;

public class NewsService {

	private NewsDao nDao = new NewsDao();
	
	public int selectNewsListCount() {
		Connection conn = getConnection();
		int listCount = nDao.selectNewsListCount(conn);
		close(conn);
		return listCount;
	}
	
	public List<News> selectNewsList(PageInfo pi) {
		Connection conn = getConnection();
		List<News> list = nDao.selectNewsList(conn, pi);
		close(conn);
		return list;
	}

	public int insertNews(News n) {
		Connection conn = getConnection();
		int result = nDao.insertNews(conn, n);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public Map<String, Object> selectNewsByNo(int newsNo) {
		Connection conn = getConnection();
		
		// 1) Board로부터 게시글 데이터 조회
		News n = nDao.selectNews(conn, newsNo);
		
		Map<String, Object> nmap = new HashMap<>();
		nmap.put("n", n);
		close(conn);

		return nmap;
	}

	public int increaseCount(int newsNo) {
		Connection conn = getConnection();
		int result = nDao.increaseCount(conn, newsNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int updateNews(News n) {
		Connection conn = getConnection();
		int result = nDao.updateNews(conn, n);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int deleteNews(int newsNo) {
		Connection conn = getConnection();
		int result = nDao.deleteNews(conn, newsNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public List<News> selectNewsList() {
		Connection conn = getConnection();
		List<News> list = nDao.selectNewsList(conn);
		close(conn);
		return list;
	}



}
