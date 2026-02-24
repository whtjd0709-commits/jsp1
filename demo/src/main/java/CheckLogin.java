import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/checklogin.do")
public class CheckLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 한글 설정을 할 경우
        req.setCharacterEncoding("utf-8");

        // 1. parameter로 전달되어진 id, pw을 받기.
        String id = req.getParameter("id");
        String pw = req.getParameter("pw");

        // 2. id와 pw 검증 처리 작업.
        if (id.equals("abc1234")) {
            if (pw.equals("asd123")) {
                // 로그인 성공
                // response 객체를 이용해서 리다이렉트 처리.
                // response 객체 sendRedirect()을 사용.
                resp.sendRedirect("response/login_welcome.jsp");
            } else {
                // 패스워드 틀림!
                resp.sendRedirect("response/login_pw_fail.jsp");
            }
        } else {
            // 아이디 틀림!
            resp.sendRedirect("response/login_id_fail.jsp");
        }
    }

}
