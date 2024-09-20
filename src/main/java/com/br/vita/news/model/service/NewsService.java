package com.br.vita.news.model.service;

import java.sql.Connection;
import java.util.List;

import com.br.vita.news.model.dao.NewsDao;
import com.br.vita.news.model.vo.News;

import static com.br.vita.common.template.JDBCTemplate.getConnection;
import static com.br.vita.common.template.JDBCTemplate.close;
import static com.br.vita.common.template.JDBCTemplate.commit;
import static com.br.vita.common.template.JDBCTemplate.rollback;

public class NewsService {

	private NewsDao nDao = new NewsDao();
	
	public List<News> selectNewsList() {
		Connection conn = getConnection();
		List<News> list = nDao.selectNoticeList(conn);
		close(conn);
		return list;
	}

}
