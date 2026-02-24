<%
    /*
    login.jsp 에서 전달받은 값을 처리...
    // utf-8 인코딩(한글 사용시)
    request.setCharatorEncoding('utf-8')

    <가정>
    id : adc1234
    pw : asd123
    id와 pw가 위와 같다면 로그인 성공으로 간주....
    성공시 login_welcome페이지로 이동.
    
    실패시
    1. id가 틀린경우, login_id_fail 페이지로 이동 
    2. pw가 틀린경우, login_pw_fail 페이지로 이동
    */


    String id = request.getParameter("id");
    String pw = request.getParameter("pw");

    if(id.equals("abc1234")){
        if(pw.equals("asd123")){
            response.sendRedirect("loing_welcome.jsp");
        }else{
            response.sendRedirect("loing_pw_fail.jsp");
        }
    }else{
        response.sendRedirect("loing_id_fail.jsp");
    }