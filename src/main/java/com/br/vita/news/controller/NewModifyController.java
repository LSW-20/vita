package com.br.vita.news.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.vita.news.model.service.NewsService;
import com.br.vita.news.model.vo.News;

/**
 * Servlet implementation class NewModifyController
 */
@WebServlet("/modify.ns")
public class NewModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewModifyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int newsNo = Integer.parseInt(request.getParameter("no"));
		
		NewsService nService = new NewsService();
		Map<String, Object> nmap = nService.selectNewsByNo(newsNo);
		
		// 응답페이지 : 수정페이지 (/views/board/boardModify.jsp)
		// 응답데이터 : 카테고리목록, 게시글데이터, 첨부파일데이터 
		
		if(nmap.get("n") == null) {
			request.setAttribute("msg", "존재하지 않는 게시글이거나 삭제된 게시글입니다.");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}else {
			request.setAttribute("nmap", nmap);
			request.getRequestDispatcher("/views/news/newsModify.jsp").forward(request, response);
			System.out.println("nmap: " + nmap);
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
