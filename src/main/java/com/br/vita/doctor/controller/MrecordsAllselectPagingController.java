package com.br.vita.doctor.controller;

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
import com.itextpdf.text.log.SysoCounter;

/**
 * Servlet implementation class MrecordsAllselectPagingController
 */
@WebServlet("/selectMrecords.se")
public class MrecordsAllselectPagingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MrecordsAllselectPagingController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String userName = request.getParameter("userName");
        String deptName = request.getParameter("deptName");
        String date1 = request.getParameter("date1");
        String date2 = request.getParameter("date2");

        System.out.println(deptName);
        System.out.println(userName);
        System.out.println(date1);
        System.out.println(date2);
        

        int listCount = new DoctorService().selectAllmrecordsCount(userName, deptName, date1, date2);    

        int currentPage = 1; // 기본값 설정
        String pageParam = request.getParameter("page");
        
        if (pageParam != null) {
                currentPage = Integer.parseInt(pageParam.trim()); // 공백 제거 후 변환
        }

        int pageLimit = 10; // 페이징바 목록 개수
        int boardLimit = 6; // 한 페이지에 보일 게시글 수

        int maxPage = (int)Math.ceil((double)listCount / boardLimit); // 총 페이지 수
        int startPage = (currentPage - 1) / pageLimit * pageLimit + 1; // 페이징바 시작수
        int endPage = Math.min(startPage + pageLimit - 1, maxPage); // 페이징바 끝수

        // PageInfo 객체 생성
        PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
        
        System.out.println(pi);
        
        List<Map<String,Object>> mrcList = new DoctorService().selectAllmrecords(userName, deptName, date1, date2, pi);
        
        request.setAttribute("pi", pi);
        request.setAttribute("mrcList", mrcList);
        
        // 포워드 사용
        request.getRequestDispatcher("/views/doctor/m_records.jsp").forward(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
