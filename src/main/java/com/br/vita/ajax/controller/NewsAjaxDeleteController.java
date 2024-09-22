package com.br.vita.ajax.controller;

import static com.br.vita.common.template.JDBCTemplate.getConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;

@WebServlet("/news.dt")
public class NewsAjaxDeleteController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // JSON 데이터를 파싱하여 ID 목록을 가져옴
        Gson gson = new Gson();
        IdsToDelete idsToDelete = gson.fromJson(request.getReader(), IdsToDelete.class);

        // 데이터베이스 연결 및 업데이트
        try (Connection conn = getConnection()) {
            String sql = "UPDATE NEWS SET STATUS = 'N' WHERE NEWS_NO = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                for (String id : idsToDelete.getIds()) {
                    pstmt.setString(1, id);
                    pstmt.executeUpdate();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            return;
        }

        response.setStatus(HttpServletResponse.SC_OK);
    }

    private class IdsToDelete {
        private List<String> ids;

        public List<String> getIds() {
            return ids;
        }

        public void setIds(List<String> ids) {
            this.ids = ids;
        }
    }
}