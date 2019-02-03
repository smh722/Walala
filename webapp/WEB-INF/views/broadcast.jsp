<%@page import="com.utf18.site.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   

<!DOCTYPE html>
<html lang="ko">
<head>
<title>방송 화면</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>제가 안했어요!! 이의제기</title>


<!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css?family=Hi+Melody" rel="stylesheet">

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>

   <style>
      body {
         padding: 0px;
         margin-top: 0px;
      }
      
      div.main {
         width: 95%;
         height: 90%;
         padding: 0px;
         margin-top: -15px;
         margin-left: 15px;
         text-align: center;
      }
      
      table {
         width: 100%;
         height: 80%;
         border-collapse: collapse;
         border-spacing: 0px;
         margin-left: 10px;
         padding: 0px;
      }
      
      th, tr, td{
/*          vertical-align: middle; */
         padding: 0px;
      }
      
      h4, h5{
         float: left;
         margin: 0px;
      }
      
      #broadScreen {
         width: 80%;
         height: 90%;
      }
      
      #chatScreen {
         height: 100%;
         width: 20%;
      }
      
      #chat {
         width: 100%;
         height: 100%;
         margin-top: -1px;
      }
      
      .chat_log {
         margin-top: 5px;
         height: 100%;
/*          width: 100.7%; */
         width: 98%;
         margin-left: 5px;
         resize: none;
         text-align: left;
         border: solid lightgray 1px;
      }
      
      #message {
         width: 99%;
         height: 100%;
         margin-left: 6px;
      }
      
      #name {
         width: 99%;
         height: 100%;
         margin-left: 5px;
      }
      
      #subscribe_img{
         font-family: 'Hi Melody', cursive;
      }
      
      .subscribe{
         width: 30px;
         height: 30px;
            position: relative;
         float: left;
            top: 3px;
      }
      
      .btn_manage {
         float: right;
            position: relative;
      }
            
      #a_broadcast_setting{
         position: relative;
          float: left;
         top: 7px;
/*          left: -240px; */
      }
      
      .video-container {
         position: relative;
         padding-bottom: 56.25%;
         padding-top: 30px;
         height: 0;
         overflow: hidden;
         z-index: 1;
      }
      
      .video-container iframe, .video-container object, .video-container embed
         {
         position: absolute;
         top: 0;
         left: 0;
         width: 100%;
         height: 100%;
      }
      
      .col-xs-12w {
         width: 100%;
         height: 100px;
      }
      .col-xs-1w {
         text-align: start;
         padding-left: 5px;
         padding-top:6px;
/*           background-color: #ffc90e; */
          margin-left:10px;
         width: 100px;
         height: 30px;
      }
      input.chat{
         height: 60px;
      }
      
      
      </style>
   <script>
         function manage() {
            location.href = "manage.do";
         }
         
         function hideDiv (){ 
           document.getElementById("subscribe_img").style.display="none"; 
         } 
         self.setTimeout("hideDiv()",3000); // 초 지정   
         
        
   </script>
   
   <script type="text/javascript">
		var sock = null;
		var id = '${login.email}';
		$(document).ready(function() {
		   $("#message").focus(); // 처음 접속시, 메세지 입력창에 focus 시킴
		   
		   //서버로 접속할때는 localhost로 설정해줘야됨 (관리자)
		   // 본인의 서버로 접속할경우, admin으로 들어가야만 채팅이 가능하다.
		   if(id=='admin@admin.com'){
		      ws = new WebSocket("ws://localhost:8181/Walalaa/echo.do");
		   }else{
		   // 그 외 회원은 admin을 제외한 다른 아이디로 접속 시, 채팅참여가 가능하다.
		      ws = new WebSocket("ws://192.168.0.13:8181/Walalaa/echo.do");   
		   }
		   
		   
		   //서버로 메세지 보낼때
		   ws.onopen = function() {
			//처음 접속 시에만 채팅방에 추가함(현재 방정보도 같이 출력)	   
		      	$("#chatLog").append("<b>채팅방에 참여했습니다.</b> : "+$("#room").val()+"<br>");
		      	
		      	//보내기 버튼 눌렀을때
		      	$("#buttonMessage").click(function() {
		         	var msg = $('input[name=chatInput]').val().trim("!%/"); //메시지
		         	var room = $("#room").val().trim("!%/"); //방이름(전체단톡방이면 all)
		         
		         	//전체에게 보낼때
		         	if(msg !=""){
		         		//소켓으로 메세지 전달
		            	ws.send(msg+"!%/"+""+"!%/"+room);
		            	$("#chatLog").append("<b style='color:blue'>[${login.nickname}]</b> : "+msg+"<br>");
		            
		            	$("#chatLog").scrollTop(99999999); //글 입력 시 무조건 하단으로 보냄
		            	$("#message").val(""); //입력창 내용지우기
		            	$("#message").focus(); //입력창 포커스 획득
		         	}
		            
		            
		         
		      	});
		      	//엔터키 입력처리
		      	$("#message").keypress(function(event) {
		         	if(event.which == "13"){
		            	event.preventDefault();
		            	
		            	var msg = $('input[name=chatInput]').val().trim("!%/"); //메시지
		             	var room = $("#room").val().trim("!%/"); //방이름(전체단톡방이면 all)
		             	//전체에게 보낼때
		             	if(msg !=""){
		             		//소켓으로 메세지 전달
		             		
		                	ws.send(msg+"!%/"+""+"!%/"+room);
		                	$("#chatLog").append("<b style='color:blue'>[${login.nickname}]</b> : "+msg+"<br>");
		                
		                	$("#chatLog").scrollTop(99999999); //글 입력 시 무조건 하단으로 보냄
		                	$("#message").val(""); //입력창 내용지우기
		                	$("#message").focus(); //입력창 포커스 획득
		             	}
		         	}
		      	}); 
		      	
		   	};
			//서버로 부터 받은 메세지 보내주기
		   	ws.onmessage = function(message) {
				
		    	//메세지 
		      	var jsonData = JSON.parse(message.data);
		      	if(jsonData.message !=null){
		        	$("#chatLog").append(jsonData.message+"<br>");
		        	$("#chatLog").scrollTop(99999999);
		      	}
		      	
		      	
			};   
		   
		   	//닫힐때
		   	ws.onclose = function(event) {};
		});
		</script>
