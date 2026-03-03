package com.tjoeun.controller;

import java.io.IOException;
import java.util.List;

import com.tjoeun.entity.User;
import com.tjoeun.service.UserService;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/users")
public class UserServlet extends HttpServlet {

    // DI - 의존성 주입
    @Inject
    private UserService userService;

    // GET방식으로 들어오는 경우 - user-list.jsp(view)를 보여주는 역할을 함.
    // user-list.jsp는 1. 전체 사용자 노출, 2. 사용자 추가(post), 3. 삭제
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // user-list.jsp를 노출
        // [ 3단계 - 특정 사용자 삭제 ]
        // 1. request 객체에 특정 동작을 지사하는 파라미터 값을 추가해서 확인. (action)
        String action = req.getParameter("action");
        // 2. action 파라미터 값이 있으면, 그 액션의 값을 확인. 삭제는 'delete' 값을 확인
        if ("delete".equals(action)) {
            // 3. delete라면, 삭제 동작을 처리(id값 처리해서 얻어야 합니다.)
            userService.removeUser(Long.parseLong(req.getParameter("id")));
        }

        // [ 1단계 - 전체 사용자 노출 ]
        // 1. 전체 사용자 정보 읽어오기
        List<User> userList = userService.getAllUsers();
        // 2. req(request 객체)에 전체 사용자 정보를 저장
        req.setAttribute("userList", userList);
        // 3. 포워드 설정
        req.getRequestDispatcher("/WEB-INF/views/user-list.jsp").forward(req, resp);
    }

    // POST방식으로 들어오는 경우 - Form 태그를 사용한 사용자 정보 입력 받았다는 의미
    // User 생성 작업 진행 후 view 노출
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // [ 2단계 - 사용자 추가 ]
        // 1. 사용자 정보 얻기
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        // 2. 사용자 등록 작업
        userService.register(username, email);
        // 3. 다시 user-list.jsp 이동
        resp.sendRedirect("users"); // sendRedirect에 전달하는 매개변수는 URI주소(**절대, 상대 주소 주의)
    }

}
