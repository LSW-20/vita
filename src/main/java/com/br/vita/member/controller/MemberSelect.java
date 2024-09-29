package com.br.vita.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.vita.common.model.vo.PageInfo;
import com.br.vita.member.model.service.MemberService;
import com.br.vita.member.model.vo.Member;

/**
 * Servlet implementation class MemberSelect
 */
@WebServlet("/searchMem.admin")
public class MemberSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSelect() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		// 1. 요청
		// 회원 이름, 회원 아이디를 요청으로 받아온다. db에 해당 회원 이름과 아이디, pi로 select 후 결과를 가져온다.
		
		String userName = request.getParameter("user_name");
		String userId = request.getParameter("user_id");
	
		// List<Member> list = new MemberService().selectMember(userName, userId); <- 페이징 처리 안하는 경우

		
		
		
		// * 페이징 처리
        // * listCount   : 현재 게시글 총 갯수 (db로부터 조회)
        int listCount = new MemberService().selectMemberListCount(userId, userName);
 
        // * currentPage : 사용자가 요청한 페이지 번호 (요청시 전달됨|전달된게 없으면 1로 간주)
        int currentPage = 1;
        if(request.getParameter("page") != null) {
            currentPage = Integer.parseInt(request.getParameter("page")); // 문자열이어서 parsing한다.
        }
 
        // * pageLimit   : 페이징바의 목록 수 (몇개 단위씩 보여지게 할건지)
        int pageLimit = 10;
 
        // * boardLimit  : 한 페이지에 보여질 게시글 수 (몇개 단위씩 보여지게 할건지)
        int boardLimit = 10;
        
        // 위의 4개를 가지고 사용자가 요청한 페이지 하단에 보여질
        // 페이징바의 시작수, 끝수, 가장마지막페이지수를 구해야됨
        
        
        int maxPage = (int)Math.ceil( (double)listCount / boardLimit );   // 가장 마지막 페이지 수 (즉, 총 페이지 수) + ceil은 소수점이 있으면 올림해서 소수점으로 반환함.
        int startPage = (currentPage - 1) / pageLimit * pageLimit + 1; // 사용자가 요청한 페이지 하단에 보여질 페이징바의 시작수
        int endPage = startPage + pageLimit - 1; // 사용자가 요청한 페이지 하단에 보여질 페이징바의 끝 수
        if(endPage > maxPage) {   // 단, 위의 과정으로 구해진 endPage가 maxPage보다 클 경우 수정
            endPage = maxPage;
        }
		
        // * 페이징바를 제작하기 위한 데이터 => PageInfo vo 객체
        PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
        // * 사용자가 요청한 페이지상에 필요한 게시글 데이터 조회 (전체 데이터가 아닌 일부 데이터만)
        List<Member> list = new MemberService().selectMember(userName, userId, pi);
        
        
		
		// 2. 응답
		// 응답페이지 : 관리자 회원 계정 관리 페이지(/vita/views/admin/manageMember.jsp)
		// 응답데이터 : db로부터 조회된 데이터(응답페이지에서만 필요), 페이징바 제작할 데이터
        
        request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("user_name", userName); // 검색 조건 유지
		request.setAttribute("user_id", userId);    // 검색 조건 유지
		request.getRequestDispatcher("/views/admin/manageMember.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
