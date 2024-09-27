package com.br.vita.issue.model.dao;

import static com.br.vita.common.template.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.List;
import java.util.Properties;

import com.br.vita.issue.model.vo.Document;
import com.br.vita.issue.model.vo.Mrecords;



public class IssueDao {

	private Properties prop = new Properties();

	public IssueDao() {

		String filePath = IssueDao.class.getResource("/db/mappers/issue-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(filePath));

		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	// 의료진승인용 신청서 insert
	public int certificateApplicationInsert(Connection conn, String userNo, String type ,String purpose,String careNo) {
		
		
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("certificateApplicationInsert");
		/* System.out.println(sql); */
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1,userNo);
			pstmt.setString(2,careNo);
			pstmt.setString(3,type);
			pstmt.setString(4,purpose);
			
			
			
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
		
		
	}
	
	public int certificateApplicationSelect(Connection conn, String careNo,String type) {
		
		int count = 0;

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("certificateApplicationSelect");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, careNo);
			pstmt.setString(2, type);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("COUNT");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
		
		
		
	}

	/**
	 * 진료기록 조회 Dao
	 * @author 최보겸
	 * @param conn
	 * @param userNo
	 * @return records
	 */
	public List<Mrecords> selectMrecords(Connection conn, String userNo, String startDate, String endDate) {
		List<Mrecords> records = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMrecords");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userNo);
			pstmt.setString(2, startDate);
			pstmt.setString(3, endDate);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Mrecords r = new Mrecords();
				r.setCareNo(rset.getString("CARE_NO"));
				r.setTreatmentDate(rset.getDate("TREATMENT_DATE"));
				r.setDiagnosisName(rset.getString("DIAGNOSIS_NAME"));
				records.add(r);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return records;
	}

	/**
	 * 선택한 진료번호에 맞는 진료정보 증명서에 뿌리기
	 * @author 최보겸
	 * @param careNo
	 * @return documents
	 */
	public Document getDocumentByCareNo(Connection conn, String careNo) {
		Document documents = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getDocumentByCareNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,careNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				documents = new Document(rset.getInt("DOC_NUM")
						   , rset.getString("DOC_PURPOSE")
						   , rset.getDate("APPLY_DATE")
						   , rset.getString("DEPT_NAME")
						   , rset.getString("LICENCE_NO")
						   , rset.getString("DOCTOR_NAME")
						   , rset.getString("CARE_NO"));				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return documents;
	}
	
	
	public List<Mrecords> careListSelectByDate(Connection conn, String userNo, String caredate1, String caredate2) {
		
		List<Mrecords> mr = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("careListSelectByDate");
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1,caredate1);
			pstmt.setString(2,caredate2);
			pstmt.setString(3,userNo);
			
			rset=pstmt.executeQuery();
			
			while(rset.next()) {
				
				mr.add(	new Mrecords(rset.getDate("TREATMENT_DATE")
								  ,rset.getString("DIAGNOSIS_NAME")
								  ,rset.getString("DEPT_NAME")
								  ,rset.getString("CARE_NO")));
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return mr;
		
		
	}

	/**
	 * 발급 완료된 증명서 리스트 
	 * select - rset
	 * @author 최보겸
	 * @param conn
	 * @param userNo 회원 식별할 userNo
	 * @return docList 주섬주섬 담아
	 */
	public List<Document> selectDocumentList(Connection conn, String userNo) {
		List<Document> docList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectDocumentList");
		

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				docList.add(new Document(rset.getInt("DOC_NUM")
									   , rset.getString("USER_NO")
									   , rset.getString("CARE_NO")
									   , rset.getString("DOC_TYPE")
									   , rset.getString("DOC_CHECK")
									   , rset.getString("DOC_PURPOSE")
									   , rset.getInt("PRICE")
									   , rset.getDate("APPLY_DATE")
									   , rset.getString("DEPT_NAME")
									   , rset.getString("LICENCE_NO")
									   , rset.getString("DOCTOR_NAME")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return docList;
	}//selectdocumentList

	/**
	 * 새 발급 신청 insert
	 * @author 최보겸
	 * @param conn
	 * @param careNo
	 * @param userNo
	 * @param docType
	 * @param docPurpose
	 * @return result 처리행수
	 */
	public int insertDocument(Connection conn, String careNo, String userNo, String docType, String docPurpose) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertDocument");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userNo);
			pstmt.setString(2, careNo);
			pstmt.setString(3, docType);
			pstmt.setString(4, docPurpose);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}//insertDocument
	
	
	

}
