package com.br.vita.news.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.vita.news.model.service.NewsService;
import com.br.vita.news.model.vo.News;

/**
 * Servlet implementation class NewUpdateController
 */
@WebServlet("/newsUpdate.admin")
public class NewUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. 요청
		request.setCharacterEncoding("UTF-8");
		
		News n = new News();
		n.setNewsTitle(request.getParameter("title"));
		n.setNewsContent(request.getParameter("content"));
		n.setNewsNo(Integer.parseInt(request.getParameter("no")));
		
		int result = new NewsService().updateNews(n);
		
		// 2. 응답
		if(result > 0) { // 성공
			// 응답페이지 : 다시 목록페이지
			//     데이터 : "성공적으로 공지사항이 수정되었습니다" alert메세지
			request.getSession().setAttribute("alertMsg", "성공적으로 공지사항이 수정되었습니다.");
			response.sendRedirect(request.getContextPath() + "/list.ns");
			
		}else { // 실패
			// 응답페이지 : 에러페이지
			//     데이터 : "공지사항 변경 실패" 메세지
			request.setAttribute("msg", "게시글 수정 실패");
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
