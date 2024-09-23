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

import com.br.vita.common.model.vo.PageInfo;
import com.br.vita.news.model.vo.News;
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
	
	
	public int selectNewsListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNewsListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}
	
	public List<News> selectNewsList(Connection conn, PageInfo pi) {
		List<News> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNewsList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);		
			
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


	public int insertNews(Connection conn, News n) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNews");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n.getNewsTitle());
			pstmt.setString(2, n.getNewsContent());
			pstmt.setString(3, n.getUserNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public News selectNews(Connection conn, int newsNo) {
		News n = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNews");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, newsNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				n = new News();
				n.setNewsNo(rset.getInt("news_no"));
				n.setNewsTitle(rset.getString("news_title"));
				n.setNewsContent(rset.getString("news_content"));
				n.setUserId(rset.getString("user_id"));
				n.setRegistDate(rset.getDate("regist_date"));
				n.setUserNo(rset.getString("user_no"));
				n.setNewsCount(rset.getInt("news_count"));
				n.setStatus(rset.getString("status"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return n;
	}


	public int increaseCount(Connection conn, int newsNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, newsNo);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int updateNews(Connection conn, News n) {
		// update => 처리된 행수
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateNews");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n.getNewsTitle());
			pstmt.setString(2, n.getNewsContent());
			pstmt.setInt(3, n.getNewsNo());
					
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}


	public int deleteNews(Connection conn, int newsNo) {
		// update => 처리된 행수
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteNews");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, newsNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public List<News> selectNewsList(Connection conn) {
		List<News> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNewsMainList");
		
		try {
			pstmt = conn.prepareStatement(sql);		
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new News(rset.getInt("news_no")
						, rset.getString("news_title")
						, rset.getString("news_content")
						, rset.getDate("regist_date")
						, rset.getString("user_no")
						, rset.getInt("news_count")
						, rset.getString("status")
						, rset.getString("user_id")));
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
