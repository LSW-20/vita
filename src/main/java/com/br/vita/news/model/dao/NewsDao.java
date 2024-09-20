package com.br.vita.news.model.dao;

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

import com.br.vita.news.model.vo.News;

public class NewsDao {

	private Properties prop = new Properties();
	
	public NewsDao() {
		try {
			prop.loadFromXML(new FileInputStream(NewsDao.class.getResource("/db/mappers/news-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public List<News> selectNoticeList(Connection conn) {
		List<News> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNewsList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new News(rset.getInt("news_no")
						, rset.getString("news_title")
						, rset.getString("user_id")
						, rset.getDate("regist_date")
						, rset.getInt("news_count")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

}
