<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="mvo" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vuerd/dist/vuerd.min.js"></script>
<link rel="stylesheet"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/plugins/forms/extended/form-extended.css">
<script
	src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/forms/extended/maxlength/bootstrap-maxlength.js"></script>
<style>
 #insert{
 	width:80px; 
 }
 #update{
 	width:80px; 
 }
 #delete{
 	width:80px; 
 }

</style>

<body>
	<div class="row">
		<div class="col-2">
			<select class="custom-select block" id="customSelect" onchange="fn_change()">
				<c:if test="${fn:length(listErdVer) != 0 }">
				<c:forEach items="${listErdVer}" var="item" varStatus="status">
					<c:if test="${param.erdNum == null}">
					<c:if test="${status.last == true}">
					<option value="${item.erdNum}" selected>${item.erdTitle}</option>
					</c:if>
					<c:if test="${status.last == false}">
					<option value="${item.erdNum}">${item.erdTitle}</option>
					</c:if>				
					</c:if>
					<c:if test="${param.erdNum != null}">
					<c:if test="${item.erdNum == param.erdNum}">
					<option value="${item.erdNum}" selected>${item.erdTitle}</option>
					</c:if>
					<c:if test="${item.erdNum != param.erdNum}">
					<option value="${item.erdNum}">${item.erdTitle}</option>
					</c:if>					
					</c:if>
				</c:forEach>
				</c:if>
			</select>
		</div>
		<div class="col-6"></div>
		<div class="col-1" style="right: 30px;">
			<button type="button"
				class="btn btn-secondary btn-md square btn-min-width mr-1 mb-1"
				  id="insert">새로 저장</button>
		</div>
		<div class="col-2">
			<button type="button"
				class="btn btn-warning btn-md square btn-min-width mr-1 mb-1"
				style="float: center;" id="update">수정</button>
		</div>
		<div class="col-1">
			<button type="button"
				class="btn btn-danger btn-md square btn-min-width mr-1 mb-1"
				style="float: right;" id="delete">삭제</button>
		</div>
		
		

	</div>
	<div class="row">

		<div id="app" style="width: 100%; height: 800px"></div>


	</div>
	<script>
	
	var erdData = '${erdData.erdProjData}';
   var jsonData = "";
   var jsonDataInsert = "";
   var erdTitle ="";
	$(function(){
	const container = document.querySelector('#app');
	const editor = document.createElement('erd-editor');
	
	container.appendChild(editor);
//	editor.readonly = true;
	editor.value = erdData;
	editor.addEventListener('change', event => {
	jsonDataInsert= event.target.value;
	erdTitle = JSON.parse(event.target.value).canvas.databaseName;
	console.log("json", editor)
	console.log(JSON.parse(event.target.value).canvas.databaseName);
	});
	// layout
	window.addEventListener('resize', () => {
		
		  editor.width = app.innerWidth;
		  editor.height = app.innerHeight;
	});
	editor.automaticLayout = true;
	window.dispatchEvent(new Event('resize'));
	
	$("#insert").on("click",function(){
		
		let data = {"writer":"${mvo.member.memCode}","projId":"${projId}","erdTitle":erdTitle,"erdProjData":jsonDataInsert};

		$.ajax({
			url: "/proj/${projId}/erdInsert",
			contentType:  "application/json;charset=utf-8",
			data: JSON.stringify(data),
			type: "post",
			beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
		          xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success: function(result){
				console.log(result);
				location.reload();
			}
		})
		
	});
	
	$("#update").on("click",function(){
		let erdVer = $("#customSelect option:selected").val();
		let data = {"erdNum":erdVer ,"erdTitle":erdTitle,"erdProjData":jsonDataInsert}
//			beforeSend : function(xhr)
//      {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
//			xhr.setRequestHeader(header, token);
//      },
		
		$.ajax({
			url: "/proj/${projId}/erdUpdate",
			contentType:  "application/json;charset=utf-8",
			
			data: JSON.stringify(data),
			type: "post",
			beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
		          xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success: function(result){
				console.log(result);
				if(result){
					location.reload();				
				}else{
					alert("실패");
				}
			}
		})
	})
	
	$("#delete").on("click",function(){
		let erdVer = $("#customSelect option:selected").val();
		let data = {"erdNum":erdVer}
//			beforeSend : function(xhr)
//      {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
//			xhr.setRequestHeader(header, token);
//      },
		
		$.ajax({
			url: "/proj/${projId}/erdDelete",
			contentType:  "application/json;charset=utf-8",
			data: JSON.stringify(data),
			type: "post",
			beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
		          xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success: function(result){
				console.log(result);
				if(result){
					location.href = "/proj/${projId}/erd";				
				}else{
					alert("실패");
				}
			}
		})
	})
	
	});
	
  function fn_change(){
			location.href = "?erdNum="+$("#customSelect option:selected").val();
		}
   
// fetch("https://api.github.com/repos/vuerd/vuerd/contents/data/test.json")
//       .then((response) => response.json())
//       .then((data) => editor.initLoadJson(atob(data.content)));
</script>
</body>
