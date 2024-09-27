<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.br.vita.member.model.vo.Member" %>
<%@ page import="com.br.vita.issue.model.vo.Document" %>
<%@ page import="java.util.*" %>
<%@ page import="com.br.vita.doctor.model.vo.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>진료비 납입 확인서</title>
<% 
   String contextPath = request.getContextPath();
   Member loginUser = (Member)session.getAttribute("loginUser");
   Document documents = (Document)request.getAttribute("documents");
%>
</head>
<body>

<!-- 진료비 납입 확인서 -->
<div style="width: 100%; max-width: 800px; margin: 0 auto;">
    <h1 style="text-align: center; font-size: 24px;">진료비 납입 확인서</h1>

    <table border="1" cellspacing="0" cellpadding="10" style="width: 100%; border-collapse: collapse; margin-top: 20px; font-size: 14px;">
        <tr>
            <td style="width: 20%;"><b>발급번호</b></td>
            <td style="width: 80%;"><%= documents.getDocNum() %></td>
        </tr>
        <tr>
            <td><b>환자의 성명</b></td>
            <td><%= loginUser.getUserName() %></td>
        </tr>
        <tr>
            <td><b>병원등록번호</b></td>
            <td><%= loginUser.getUserNo() %></td>
        </tr>
        <tr>
            <td><b>주민등록번호</b></td>
            <td><%= loginUser.getUserSSN() %></td>
        </tr>
        <tr>
            <td><b>환자의 주소</b></td>
            <td><%= loginUser.getAddress() %></td>
        </tr>
        <tr>
            <td><b>진료과</b></td>
            <td><%= documents.getDeptName() %></td>
        </tr>
        <tr>
            <td><b>발급용도</b></td>
            <td><%= documents.getDocPurpose() %></td>
        </tr>
        <tr>
            <td><b>납입확인</b></td>
            <td style="text-align: left;">
                <b><%= loginUser.getUserName() %>님의 진료비 납입이 확인되었습니다.</b><br />
                1월: 납입 완료 <br />
                2월: 납입 완료 <br />
                3월: 납입 완료 <br />
                4월: 납입 완료 <br />
                5월: 납입 완료 <br />
                6월: 납입 완료 <br />
                7월: 납입 완료 <br />
                8월: 납입 완료 <br />
                9월: 납입 완료 <br />
                10월: 납입 완료 <br />
                11월: 납입 완료 <br />
                12월: 납입 완료
            </td>
        </tr>
    </table>
</div>

<div style="margin-top: 20px; width: 100%; max-width: 800px; margin: 0 auto;">
    <p>[의료법] 제 17 조 및 같은 법 시행규칙 제9조1항에 따라 납입 사실을 위와 같이 확인합니다.</p>
    <p>발급일: <%= documents.getApplyDate() %></p>
    <p>의료기관 명칭: <b>VitaPrimus</b></p>
    
    <p>
        주소: 서울특별시 금천구 가산디지털2로 95 KM타워 3층 305호 <br />
        [ ■ ] 의사 면허 <%= documents.getLicenceNo() %> 호
    </p>
    
    <p>담당의: <b><%= documents.getDoctorName() %></b></p>
</div>

</body>
</html>
