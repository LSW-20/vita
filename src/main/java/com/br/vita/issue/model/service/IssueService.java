package com.br.vita.issue.model.service;

import static com.br.vita.common.template.JDBCTemplate.close;
import static com.br.vita.common.template.JDBCTemplate.commit;
import static com.br.vita.common.template.JDBCTemplate.getConnection;
import static com.br.vita.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.br.vita.issue.model.dao.IssueDao;
import com.br.vita.issue.model.vo.Document;
import com.br.vita.issue.model.vo.Mrecords;
import com.br.vita.payment.model.dao.PaymentDao;

public class IssueService {

	
	private IssueDao iDao = new IssueDao();
	private PaymentDao pDao = new PaymentDao();
	
	public int certificateApplicationInsert(String userNo, String type,String purpose,String careNo) {
		
		Connection conn = getConnection();
		
		int count =  iDao.certificateApplicationSelect(conn, careNo, type);
		int result = 0;
		// 1) 해당 발급요청 문서가 기존에 존재하는 지 조회 
		// int count = 현재 진료번호에 확인중(R)상태가 몇개인지
		System.out.println(count);
		
		if(count == 0) {
			// 2) 
			result = iDao.certificateApplicationInsert(conn,userNo,type,purpose,careNo);
			
			if(result>0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			
		}
		
		
		close(conn);
		
		return result;
		
	}


	/**
	 * 진료 기록 가져오는 service
	 * @author 최보겸
	 * @param userNo
	 * @return records 진료 기록 
	 */
	public List<Mrecords> selectMrecords(String userNo, String startDate, String endDate) {
		Connection conn = getConnection();
		List<Mrecords> records = iDao.selectMrecords(conn, userNo, startDate, endDate);
		close(conn);
		return records;
	}


	/**
	 * 진료기록을 바탕으로 발급문서에 정보 넣어주는 Service
	 * @author 최보겸
	 * @param careNo 식별할 진료번호
	 * @return documents 뿌려줄 데이터 받아오는 Document객체
	 */
	public Document getDocumentByCareNo(String careNo) {
		Connection conn = getConnection();
		Document documents = iDao.getDocumentByCareNo(conn, careNo);
		close(conn);
		return documents;
	}
	
	
	public List<Mrecords> careListSelectByDate(String userNo,String caredate1,String caredate2) {
		
		Connection conn = getConnection();
		List<Mrecords> mr = iDao.careListSelectByDate(conn, userNo, caredate1, caredate2);
		return mr;
		
		
	}


	/**
	 * 내가 발급한 증명서 리스트를 가져오는 service
	 * select
	 * @author 최보겸
	 * @param userNo
	 * @return docList
	 */
	public List<Document> selectDocumentList(String userNo) {
		Connection conn = getConnection();
		List<Document> docList = iDao.selectDocumentList(conn, userNo);
		close(conn);
		return docList;
	}

	/**
	 * 발급+결제 한 번에 처리
	 * @param dpMap
	 * @author 최보겸
	 * @param dpMap 필요한 거 다 모아둔 map
	 * @return result 둘 다 처리 됐을 때만 result 1
	 */
	public int insertDocumentWithPayment(Map<String, String> dpMap) {
		Connection conn = getConnection();
		int result = 0;
		
		try {
			// 1. 발급 신청 document테이블에 추가 먼저 처리
			String careNo = dpMap.get("careNo");
			String userNo = dpMap.get("userNo");
			String docType = dpMap.get("docType");
			String docPurpose = dpMap.get("docPurpose");
			
			int insertDocument = iDao.insertDocument(conn, careNo, userNo, docType, docPurpose);
			
			//2. 발급신청 완료 되면 결제 처리
			if(insertDocument > 0) {
				String payNo = dpMap.get("payNo");
				String payId = dpMap.get("payId");
				
				//payment처리시 currval 사용가능
				int insertPayment = pDao.insertPayDocument(conn, payNo, userNo, payId);
				
				if(insertPayment > 0) {
					commit(conn);
					result = 1;
				} else {
					rollback(conn);
					result = 0;
				}
			} else {
				rollback(conn);
				result = 0;
			}
			
		} catch (Exception e) {
            rollback(conn);
            e.printStackTrace();
            result = 0;
        } finally {
            close(conn);
        }
		
		return result;
	}//insertDwithP
	
	
	
}
