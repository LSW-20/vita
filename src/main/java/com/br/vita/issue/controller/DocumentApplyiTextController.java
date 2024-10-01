package com.br.vita.issue.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.nio.charset.StandardCharsets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;

import com.br.vita.issue.model.service.IssueService;
import com.br.vita.issue.model.vo.Document;
import com.br.vita.member.model.vo.Member;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorkerFontProvider;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import com.itextpdf.tool.xml.html.CssAppliersImpl;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipelineContext;


/**
 * Servlet implementation class DocumentApplyiTextController
 */
@WebServlet("/getDoc.cr")
public class DocumentApplyiTextController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DocumentApplyiTextController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      
        // 세션에서 로그인 사용자 정보를 가져온다.
        HttpSession session = request.getSession();
        Member loginUser = (Member) session.getAttribute("loginUser");

        // 요청 파라미터에서 careNo와 docType을 받아온다.
        String careNo = request.getParameter("careNo");
        String docType = request.getParameter("docType");

        System.out.println(docType);
        // 서비스 객체를 통해 문서 데이터를 가져온다.
        IssueService issueService = new IssueService();
        Document document = issueService.getDocumentByCareNo(careNo);

        // JSP에 데이터를 전달하기 위해 request 객체에 속성으로 추가
        request.setAttribute("loginUser", loginUser);
        request.setAttribute("documents", document);

        // docType에 따라 다른 JSP로 이동
        String jspPage;
        if ("입퇴원사실확인서".equals(docType)) {
            jspPage = "/views/issue/confirmAdmission.jsp";
        } else if ("진료비납입확인서".equals(docType)) {
            jspPage = "/views/issue/confirmPayment.jsp";
        } else if ("처방전사본".equals(docType)) {
            jspPage = "/views/issue/confirmPrescription.jsp";
        } else {
        	
        	throw new ServletException("알 수 없는 문서 타입입니다." + docType);
        }
           
      
        // JSP를 String으로 렌더링 (HTML 출력)
        StringWriter stringWriter = new StringWriter();
        RequestDispatcher rd = request.getRequestDispatcher(jspPage);
        
        HttpServletResponseWrapper responseWrapper = new HttpServletResponseWrapper(response) {
            private final PrintWriter writer = new PrintWriter(stringWriter);

            @Override
            public PrintWriter getWriter() {
                return writer;
            }
        };

		rd.include(request, responseWrapper); // JSP 페이지를 렌더링

		// JSP로부터 생성된 HTML을 Jsoup으로 파싱
		org.jsoup.nodes.Document jsoupDoc = Jsoup.parse(stringWriter.toString());

		// PDF로 변환할 HTML 내용
		String htmlContent = jsoupDoc.html().replace("<br>", "<br />");

		// PDF 변환을 위한 응답 헤더 설정
		response.setContentType("application/pdf");
		response.setHeader("Content-Disposition", "attachment; filename=document.pdf");

		// PDF 변환 및 응답 출력
		try (OutputStream out = response.getOutputStream()) {
			com.itextpdf.text.Document pdfDoc = new com.itextpdf.text.Document(PageSize.A4, 10, 10, 10, 10);
			PdfWriter writer = PdfWriter.getInstance(pdfDoc, out);
			pdfDoc.open();

			// HTML -> PDF 변환 
			//HTML , CSS 데이터를 메모리 상에서 바로 PDF로 변환하기 위해 사용
			ByteArrayInputStream htmlStream = new ByteArrayInputStream(htmlContent.getBytes(StandardCharsets.UTF_8));

			// 한글 폰트 설정
			XMLWorkerFontProvider fontProvider = new XMLWorkerFontProvider(XMLWorkerFontProvider.DONTLOOKFORFONTS);
			fontProvider.register("c:/windows/fonts/malgun.ttf", "MalgunGothic"); // 한글 폰트 경로 지정

			// CSS 설정
			String css = "body { font-family: 'MalgunGothic'; }"; // 한글 지원을 위한 폰트 설정
			ByteArrayInputStream cssStream = new ByteArrayInputStream(css.getBytes(StandardCharsets.UTF_8));

			// HTML과 CSS를 PDF로 변환
			XMLWorkerHelper.getInstance().parseXHtml(writer, pdfDoc, htmlStream, cssStream, StandardCharsets.UTF_8, fontProvider);

			pdfDoc.close();
		} catch (DocumentException e) {
			e.printStackTrace();
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
