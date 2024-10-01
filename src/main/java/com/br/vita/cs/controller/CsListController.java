package com.br.vita.cs.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.vita.common.model.vo.PageInfo;
import com.br.vita.cs.model.service.CsService;
import com.br.vita.cs.model.vo.Cs;
import com.br.vita.member.model.vo.Member;

/**
 * Servlet implementation class CsListController
 */
@WebServlet("/list.cs")
public class CsListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CsListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * 고객의소리 페이징처리
	 * 리스트 DB에서 불러오기
	 * 카테고리 분류해서 띄우기
	 * author: 최보겸
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//카테고리 받아오기 NULL일경우 C로 가져오기 처리
		String category = request.getParameter("category") == null ? "C" : request.getParameter("category");
		
		
		//메뉴바 클릭시 /list.cs ->1번페이지 요청
		//목록 페이징바 클릭시 /list.cs?page=페이지번호 ->클릭한 페이지 요청
		int listCount = new CsService().selectBoardListCount(category);	//"카테고리에 따른" 현재 게시글 총 개수
		
		int currentPage = 1;											//사용자가 요청한 페이지 번호
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		int pageLimit = 10;												//페이징바 목록 개수
		int boardLimit = 5;												//한페이지에 보일 게시글 수
		
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);	//총 페이지 수
		int startPage = (currentPage -1) / pageLimit * pageLimit+1;		//사용자요청 페이지 하단에 보여질 페이징바의 시작수
		int endPage = Math.min(startPage + pageLimit - 1, maxPage);		//사용자요청 페이지 하단에 보여질 페이징바의 끝수
		
		//endPage>maxPage 경우 처리
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		//페이징바 제작 위한 데이터 vo생성해서 common에 배치
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		//"해당 카테고리의"
		//사용자 요청 페이지 상 필요한 게시글 데이터 조회
		List<Cs> csList = new CsService().selectBoardList(pi, category);
		
		//응답 페이지 : 일반 게시글 목록 /views/cs/csList.jsp
		//응답 데이터 : 페이징바 제작 할 데이터, 게시글 데이터
		request.setAttribute("pi", pi);
		request.setAttribute("csList", csList);
		request.setAttribute("category",category);

		Member loginUser = (Member) request.getSession().getAttribute("loginUser"); // 세션으로부터 현재 로그인한 Member 객체를 가져온다.
		
		if (loginUser == null) {
			// 로그인 하지 않았을 경우
			request.getRequestDispatcher("/views/cs/csListNoSideBar.jsp").forward(request, response);
		} else if(loginUser != null && "A".equals(loginUser.getUserType())) {
			// 로그인한 유저가 관리자(A)일 경우
			request.getRequestDispatcher("/views/cs/csListAdminSideBar.jsp").forward(request, response);
		} else {
		    // 그 외의 경우
		    request.getRequestDispatcher("/views/cs/csList.jsp").forward(request, response);
		}
		


	}//doGet

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
