package com.br.vita.cs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.vita.cs.model.service.CsService;
import com.br.vita.cs.model.vo.Cs;
import com.br.vita.member.model.vo.Member;

/**
 * Servlet implementation class CsUpdateController
 */
@WebServlet("/update.cs")
public class CsUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CsUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * 게시글 수정 요청
	 * @author 최보겸
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8"); 

        int boardNo = Integer.parseInt(request.getParameter("no"));
		String category = request.getParameter("category");
		String boardTitle = request.getParameter("title");
		String boardContent = request.getParameter("content");
		String cEmp = request.getParameter("cEmp");
		String cDept = request.getParameter("cDept");

		Cs c = new Cs();
		c.setCategory(category);
		c.setBoardTitle(boardTitle);
		c.setBoardContent(boardContent);
		c.setcEmp(cEmp);
		c.setcDept(cDept);
		
		System.out.println(c);
		int result = new CsService().updateCs(c, boardNo);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "게시글 수정을 완료 하였습니다.");
			response.sendRedirect(request.getContextPath()+"/list.cs");
		} else {
			request.setAttribute("msg", "게시글 등록을 실패 했습니다.");
			request.getRequestDispatcher("/views/common/errorPage.jsp");
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
