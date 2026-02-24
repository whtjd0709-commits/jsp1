import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// 서블릿 구분방법 : URL-Mapping
// 1. WebServlet()을 이용한 URL 맵핑 
//   C:\JAVAPROJECTS\jsp\demo\src\main\java\TestServlet.java
//   지금 현재 톰갯에서 웹에 접근경로는 demo/src/main/webapp
//   test.do 라는 url주로 묶었습니다.(맵핑)
@WebServlet("/test.do")
public class TestServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html; charset=UTF-8");

        PrintWriter out = resp.getWriter();
        out.println("<body>");
        out.println("이렇게 동작하는게 서블릿입니다.!!!!");
        out.println("</body>");

    }

}
