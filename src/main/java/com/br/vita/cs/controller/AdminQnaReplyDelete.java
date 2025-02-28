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
 * Servlet implementation class AdminQnaReplyDelete
 */
@WebServlet("/deleteAdmQNA.admin")
public class AdminQnaReplyDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminQnaReplyDelete() {
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
		
		int result = new CsService().replyDelete(boardNo);
		
		
		
		// 2. 응답
        if(result > 0) { 
        	// delete 성공
    		// 응답페이지 : 답변을 삭제한 해당 고객의소리 상세페이지 ((/vita/views/cs/csDetail_상우.jsp)
    		// 응답데이터 : "답변이 삭제되었습니다." alert 메세지
            session.setAttribute("alertMsg", "답변이 삭제되었습니다.");
            response.sendRedirect(request.getContextPath() + "/detail.cs?no=" + boardNo + "&category=Q");
            												
        }else { 
        	// delete 실패
    		// 응답페이지 : 에러페이지 ((/vita/views/common/errorPage.jsp)
    		// 응답데이터 : "답변 삭제에 실패하였습니다." alert 메세지
            session.setAttribute("alertMsg", "답변 삭제에 실패하였습니다.");
			request.setAttribute("msg", "Q&A 답변 삭제에 실패하였습니다.");
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
