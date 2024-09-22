package com.br.vita.cs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.vita.member.model.vo.Member;

/**
 * Servlet implementation class CsWriteController
 */
@WebServlet("/write.cs")
public class CsWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CsWriteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * 고객의소리 게시글 작성 페이지 요청
	 * @author 최보겸
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category") == null ? "C" : request.getParameter("category");
		
		request.setAttribute("category", category);
		request.getRequestDispatcher("/views/cs/csWrite.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
