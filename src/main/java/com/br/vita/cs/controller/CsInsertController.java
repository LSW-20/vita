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
 * Servlet implementation class CsInsertController
 */
@WebServlet("/insert.cs")
public class CsInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CsInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * 게시글 작성 insert요청
	 * @author 최보겸
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8"); 

        String category = request.getParameter("category");
		String boardTitle = request.getParameter("title");
		String boardContent = request.getParameter("content");
		String cEmp = request.getParameter("cEmp");
		String cDept = request.getParameter("cDept");
		
		HttpSession session = request.getSession();
		String userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		Cs c = new Cs(userNo,boardTitle,boardContent,category,cEmp,cDept);
		int result = new CsService().insertCs(c);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "게시글을 등록했습니다.");
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
