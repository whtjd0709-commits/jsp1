import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;

public class CheckLogin extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletRequest resp) throws ServletException, IOException{}
     
    
    
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");

    if(id.equals("abc1234")){
        if(pw.equals("asd123")){
            response.sendRedirect("login_welcome.jsp");
        }else{
            response.sendRedirect("login_pw_fail.jsp");
        }
    }else{
        response.sendRedirect("login_id_fail.jsp");
    }
}
