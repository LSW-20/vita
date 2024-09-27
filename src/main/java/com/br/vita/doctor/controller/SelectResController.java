package com.br.vita.doctor.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.br.vita.doctor.model.service.DoctorService;
import com.br.vita.member.model.vo.Member;
import com.google.gson.Gson;

@WebServlet("/listRes.se")
public class SelectResController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public SelectResController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	String docNo = ((Member)request.getSession().getAttribute("loginUser")).getDoctorNo();
    	
        List<Map<String, Object>> relist = new DoctorService().selectRes(docNo);

        // 변환된 결과 리스트
        for (Map<String, Object> map : relist) {
            String originalDate = (String) map.get("userDate"); // "801010" 형식의 데이터
            
            if (originalDate != null && originalDate.length() == 6) {
                String formattedDate = formatDate(originalDate);
                map.put("userDate", formattedDate); // 변환된 데이터로 교체
            }
        }

        response.setContentType("application/json; charset=UTF-8");
        new Gson().toJson(relist, response.getWriter());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    // 801010 형식을 80/10/10으로 변환하는 메서드
    private String formatDate(String date) {
        return date.substring(0, 2) + "/" + date.substring(2, 4) + "/" + date.substring(4, 6);
    }
}