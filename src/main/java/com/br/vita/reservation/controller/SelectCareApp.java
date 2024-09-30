package com.br.vita.reservation.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.vita.common.model.vo.PageInfo;
import com.br.vita.doctor.model.service.DoctorService;
import com.br.vita.doctor.model.vo.Doctor;
import com.br.vita.member.model.service.MemberService;
import com.br.vita.reservation.model.service.ReservationService;

/**
 * Servlet implementation class SelectCareApp
 */
@WebServlet("/searchCA.admin")
public class SelectCareApp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectCareApp() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1. 요청
		// 요청시 '진료과', '의사명', '날짜'가 넘어온다.
		// care_app, member, doctor 테이블에서 화면에 뿌릴 데이터들을 조회한다. 
		
		String deptName = request.getParameter("dept_name");
		String docName = request.getParameter("doc_name");
		String appDate1 = request.getParameter("app_date1");
		String appDate2 = request.getParameter("app_date2");
		
		//System.out.println("시작일 : " + appDate1);
		//System.out.println("종료일 : " + appDate2);
		// System.out.println(deptName +","+ docName +","+ appDate1 + "," + appDate2);
		// List<Map<String, Object>> resultList = new ReservationService().selectCareApp(deptName, docName, appDate1, appDate2); <- 페이징 처리 이전

		
		
		
		// * 페이징 처리
        // * listCount   : 현재 게시글 총 갯수 (db로부터 조회)
        int listCount = new ReservationService().selectCareAppListCount(deptName, docName, appDate1, appDate2);
 
        // * currentPage : 사용자가 요청한 페이지 번호 (요청시 전달됨|전달된게 없으면 1로 간주)
        int currentPage = 1;
        if(request.getParameter("page") != null) {
            currentPage = Integer.parseInt(request.getParameter("page")); // 문자열이어서 parsing한다.
        }
 
        // * pageLimit   : 페이징바의 목록 수 (몇개 단위씩 보여지게 할건지)
        int pageLimit = 10;
 
        // * boardLimit  : 한 페이지에 보여질 게시글 수 (몇개 단위씩 보여지게 할건지)
        int boardLimit = 5;
        
        // 위의 4개를 가지고 사용자가 요청한 페이지 하단에 보여질
        // 페이징바의 시작수, 끝수, 가장마지막페이지수를 구해야됨
        
        
        int maxPage = (int)Math.ceil( (double)listCount / boardLimit );   // 가장 마지막 페이지 수 (즉, 총 페이지 수) + ceil은 소수점이 있으면 올림해서 소수점으로 반환함.
        int startPage = (currentPage - 1) / pageLimit * pageLimit + 1; // 사용자가 요청한 페이지 하단에 보여질 페이징바의 시작수
        int endPage = startPage + pageLimit - 1; // 사용자가 요청한 페이지 하단에 보여질 페이징바의 끝 수
        if(endPage > maxPage) {   // 단, 위의 과정으로 구해진 endPage가 maxPage보다 클 경우 수정
            endPage = maxPage;
        }
		
        // * 페이징바를 제작하기 위한 데이터 => PageInfo vo 객체
        PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
        // * 사용자가 요청한 페이지상에 필요한 게시글 데이터 조회 (전체 데이터가 아닌 일부 데이터만)
		List<Map<String, Object>> resultList = new ReservationService().selectCareApp(deptName, docName, appDate1, appDate2, pi);
		
		
		
		// 2. 응답
		// 응답 페이지 : 관리자 진료예약 관리 페이지 (/vita/views/admin/manageCareApp.jsp)
		// 응답 데이터 : db로부터 조회된 데이터(응답페이지에서만 필요)
		
		request.setAttribute("resultList", resultList);
		
		// flag 값(threeType)도 담아서 포워딩. 이 값에 따라 검색전/검색 후 결과없는 경우/검색 후 결과있는 경우로 다르게 보여진다.
		if(resultList.isEmpty()) { 
			request.setAttribute("threeType", false);
		} else {
			request.setAttribute("threeType", true);
		}
		
		
		// 의사명과 진료과를 줘야 select에서 고를 수 있다. 
		List<Doctor> list = new DoctorService().selectDoctorList();
		request.setAttribute("list", list);
		
		
        request.setAttribute("pi", pi);
		request.setAttribute("dept_name", deptName); // 검색 조건 유지 <- 페이징바에서 다른 페이지를 눌렀을 때도 JSP에서 이 값을 넘기면서 이 서블릿을 다시 호출해야 제대로 나온다.
		request.setAttribute("doc_name", docName);   // 검색 조건 유지
		request.setAttribute("app_date1", appDate1);  // 검색 조건 유지
		request.setAttribute("app_date2", appDate2);  // 검색 조건 유지
		
		
		request.getRequestDispatcher("/views/admin/manageCareApp.jsp").forward(request, response);
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
