<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="mvo" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/>

<link rel="stylesheet"
	href="/resources/css/chat.css">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<div id="contentWrap">
    <nav>
		<span id="nav-header">
            chat App
        </span>
        <span id="logoutBtn">로그아웃</span>
        <input type="text" id="userId" value="${mvo.member.memCode}">
    </nav>
    <div id="contentCover">
                <div id="chatWrap">
            <div id="chatHeader">Everyone</div>
            <div id="chatLog">
                <div class="anotherMsg">
                    <span class="anotherName">Jo</span>
                    <span class="msg">Hello, Nice to meet you.dasdadsads<br>
                    12412412142124
                    </span>
                    <span>2012-12-12</span>
                </div>
                <div class="myMsg">
                    
                    <span class="msg">Nice to meet you, too.</span>
                    
                </div>
                 <c:forEach items="${chatList}" var="list">
                 	<c:if test="${list.writer == memId}">
                 		<div class="myMsg">
                 			<span><fmt:formatDate value="${list.chatDate}" pattern="hh:mm" /></span>
                    		<span class="msg">${list.chatCts}</span>
               			 </div>
                 	</c:if>
                 	<c:if test="${list.writer != memId}">
                 		 <div class="anotherMsg">
		                    <span class="anotherName">${list.writer}</span>
		                    <span class="msg">${list.chatCts}<br>
		                    </span>
		                    <span><fmt:formatDate value="${list.chatDate}" pattern="hh:mm" /></span>
		                </div>
                 	</c:if>
                 </c:forEach>
            </div>
            <form id="chatForm">
                <input type="text" autocomplete="off" size="30" id="message" placeholder="메시지를 입력하세요">
                <input type="button" id="sendBtn" value="보내기">
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
	let roomNo = "${projId}";
	window.scrollTo(0, document.body.scrollHeight);

	$("#sendBtn").click(function() {
		sendMessage();
		$('#message').val('')
	});
	
	$("#userIdSet").click(function() {
		$("#userIdSet").attr("hidden",true);
		$("#userId").attr("hidden",true);
	});

	let sock = new SockJS("http://192.168.42.61/echo/"+"?roomId="+roomNo);
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	sock.onOpen = onOpen;
	function onOpen(){
		console.log("서버 오픔");
		let jsonIn = {
			"id" : "-1",
			"name" : $("#")
		};
	}
	
	// 메시지 전송
	function sendMessage() {
		let send = $("#message").val();
		let jsonMassage = {
				"id": $("#userId").val(),
				"message":send,
				"roomNo" : roomNo
		}
		sock.send(JSON.stringify(jsonMassage));
	}
	
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var str = "";
		console.log(msg);
		var data = JSON.parse(msg.data);
		
		if(data.id == $("#userId").val()){
			str= `
				<div class="myMsg">
                \${data.date}<span class="msg">\${data.message}</span>
            	</div>
			`;
			$("#chatLog").append(str);
		}else{
		str =`
			<div class="anotherMsg">
			<span class="anotherName">\${data.id}</span>
            <span class="msg">\${data.message}<br>
            </span>
            <span>\${data.date}</span>
            </div>
		`;
		$("#chatLog").append(str);
		}
		$("#message").focus();
		$('#chatLog').scrollTop($('#chatLog')[0].scrollHeight);
	}
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		console.log(evt);
		$("#chatLog").append("연결 끊김");
	}
</script>