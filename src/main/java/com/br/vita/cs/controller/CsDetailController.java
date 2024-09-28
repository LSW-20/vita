package com.br.vita.cs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.vita.cs.model.service.CsService;
import com.br.vita.cs.model.vo.Cs;
import com.br.vita.member.model.vo.Member;

/**
 * Servlet implementation class CsDetailController
 */
@WebServlet("/detail.cs")
public class CsDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CsDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * 게시글 상세 보기 요청 처리
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int boardNo = Integer.parseInt(request.getParameter("no"));
		String category = request.getParameter("category");
		
		//해당 게시글 번호 게시글 조회
		Cs board = new CsService().selectBoardByNo(boardNo);
		
		//조회 된 게시글 데이터 request에 담아 jsp포워딩
		request.setAttribute("board", board);
		request.setAttribute("category", category);
		
		//상세페이지 이동
		//request.getRequestDispatcher("/views/cs/csDetail_상우.jsp").forward(request, response); <- 기존에 작성되어 있던 구문 (주석 작성자 : 상우)
		
		
		Member loginUser = (Member) request.getSession().getAttribute("loginUser"); // 세션으로부터 현재 로그인한 Member 객체를 가져온다.
		
		if (loginUser == null) {
			//로그인 하지 않았을 경우 사이드바 없는 화면으로
			request.getRequestDispatcher("/views/cs/csDetailNoSideBar.jsp").forward(request, response);
		} else if(loginUser != null && "A".equals(loginUser.getUserType())){
			// 로그인한 유저가 관리자(A)일 경우
			request.getRequestDispatcher("/views/cs/csDetailAdminSideBar.jsp").forward(request, response);
		}else {
		    // 그 외의 경우
		    request.getRequestDispatcher("/views/cs/csDetail_상우.jsp").forward(request, response);
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
