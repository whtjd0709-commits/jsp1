import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/*
서블릿의 특징
1. 동적 웹 어플리케이션 컴포넌트(순수 자바 코드 사용)
2. 확장자가 .java
3. 클라이언트의 요청에 동적으로 동작하고, 응답은 html을 이용.
4. java thread를 이용해서 동작하게 됨. 
5. MVC 패턴에서 Controller의 역할을 함. 
*/

@WebServlet("/gugudan.do")
public class GugudanServlet extends HttpServlet {

    // GET방식으로 들어로 경우 처리하는 메서드
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("GET 방식으로 접근!!");
        // 기능 구현.... gugudan

        // getParameter() 메서드는 request에 있는 파라미터값을 읽어들이는 메서드. 인자로 파라미터 이름을 지정
        // ~~~/gugudan.do?dan=7
        String danStr = req.getParameter("dan"); // 7이라는 문자열을 넘김.
        // 3항 연산을 이용해서 dan 값이 없거나 비어 있는 경우에는 2로 처리. 이외에는 그 해당 단으로 처리
        int dan = (danStr == null | danStr.isEmpty()) ? 2 : Integer.parseInt(danStr);

        List<String> list = new ArrayList<>();
        for (int i = 1; i <= 9; i++) {
            list.add(dan + "*" + i + "=" + (dan * i));
        }

        // HttpServletRequest.setAttribute("파라미터이름", 값)
        // setAttribute는 Attribute 객체에 값을 설정해주는 메서드.(강제 설정)
        req.setAttribute("dan", dan);
        req.setAttribute("results", list);
        // 포워드 기능
        // RequestDispatcher라는 객체(인터페이스)를 통해서 매개변수로 지정된 위치로 전달하는 역할을 함.
        // forward(req, resp)을 실행.
        req.getRequestDispatcher("/WEB-INF/views/gugudan.jsp").forward(req, resp);

    }

    // POST 방식으로 들어오는 경우 처리하는 메서드
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("Post방식으로 접근할 때 동작하는 메서드");
        super.doPost(req, resp);
    }

    @Override
    public void destroy() {
        // 서블릿 종료시 작업
        super.destroy();
    }

    @Override
    public void init() throws ServletException {
        // 서블릿 초기화 작업
        super.init();
    }

}
