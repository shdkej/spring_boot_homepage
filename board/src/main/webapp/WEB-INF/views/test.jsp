<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
</head>
<body id="body" onload="fnOnLoad()">
  <button id="requestPermissionButton" onclick="test();">알림실행</button>
  <p>
  	<span id="state">STATE</span><span id="time"></span>
  	<input type="button" id="startBtn" value="시작"/><input type="button" id="stopBtn" value="종료"/>
  </p>
  
  <input id="notificationMessage" type="text" disabled/>
  <button id="notificationButton" type="button" disabled>알림</button>
  
  <button onclick="notifyMe()"></button>
</body>
</html>
<script type="text/javascript">    
function showNotification(){
  if(window.webkitNotifications) { //브라우저 지원현황 확인하기
    if(window.webkitNotifications.checkPermission() == 0 ){ //사용자 승인 여부 확인하기  
      var picture = 'http://mkexdev.net/img/mkex.jpg'; 
      var titleStr = 'MKEX의 HTML5';
      var bodyStr = 'HTML5 Notification 데모입니다';      
      var noti1 = window.webkitNotifications.createNotification(picture, titleStr, bodyStr);
      var noti2 = window.webkitNotifications.createHTMLNotification("http://m.mkexdev.net");
      noti1.show();
      noti2.show();      
    }
    else{
     requestPermission(showNotification);
   }   
  }
  else{
    alert("현재 브라우저는Notifications를 지원하지 않습니다");
  }
}
function requestPermission (callback) {
  window.webkitNotifications.requestPermission(callback);
}


function fnOnLoad(){
	document.getElementById("startBtn").addEventListener("click", function(){
		eventSource = new EventSource("http://localhost:8080/test2");
		eventSource.onopen = function(event){
			document.getElementById("state").innerHTML = "STARTED";
		};
		eventSource.onmessage = function(event){
			documnet.getElementById("time").innerTML = event.data;
		};
		eventSource.onerror = function(event){
			document.getElementById("state").innerHTML = "ERROR";
		};
	});
	
	document.getElementById("stopBtn").addEventListener("click",function(){
		if(eventSource){
			eventSource.close();
		}
		document.getElementById("state").innerHTML = "STOP";
	});
}

function test(){
	var requestPermissionButton = $("#requestPermissionButton");
	var notificationButton = $("#notificationButton");
	var notificationMessage = $("#notificationMessage");
	var iconDataURI = "";
	
	requestPermissionButton.on("click", function(){
		Notification.requestPermission(function(result){
			if(result ==="denied"){
				return;
			}else{
				requestPermissionButton.attr('disabled', 'disabled');
				notificationMessage.removeAttr('disabled');
				notificationButton.removeAttr('disabled');
				return;
			}
		});
	});
	
	notificationButton.on("click", function(){
		var message = notificationMessage.val();
		
		if(message !== null && message.length > 0){
			var options = {
					body: message,
					icon: iconDataURI
			}
			
			var notification = new Notification("test",options);
			
			setTimeout(function(){
				notification.close();
			}, 5000);
		}
	});

}
function notifyMe() {
	  // Let's check if the browser supports notifications
	  if (!("Notification" in window)) {
	    alert("This browser does not support desktop notification");
	  }

	  // Let's check whether notification permissions have already been granted
	  else if (Notification.permission === "granted") {
	    // If it's okay let's create a notification
	    var notification = new Notification("Hi there!");
	  }

	  // Otherwise, we need to ask the user for permission
	  else if (Notification.permission !== 'denied') {
	    Notification.requestPermission(function (permission) {
	      // If the user accepts, let's create a notification
	      if (permission === "granted") {
	        var notification = new Notification("Hi there!");
	      }
	    });
	  }

	  // At last, if the user has denied notifications, and you 
	  // want to be respectful there is no need to bother them any more.
	}
</script>
