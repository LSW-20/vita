package com.br.vita.issue.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.br.vita.issue.model.service.IssueService;
import com.br.vita.issue.model.vo.Document;
import com.br.vita.member.model.vo.Member;

/**
 * Servlet implementation class ConfirmAdmissionController
 */
@WebServlet("/confirm.cr")
public class DocumentConfirmController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DocumentConfirmController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * 회원진료정보-jsp연결 서블릿
	 * @author 최보겸
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String docType = request.getParameter("docType");
	    String careNo = request.getParameter("careNo");  // 사용자가 선택한 careNo 받아오기
  
        Document document = new IssueService().getDocumentByCareNo(careNo);
        request.setAttribute("documents", document);
        request.setAttribute("docType", docType);
		if(docType.equals("진료비납입확인서")) {
			request.getRequestDispatcher("/views/issue/confirmPayment.jsp").forward(request, response);						
		}else if(docType.equals("입퇴원사실확인서")) {
			request.getRequestDispatcher("/views/issue/confirmAdmission.jsp").forward(request, response);			
		}else {
			request.getRequestDispatcher("/views/issue/confirmPrescription.jsp").forward(request, response);						
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
