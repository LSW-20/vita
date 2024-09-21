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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//메뉴바 클릭시 /list.cs ->1번페이지 요청
		//목록 페이징바 클릭시 /list.cs?page=페이지번호 ->클릭한 페이지 요청
		int listCount = new CsService().selectBoardListCount();//listCount = 현재게시글 총 개수
		
		int currentPage = 1;//사용자가 요청한 페이지 번호
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		int pageLimit = 10;//페이징바 목록 개수
		int boardLimit = 5;//한페이지에 보일 개시글 수
		
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = (currentPage -1) / pageLimit * pageLimit+1;
		int endPage = startPage + pageLimit - 1;
		
		//endPage>maxPage 경우 처리
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		//페이징바 제작 위한 데이터 vo생성해서 common에 배치
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		//사용자 요청 페이지 상 필요한 게시글 데이터 조회
		List<Cs> csList = new CsService().selectBoardList(pi);
		
		//응답 페이지 : 일반 게시글 목록 /views/cs/csList.jsp
		//응답 데이터 : 페이징바 제작 할 데이터, 게시글 데이터
		request.setAttribute("pi", pi);
		request.setAttribute("csList", csList);

		request.getRequestDispatcher("/views/cs/csList.jsp").forward(request, response);
	}//doGet

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
