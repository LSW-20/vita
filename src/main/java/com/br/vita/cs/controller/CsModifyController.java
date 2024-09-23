package com.br.vita.cs.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.vita.cs.model.service.CsService;
import com.br.vita.cs.model.vo.Cs;

/**
 * Servlet implementation class CsModifyController
 */
@WebServlet("/modify.cs")
public class CsModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CsModifyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("no"));
		String category = request.getParameter("category");
		Cs c = new CsService().selectBoardByNo(boardNo);
		System.out.println(boardNo);
		System.out.println(category);
		
		if(c == null) {
			request.setAttribute("msg", "존재 하지 않는 게시글 입니다.");
			request.getRequestDispatcher("/views/common/errorPage.jsp");
		} else {
			//조회 된 게시글 데이터 request에 담아 jsp포워딩
			request.setAttribute("c", c);
			request.setAttribute("category", category);		
			request.getRequestDispatcher("/views/cs/csModify.jsp").forward(request, response);

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
