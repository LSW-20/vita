package com.br.vita.cs.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.vita.cs.model.service.CsService;

/**
 * Servlet implementation class AdminQnaReplyInsert
 */
@WebServlet("/addAdmQNA.admin")
public class AdminQnaReplyInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminQnaReplyInsert() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 1.요청
		// 요청시 게시글 번호가 넘어온다. 게시글 번호를 조건으로 TAB_CS 테이블에서 해당 행의 ANSWER_CONTENT (답변 내용)을 지운다.
		
		request.setCharacterEncoding("UTF-8");  // post 방식이다.
    	HttpSession session = request.getSession(); // alert 띄우기용 session 선언.

		String boardNo = request.getParameter("board_no");
		String replyContent = request.getParameter("reply_content");
		
		int result = new CsService().replyInsert(boardNo, replyContent);
		
		
		
		
		// 2.응답
        if(result > 0) { 
        	// insert 성공
    		// 응답페이지 : 답변을 작성한 해당 고객의소리 상세페이지 ((/vita/views/cs/csDetail_상우.jsp)
    		// 응답데이터 : "답변이 작성되었습니다." alert 메세지
            session.setAttribute("alertMsg", "답변이 작성되었습니다.");
            response.sendRedirect(request.getContextPath() + "/detail.cs?no=" + boardNo + "&category=Q");
            												
        }else { 
        	// insert 실패
    		// 응답페이지 : 에러페이지 ((/vita/views/common/errorPage.jsp)
    		// 응답데이터 : "답변 작성에 실패하였습니다." alert 메세지
            session.setAttribute("alertMsg", "답변 작성에 실패하였습니다.");
			request.setAttribute("msg", "Q&A 답변 작성에 실패하였습니다.");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
        }
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
