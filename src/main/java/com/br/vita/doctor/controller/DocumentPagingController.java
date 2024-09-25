package com.br.vita.doctor.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.vita.common.model.vo.PageInfo;
import com.br.vita.doctor.model.service.DoctorService;
import com.br.vita.member.model.vo.Member;

/**
 * Servlet implementation class DocumentPagingController
 */
@WebServlet("/dia_list.do")
public class DocumentPagingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DocumentPagingController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 
		
		String docNo = ((Member)request.getSession().getAttribute("loginUser")).getDoctorNo();
		String type = request.getParameter("type");
		
		int listCount = new DoctorService().selectDocumentListCount(docNo,type);	
		
		int currentPage = 1;											//사용자가 요청한 페이지 번호
		
		 
		
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		int pageLimit = 10;												//페이징바 목록 개수
		int boardLimit = 5;												//한페이지에 보일 게시글 수
		
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);	//총 페이지 수
		int startPage = (currentPage -1) / pageLimit * pageLimit+1;		//사용자요청 페이지 하단에 보여질 페이징바의 시작수
		int endPage = Math.min(startPage + pageLimit - 1, maxPage);//사용자요청 페이지 하단에 보여질 페이징바의 끝수
		
		
		//페이징바 제작 위한 데이터 vo생성해서 common에 배치
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		List<Member> doculist = new DoctorService().documentSelect(docNo,type,pi);
		
		
		
		
		request.setAttribute("pi", pi);
		request.setAttribute("doculist", doculist);
		
		if(type.equals("진단서")) {
			request.getRequestDispatcher("/views/doctor/diagnosis.jsp").forward(request, response); // 페이지로 포워딩
		}else if(type.equals("진료확인서")) {
			request.getRequestDispatcher("/views/doctor/mt_confirmation.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
