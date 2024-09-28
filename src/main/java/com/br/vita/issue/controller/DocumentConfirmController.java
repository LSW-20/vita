package com.br.vita.issue.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

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
		String userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
	    String payId = request.getParameter("imp_uid"); //payId
	    String payNo = request.getParameter("merchant_uid");//payNo
	    String docPurpose = request.getParameter("docPurpose");
	    	
		/*
		 * int result = new IssueService().insertDocument(careNo, userNo, docType,
		 * docPurpose); int payResult = new
		 * PaymentService().insertPayDocument(payNo,userNo,payId); 두 과정을 하나로 합치기
		 */
	    //매개변수 하나 Map에 담아 처리
	    Map<String, String> dpMap = new HashMap<>();
	    dpMap.put("docType", docType);
	    dpMap.put("careNo", careNo);
	    dpMap.put("userNo", userNo);
	    dpMap.put("payId", payId);
	    dpMap.put("payNo", payNo);
	    dpMap.put("docPurpose", docPurpose);
	    int result = new IssueService().insertDocumentWithPayment(dpMap);
	    System.out.println(careNo);
	    if(result > 0) {

		    	//결제 완료 후 문서 발급 완료 페이지로 이동
//		    	Document document = new IssueService().getDocumentByCareNo(careNo);
//		    	request.setAttribute("documents", document);
//		    	request.setAttribute("docType", docType);
		    	
		    	response.sendRedirect(request.getContextPath()+"/listSel.cr");
		    }    	
	    else {
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
