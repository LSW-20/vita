package com.br.vita.company.model.service;

import static com.br.vita.common.template.JDBCTemplate.*;


import java.sql.Connection;
import java.util.List;

import com.br.vita.company.model.dao.CompanyDao;
import com.br.vita.company.model.vo.Company;

public class CompanyService {

	CompanyDao cDao = new CompanyDao();
	
	
	/**
	 * 모든 연계기업 목록 조회
	 * author : 임상우
	 * @return List<Company>
	 */
	public List<Company> companySelect() {
		Connection conn = getConnection();
		List<Company> list = cDao.companySelect(conn);
		close(conn);
		return list;
	}
	
	
	/**
	 * 연계기업 추가
	 * author : 임상우
	 * @param compNo
	 * @param compName
	 * @param adminNo
	 * @return 추가된 행 수
	 */
	public int companyInsert(String compNo, String compName, String adminNo) {
		Connection conn = getConnection();
		int result = cDao.companyInsert(conn, compNo, compName, adminNo);
		
		if(result > 0) {
			commit(conn); // conn.commit();이 아니다. JDBCTemplate에서 null체크와 닫혀있는지 확인하고 conn.commit()을 한다.
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	/**
	 * 연계기업 수정
	 * author : 임상우
	 * @param compNo
	 * @param compName
	 * @param originCompNo
	 * @param adminNo
	 * @return 수정된 행 수 
	 */
	public int companyUpdate(String compNo, String compName, String originCompNo, String adminNo) {
		
		Connection conn = getConnection();
		int result = cDao.companyUpdate(conn, compNo, compName, originCompNo, adminNo);
		
		if(result > 0) {
			commit(conn); 
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
		
	}
	
	/**
	 * 연계기업 삭제
	 * author : 임상우
	 * @param delComList
	 * @return
	 */
	public int companyDelete(String[] delComList) {
		
		Connection conn = getConnection();
		int result = cDao.companyDelete(conn, delComList);
		
		if(result > 0) {
			commit(conn); 
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
		
	}
	
	
}
