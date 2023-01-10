<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="https://unpkg.com/feather-icons"></script>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="mvo" value="${SPRING_SECURITY_CONTEXT.authentication.principal}" />
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}" />
<style>
	.feather {
  width: 15px;
  height: 15px;
  stroke: currentColor;
  stroke-width: 2;
  stroke-linecap: round;
  stroke-linejoin: round;
  fill: none;
}
	a .msg{
		color: black;
	}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
				<link rel="stylesheet" href="/resources/css/chat.css">
				<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
				<script type="text/javascript"
					src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
				<div id="contentWrap">
					<div id="contentCover">
						<div id="chatWrap">
							<div id="chatLog">
<!-- 								<div class="anotherMsg"> -->
<!-- 									<span class="anotherName">Jo</span> -->
<!-- 									<span class="msg">Hello, Nice to meet you.dasdadsads<br> -->
<!-- 										12412412142124 -->
<!-- 									</span> -->
<!-- 									<span>2012-12-12</span> -->
<!-- 								</div> -->
<!-- 								<div class="myMsg"> -->
<!-- 									<span class="msg">Nice to meet you, too.</span> -->
<!-- 								</div> -->
								<c:forEach items="${chatList}" var="list">
									<c:if test="${list.writer == mvo.member.memCode}">
										<c:if test="${list.itgrnAttachFileNum == 0 }">
											<div class="myMsg">
												<span>
													<fmt:formatDate value="${list.chatDate}" pattern="hh:mm" />
												</span>
												<span class="msg">${list.chatCts}</span>
											</div>
										</c:if>
										<c:if test="${list.itgrnAttachFileNum != 0 }">
											<div class="myMsg">
												<span>
													<fmt:formatDate value="${list.chatDate}" pattern="hh:mm" />
												</span>
												<span class="msg">
												<a href="/resources/upload${list.saveFileName}" download="${list.fileName}" 
												style="font-color: white;"><i data-feather='file' class="feather icon-download"></i>
												${list.fileName}</a></span>
											</div>
										</c:if>
									</c:if>
									<c:if test="${list.writer != mvo.member.memCode}">
										<c:if test="${list.itgrnAttachFileNum == 0 }">
											<div class="anotherMsg">
												<span class="anotherName">${list.writerName}</span>
												<span class="msg">${list.chatCts}<br>
												</span>
												<span>
													<fmt:formatDate value="${list.chatDate}" pattern="hh:mm" />
												</span>
											</div>
										</c:if>
										<c:if test="${list.itgrnAttachFileNum != 0 }">
											<div class="anotherMsg">
											<span class="anotherName">${list.writerName}</span>
												<span class="msg"><a href="/resources/upload${list.saveFileName}" download="${list.fileName}">
												<i data-feather="file" class="feather icon-download"></i>${list.fileName}</a><br>
												</span>
												<span><fmt:formatDate value="${list.chatDate}" pattern="hh:mm" /></span>
											</div>
										</c:if>
									</c:if>
								</c:forEach>
							</div>
							<form id="chatForm">
								<input type="text" autocomplete="off" size="30" id="message" placeholder="메시지를 입력하세요">
								<input type="hidden" autocomplete="off" id="fileName" readonly>
								<label class="btn btn-default btn-file btn-sm">
									파일
									<input type="file" name="fileData" id="fileData"  style="display: none;" multiple>
								</label>
								<input type="button" id="sendBtn" class="btn btn-secondary mr-1 mb-1 btn-sm" value="보내기">
							</form>
						</div>
					</div>
				<input type="hidden" id="userId" value="${mvo.member.memCode}">
				<input type="hidden" id="userName" value="${mvo.member.memName}">
				</div>
				<script type="text/javascript">
				$(function(){
				window.scrollTo(0, document.body.scrollHeight);
				 feather.replace();
				})
					let roomNo = "${projId}"
					let fileReader = new FileReader();
					let fileJson = {};
					
					//message나 file이 안담겨 있을때 유효성 체크
					$("#sendBtn").click(function () {
						if($("#message").val() == "" && $("#fileData").val() == ""){
							alert("메시지를 입력해주세요");
							return;
						}
						sendMessage();
						
						$("#fileName").val("");
						$('#message').val('');
						$("#message").prop("type","text");
						$("#fileName").prop("type","hidden");
					});
					
					$("#userIdSet").click(function () {
						$("#userIdSet").attr("hidden", true);
						$("#userId").attr("hidden", true);
					});
					
					//input file에 데이터가 들어왔을때 메시지 창에 file이름을 뛰어줌
					$("#fileData").on("change",function(param){
						let fileName = "";
						$("message").attr("readonly",true);
						for(let i = 0; i<param.target.files.length;i++){
							fileName += "["+ param.target.files[i].name + "]  ";
						}
						$("#message").val("");
						$("#message").prop("type","hidden");
						$("#fileName").prop("type","text");
						$("#fileName").val(fileName);
						console.log("change: ",param.target.files);
					});
					
					//스프링 웹소켓의 URL roomId를 같이 넘김
					let sock = new SockJS("http://192.168.142.9/echo/" + "?roomId=" + roomNo);
					sock.onmessage = onMessage;
					sock.onclose = onClose;
					sock.onOpen = onOpen;
					function onOpen() {
						console.log("서버 오픔");
						let jsonIn = {
							"id": "-1",
							"name": $("#")
						};
					}
					
					// 메시지 전송
					function sendMessage() {
						$("#message").attr("readonly",false);
						let send = $("#message").val();
						let sendBinaryData = $("#fileData").val();
						console.log("sendbinaryData:",sendBinaryData);
						if (sendBinaryData == "") {
							let jsonMassage = {
								"id": $("#userId").val(),
								"name" : $("#userName").val(),
								"message": send,
								"roomNo": roomNo,
								"fileData": 'noData;'
							}
							console.log(jsonMassage);
							sock.send(JSON.stringify(jsonMassage));
						} else {
							//input file에 파일이 들어있을때 가상 form에 담아
							//FileUploadUtil을 통해 파일 저장 후 통합첨부 파일 vo list
							//로 만들어 db에 저장
							let formData = new FormData();
							let inputFile = $("input[name='fileData']");
							let files = inputFile[0].files;
							console.log("files:", files);
							let fileName = new Array();
							
							console.log("files: "+files);
							for (let i = 0; i < files.length; i++) {
								formData.append("uploadFile", files[i]);
								fileName.push(files[i].name);
							}
							formData.append("writer",$("#userId").val());
							formData.append("chatRoomId",roomNo);
							formData.append("chatCts",send);
							$.ajax({
								url: "/proj/${projId}/sendFile",
								processData: false,
								contentType: false,
								data: formData ,
								type:"post" ,
								async: false,
								beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
						            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
							  	},
								success: function(result){
									let filePath = [];
									let fileType = [];
									for(let i = 0;i<result.length;i++){
										filePath.push(result[i].saveFileName);
										fileType.push(result[i].setFileSizeName);
									}
									console.log(result);
									let jsonMassage = {
										"id": $("#userId").val(),
										"name" : $("#userName").val(),
										"message": send,
										"roomNo": roomNo,
										"fileData": fileName,
										"filePath" : filePath,
										"type": fileType
									}
									console.log(jsonMassage);
									sock.send(JSON.stringify(jsonMassage));
									$("#fileData").val("");
								}
							});
						}
						feather.replace();
					};

					// 서버로부터 메시지를 받았을 때
					function onMessage(msg) {
						var str = "";
						console.log(msg.data.message);
						var data = JSON.parse(msg.data);
						if(data.message != ""){
						if (data.id == $("#userId").val()) {	//내가 보낸 text 메시지
							str = `
							<div class="myMsg">
								<span>
									\${data.date}
								</span>
							<span class="msg">\${data.message}</span>
							</div>
						`;
							$("#chatLog").append(str);
						} else {	//상대가 보낸 text 메시지
							str = `
								<div class="anotherMsg">
								<span class="anotherName">\${data.name}</span>
								<span class="msg">\${data.message}<br>
								</span>
								<span>\${data.date}</span>
								</div>
							`;
							$("#chatLog").append(str);
						}
						$("#message").focus();
						$('#chatLog').scrollTop($('#chatLog')[0].scrollHeight);
					}else{
						console.log(data.filePath);
						if (data.id == $("#userId").val()) { //내가 보낸 파일
							for(let i=0;i<data.fileData.length;i++){
								
									str += `
										<div class="myMsg">
										<span>
											\${data.date}
										</span>
										<span class="msg"><a href="/resources/upload\${data.filePath[i]}" download="\${data.fileData[i]}"
											 style="font-color: white;"><i data-feather='file' class="feather icon-download"></i>
											 \${data.fileData[i]}</a></span>
										</div>
									`;
								
								}
							
							
							$("#chatLog").append(str);
							str = "";
							$('#chatLog').scrollTop($('#chatLog')[0].scrollHeight);
						}else{	//상대방 파일이 넘어올때
							for(let i=0;i<data.fileData.length;i++){
							str += `
								<div class="anotherMsg">
								<span class="anotherName">\${data.name}</span>
								<span class="msg"><a href="/resources/upload\${data.filePath[i]}" download="\${data.fileData[i]}">
								\${data.fileData[i]}</a><br>
								</span>
								<span>\${data.date}</span>
								</div>
								`;			
							}
							$("#chatLog").append(str);
							str = "";
							$('#chatLog').scrollTop($('#chatLog')[0].scrollHeight);
						}
					}
						feather.replace();
				}
					// 서버와 연결을 끊었을 때
					function onClose(evt) {
						console.log(evt);
						$("#chatLog").append("연결 끊김");
					}
				</script>