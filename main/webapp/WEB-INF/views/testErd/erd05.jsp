<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
 body {
        margin: 0;
        height: 100vh;
      }


    </style>
    <script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/vuerd/dist/vuerd.min.js"></script>
</head>
<body>
	<div id="app">
   	 
    </div>
    <button type="button" onclick="btn_click()">저장</button>
<script>
   
   var jsonData = "";
   var jsonDataInsert = "";
	$(function(){
		jsonData = $.ajax({
	         url:"/resources/json/sampleDDL.json",
	         dataType:"json",
	         async:false
	      }).responseText;
	const container = document.querySelector('#app');
	const editor = document.createElement('erd-editor');
	
	container.appendChild(editor);
//	editor.readonly = true;
	editor.value = jsonData;
	editor.addEventListener('change', event => {
		jsonDataInsert= event.target.value;
	  
	console.log("json", editor)
	console.log("hi: ",event.target.value);
	});
	// layout
	window.addEventListener('resize', () => {
	  editor.width = window.innerWidth;
	  editor.height = window.innerHeight;
	});
	window.dispatchEvent(new Event('resize'));
	})
	
   function btn_click(){
		let header = "${_csrf.headerName}";
		let token = "${_csrf.token}";
		
		let data = {"memId":'<sec:authentication property="principal.memberVO.memId" />',"erdData":jsonDataInsert};
		
		$.ajax({
			url: "/chart/erdInsert",
			contentType:  "application/json;charset=utf-8",
			dataType:"json",
			data: JSON.stringify(data),
			type: "post",
			beforeSend : function(xhr)
            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader(header, token);
            },
			success: function(result){
				console.log(result);
			}
		})
	}
   
// fetch("https://api.github.com/repos/vuerd/vuerd/contents/data/test.json")
//       .then((response) => response.json())
//       .then((data) => editor.initLoadJson(atob(data.content)));
</script>
</body>

</html>