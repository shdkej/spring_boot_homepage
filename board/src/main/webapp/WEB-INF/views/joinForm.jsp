<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="/text/html; charset="UTF-8">
<title>회원가입</title>

<script type="text/javascript" src="/logintemplelet/js/livevalidation_standalone.js"></script>
  <link rel="stylesheet" href="/logintemplelet/css/style.css">

</head>
<body onLoad=stb()>
 <div class="login-wrap">
  <h2> 회원가입  </h2>
  
  <div class="form">
   <form method = "POST" action="/createmember" name=myform onSubmit="return(check_form());">
       <br/><input type = "text" name="username" id="username" placeholder="ID" oninput="checkId()"/> <br/>
       <input type = "password" name="password" id="password" placeholder="Password"/> <br/>
       <input type = "text" name="name" id="name" placeholder="name"/> <br/>
       <br/><br/>
		<center><input type ="radio" name="gender" value="man" id="man" checked="checked"><label for="man"><b>man</b></label>
		<input type ="radio" name="gender" value="woman" id="woman"><label for="woman"><b>woman</b></label></center><br/>
		<br/>
		<input type="date" name="birth" placeholder="99-09-09 형식으로 입력 바랍니다."/><br/>
        <input type="email" name="mail" id="f20" placeholder="e-mail"/><br/>
        <input type="tel" name="phone" placeholder="Phone - '-'를 빼고 입력해 주세요."/><br/>
        <center><input id="joinbtn" type="submit" value="가입" class="btn-blue"/>
        <input type="button" value="뒤로가기" onclick="window.location='/login'" class="btn-blue"/></center>
    </form>

  </div>
 </div>
 <script src='https://code.jquery.com/jquery-1.10.0.min.js'></script>

    <script src="/logintemplelet/js/index.js"></script>
</body>
<script>

function stb(){
	document.myform.username.focus();
	}
	
function check_form() {
	if(!myform.username.value)
	{
		alert("ID를 적어주세요");
		myform.username.focus();
		return false;
	}

	if(!myform.password.value)
	{
		alert("Password를 적어주세요");
		myform.password.focus();
		return false;
	} 
        if(!myform.name.value)
	{
		alert("이름을 적어주세요");
		myform.name.focus();
		return false;
	}
	if(!myform.phone.value)
	{
		alert("번호도 적어주세요");
		myform.phone.focus();
		return false;
	}
	return true;
}

var idCheck = 0;
function checkId(){
	var inputed = $('#username').val();
	$.ajax({
		data : {
			id : inputed
		},
	url : "/checkId",
	success : function(data){
		if(inputed=="" && data =='0'){
			$("#joinbtn").prop("disabled",true);
			$("#joinbtn").css("background-color", "#aaaaaa");
			$("#username").css("background-color"),"#FFCECE");
			idCheck = 0;
		}else if(data == '1'){
			$("#joinbtn").prop("disabled",false);
			$("#joinbtn").css("background-color", "#B0F6AC");
		}
	}
	});
}

</script>
</html>
