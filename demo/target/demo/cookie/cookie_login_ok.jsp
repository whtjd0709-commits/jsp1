<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    /*
    1. cookie_login.jsp로 넘어온 아이디, 비밀번호을 받아 처리
    2. id =abc 이고, pw=1234 라면 로그인 성공으로 간주, 
       로그인 성공시, 쿠키 생성 - ("user_id", id) 값을 가지는 쿠키
    3. 쿠키 문법을 사용하고 쿠키를 전송
 
    4. 만약 아이디, 비밀번호가 틀렸다면, cookie_login.jsp로 이동

    5. 로그인 성공했을 경우에는 cookie_welcome.jsp로 이동했을 경우 
      "id님 환영합니다."  출력되게 합니다.(id는 실제 id -> abc 님 확영합니다.)
      쿠키를 사용해서 표시되게 해주세요. 

    6. cookie_login.jsp에는 user_id 쿠키가 있는 경우에 로그인 아이디 입력 부분에 
       cookie에 있는 user_id값이 나오게 해주세요. 
       idCheck 박스를 표시한 경우에는 역시 쿠키를 생성해서 추가해야 합니다.
       "idCheck"로 생성해서 확인후에 user_id가 아이디 부분에 표시되어야 합니다. 
    */
    // 1. 아이디, 비밀번호 받기
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    // 6. idCheck 값 받기
    String idCheck = request.getParameter("idCheck");

    // 2. 로그인 로직
    if (id.equals("abc") && pw.equals("1234")) {  // 로그인 성공!
        // 3. 쿠키 생성
        Cookie user_id = new Cookie("user_id", id);
        user_id.setMaxAge(30); // 30s
        response.addCookie(user_id);

        // 6. idCheck에 id값을 저장. 
        // idCheck가 있는지 여부를 확인!
        if(idCheck != null) {   // idCheck를 했다는 의미
            Cookie check = new Cookie("idCheck", id);
            check.setMaxAge(180); // 3분
            response.addCookie(check);
        }

        // 5. welcome페이지로 이동
        response.sendRedirect("cookie_welcome.jsp");
    }else {  // 로그인 실패!
        // 4. 실패시 cookie_login.jsp 이동... 
        response.sendRedirect("cookie_login.jsp");
    }
    
    
    
%>