</head>
<body>
	<% UserVO login = (UserVO)session.getAttribute("login"); %>
	  <!-- 세팅 부분 init -->
	<input type="hidden" id="userId" value="${login.email}">  <!-- 유저아이디  -->
	<input type="hidden" id="room" value="${room}"> <!-- 현재 유저가 접속한 방이름 -->
	

   <header>
         <jsp:include page="search_navbar.jsp"></jsp:include>
   </header>
   
   <div class="main sub">
   	<form id="chat">
      <table id="broad">
         <tr>
            <td>
               <h4><strong>[배틀그라운드] 솔쿼드 38킬 신기록 달성!! | 김성태 솔쿼드</strong></h4>
               <a id="a_broadcast_setting" href="broadcast_setting.do">&nbsp;·&nbsp;방송설정</a>
            </td>
            <td colspan="3" class="chatting_box_title">
               <h4>&nbsp;실시간 채팅</h4>
               <h5 style="margin-left: 4px;">· 159명 시청중 · </h5>
               <a href="#">
               <img class="subscribe" alt="구독누름(구독중)" src="${pageContext.request.contextPath}/assets/images/subscribe_on.png"></a>
               <a href="#">
               <img class="subscribe" alt="구독안누름" src="${pageContext.request.contextPath}/assets/images/subscribe_off.png"></a>
               <button type="button" class="btn btn-primary btn_manage" onclick="manage();">
                  <span class="glyphicon glyphicon-cog"></span>
               </button>
            </td>
         </tr>
         <tr>
            <td rowspan="3" id="broadScreen">
               <div class="video-container">
		            <div id="subscribe_img" style="position: relative; z-index:2; float: left; top: 0px;">
		               <img src="${pageContext.request.contextPath}/assets/images/heart_moving2.gif" alt="구독 감사">
		               <font color="white" size="5px" 
		               style="position: relative; z-index:3; float: left; top: 55px; left: 20px;"><strong>쏠님이 구독!</strong></font>
		            </div>
		            <!--  자동재생소스추가하려면   ?rel=0&autoplay=1 -->
                  <iframe height="100%" width="100%" src="https://www.youtube.com/embed/CB6gwOJp_8U?rel=0&autoplay=1" frameborder="0" allowfullscreen></iframe>
               </div>
            </td>
            <td colspan="2" id="chatScreen"><div id="chatLog" class="chat_log"></div></td>
         </tr>
         <tr>
            
               <td class="col-xs-1w" colspan="3">
          	   <input id="name" class="name" type="hidden" readonly>
                  <img class="name" alt="유저이미지" width="28px" height="28px" 
                  src="${pageContext.request.contextPath}/assets/images/logo_profile.png">
                  <strong>막창사랑</strong> · 
                  <font color="red" size="2">경고 1회 [비속어 감지]</font>
               </td>
         </tr>
         <tr>
               <td class="col-xs-12w"> <input type="text" id="message" name="chatInput" class="message" value="" ></td>
               <td> 
               	<input type="button" id="buttonMessage" value="전송" class="chat btn-primary" style="height:100px; width:100px; border:0px">
               </td>
            
         </tr>
      </table>
      </form>
   </div>


   
   
</body>
</html>