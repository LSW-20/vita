<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="com.br.vita.member.controller.SMTPAuthenticator"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

request.setCharacterEncoding("utf-8");

String from = request.getParameter("from");
String email = request.getParameter("email");
String subject = request.getParameter("subject");
String content = request.getParameter("content");

Properties props = new Properties();
props.put("mail.smtp.host", "smtp.naver.com");
props.put("mail.smtp.port", "465");
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.ssl.enable", "true");
props.put("mail.smtp.ssl.trust", "smtp.naver.com");
props.put("mail.smtp.ssl.protocols", "TLSv1.2");
props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
props.put("mail.smtp.socketFactory.fallback", "false");

try {
    Authenticator auth = new SMTPAuthenticator();
    Session ses = Session.getInstance(props, auth);
    ses.setDebug(true);

    MimeMessage msg = new MimeMessage(ses);
    msg.setSubject(subject);

    Address fromAddr = new InternetAddress(from);
    msg.setFrom(fromAddr);

    Address toAddr = new InternetAddress(email);
    msg.addRecipient(Message.RecipientType.TO, toAddr);

    msg.setContent(content, "text/html;charset=UTF-8");

    Transport.send(msg);
    out.println("<script>alert('메일 전송 성공!');history.back();</script>");
} catch (Exception e) {
    e.printStackTrace();
    out.println("<script>alert('메일 전송 실패..');history.back();</script>");
}
%>