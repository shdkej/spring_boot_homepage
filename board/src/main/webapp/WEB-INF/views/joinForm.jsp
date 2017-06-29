<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="/text/html; charset="UTF-8">
<title>회원가입</title>


  <link rel="stylesheet" href="/logintemplelet/css/style.css">
</head>
<body>
 <div class="login-wrap">
  <h2> 회원가입 Form </h2>
  
  <div class="form">
   <form method = "POST" action="/createmember" >
        ID : <br/><input type = "text" name="username"/> <br/>
        PWD : <input type = "password" name="password"/> <br/>
        NAME : <input type = "text" name="name"/> <br/>
        Gender :<br/><br/>
				<input type ="radio" name="gender" value="man" id="man" checked="checked"><label for="man"><b>man</b></label>
				<input type ="radio" name="gender" value="woman" id="woman"><label for="woman"><b>woman</b></label><br/>
		<br/>
		Birth : <input type="text" name="birth" placeholder="99-09-09 형식으로 입력 바랍니다."/><br/>
        Email : <input type="text" name="mail" /><br/>
        Phone : <input type="text" name="phone" /><br/>
        Address : <input type="text" name="address" /><br/>
        <input type="submit" value="가입" />
        <input type="button" value="뒤로가기" onclick="window.location='/login'"/>
    </form>

  </div>
 </div>
 <script src='https://code.jquery.com/jquery-1.10.0.min.js'></script>

    <script src="/logintemplelet/js/index.js"></script>
</body>
</html>