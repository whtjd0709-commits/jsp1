        <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
   .wrap{
      width:257px;
      margin: 0 auto;
      text-align: center;
   }
   
   .btn{
      width:60px;
      height: 50px;
      background-color : aqua;
   }
   

</style>
<!-- style 에서
   . 은 클래스 선택자 , # 은 id선택자로 사용됨. 
 -->


</head>
<body>

   <!-- 
   css사용하는 대표적인 방법 =>
   -태그에 직접 선언해서 사용하는 방법
   -head태그에 css선언하고, 아래있는 태그의 class속성으로 해당 디자인을 사용
   -외부 css파일을 생성한 후에 블러오는 방법
    -->

   <div class="wrap">
      <h2>리다이렉트 로그인 연습</h2>
      <hr>
      
      <form action="res_login_ok.jsp" method="post">
         <table border="1">
            <tr>  <!-- rowspan, colspan 사용 -->
               <td><input type="text" name="id" placeholder="아이디"></td>
               <td rowspan=2><input type="submit" value="로그인" class="btn"></td>
            </tr>
            <tr>
               <td><input type="password" name="pw" placeholder="비밀번호"></td>
               
            </tr>
         </table>      
      </form>   
   </div>

</body>
</html>