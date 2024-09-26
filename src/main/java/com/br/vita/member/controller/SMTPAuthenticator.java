package com.br.vita.member.controller;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator extends Authenticator {
    private String mail_id = "wodns1236@naver.com";
    private String mail_pw = "VU58YG1PZV4R";

    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(mail_id, mail_pw);
    }

    public String getMailId() {
        return mail_id;
    }
}