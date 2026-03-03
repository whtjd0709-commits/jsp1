package com.example.ui.tabs;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class TabServlet extends HttpServlet{
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");

        if(type == null) type= "info"; //기본값 설정
        //각 탭별 필요한 데이터 세팅 후 전달...
        switch (type) {
            case "info":
                req.setAttribute("serverTime", LocalDateTime.now());
                req.setAttribute("version", "Jakarta EE 11 / HTMX 2.0");
                break;
            
            case "settings":
                req.setAttribute("notifications", true);
                req.setAttribute("theme", "Dark Mode");
                break;

            case "logs":
                req.setAttribute("logs", List.of(
                    "17:19:22 - 사용자 로그인 성공",
                    "17:25:55 - 데이터베이스 백업 완료",
                    "17:26:24 - 시스템 리소스 경고(CPU : 90%와 Memory 99%)"));
                break;
        }
        //해당 타입의 jsp 조건으로 이동
        String fragmentPath = "/WEB-INF/fragments/tabs/"+type+".jsp";
        req.getRequestDispatcher(fragmentPath).forward(req,resp);
    }
}
