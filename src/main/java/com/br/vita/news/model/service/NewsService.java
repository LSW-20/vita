package com.br.vita.news.model.service;

import java.sql.Connection;
import java.util.List;

import com.br.vita.common.model.vo.PageInfo;
import com.br.vita.news.model.dao.NewsDao;
import com.br.vita.news.model.vo.News;

import static com.br.vita.common.template.JDBCTemplate.getConnection;
import static com.br.vita.common.template.JDBCTemplate.close;
import static com.br.vita.common.template.JDBCTemplate.commit;
import static com.br.vita.common.template.JDBCTemplate.rollback;

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

}
