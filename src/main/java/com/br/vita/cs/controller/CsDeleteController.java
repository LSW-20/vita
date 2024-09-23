package com.br.vita.cs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.vita.cs.model.service.CsService;

/**
 * Servlet implementation class CsDeleteController
 */
@WebServlet("/delete.cs")
public class CsDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CsDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @author 최보겸
	 * 게시글 삭제 요청 서블릿
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 글번호 넘기기 요청
		request.setCharacterEncoding("UTF-8");
		int boardNo = Integer.parseInt(request.getParameter("no"));
		int result = new CsService().deleteCs(boardNo);
		
		//응답
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "게시글이 삭제 되었습니다.");
			response.sendRedirect(request.getContextPath()+"/list.cs");
		} else {
			request.setAttribute("msg", "삭제 실패");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
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
