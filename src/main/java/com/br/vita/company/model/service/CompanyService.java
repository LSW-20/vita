package com.br.vita.company.model.service;

import static com.br.vita.common.template.JDBCTemplate.close;
import static com.br.vita.common.template.JDBCTemplate.getConnection;

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
	
}
