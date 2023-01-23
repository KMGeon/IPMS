<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html class="loaded" lang="en" data-textdirection="ltr"
	style="-vh: 9.37px;">
<!-- BEGIN: Head-->
<head>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta name="description"
	content="Stack admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
<meta name="keywords"
	content="admin template, stack admin template, dashboard template, flat admin template, responsive admin template, web app">
<meta name="author" content="PIXINVENT">
<title>Gallery Hover Effects - Stack Responsive Bootstrap 4 Admin Template</title>
<link rel="apple-touch-icon"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/images/ico/apple-icon-120.png">
<link rel="shortcut icon" type="image/x-icon"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/images/ico/favicon.ico">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i%7COpen+Sans:300,300i,400,400i,600,600i,700,700i"
	rel="stylesheet">

<!-- BEGIN: Vendor CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/vendors.min.css">
<!-- END: Vendor CSS-->

<!-- BEGIN: Theme CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/bootstrap-extended.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/colors.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/components.css">
<!-- END: Theme CSS-->

<!-- BEGIN: Page CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/core/menu/menu-types/horizontal-menu.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/core/colors/palette-gradient.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/pages/gallery.css">
<!-- END: Page CSS-->

<!-- BEGIN: Custom CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/assets/css/style.css">
<!-- END: Custom CSS-->
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/join.css">
<style type="text/css">
.jqstooltip {
	position: absolute;
	left: 0px;
	top: 0px;
	visibility: hidden;
	background: rgb(0, 0, 0) transparent;
	background-color: rgba(0, 0, 0, 0.6);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000,
		endColorstr=#99000000);
	-ms-filter:
		"progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";
	color: white;
	font: 10px arial, san serif;
	text-align: left;
	white-space: nowrap;
	padding: 5px;
	border: 1px solid white;
	z-index: 10000;
}

.jqsfield {
	color: white;
	font: 10px arial, san serif;
	text-align: left;
}

.bookdiv{
		padding-left: 150px;
		padding-bottom : 50px;
		width: 520px;
	}
</style>

</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body  class="horizontal-layout horizontal-menu horizontal-menu-padding 2-columns  menu-expanded pace-done" data-open="hover" data-menu="horizontal-menu" data-col="2-columns">
	<div class="pace  pace-inactive" >
		<div class="pace-progress" data-progress-text="100%" data-progress="99" style="transform: translate3d(100%, 0px, 0px);" >
			<div class="pace-progress-inner"></div>
		</div>
		<div class="pace-activity"></div>
	</div>

		<div style="bottom:20px;" class="content-header-left col-md-6 col-12 mb-2">
			<h3 class="content-header-title mb-0" style="font-family: noto sans, malgun gothic, AppleGothic, dotum;"><b>북마크 한 프로젝트</b></h3>
			<div class="row breadcrumbs-top">
				<div class="breadcrumb-wrapper col-12"></div>
			</div>
		</div>

	<div class="content-overlay" >
		<div class="grid-hover row" style="right:125px; width:1000px;">
		<c:forEach var="list" items="${list}" varStatus="status">
<!-- 		<div class="contatiner row" > -->
			<!-- 이거 포문 돌리기 ㄱㄱ 시작 -->
			<div class="bookdiv" style="width:330px;" >
				<figure class="effect-roxy"  >
					<div class="funcId" onclick="fn_bookmarkdel('${list.projId}')" style="position: absolute; z-index: 1400; right: 3px; margin-right: 10px; margin-top: 250px; " class="fonticon-wrap">
						<i onmouseover="mouseover(${status.count})" onmouseout="mouseout(${status.count})" style="color:pink;" id="bookmarkdel${status.count}" class="fa fa-heart"></i>
					</div>
					<img src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/gallery/15.jpg" alt="img15">
					<figcaption >
						<h3>${list.projName }</h3><br/>
						<p>기간 : <fmt:formatDate value="${list.projStrtDate}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${list.projEndDate}" pattern="yyyy-MM-dd"/> </p>
						<hr/>
						
						<p>프로젝트 생성일 : <fmt:formatDate value="${list.projCreatnDate}" pattern="yyyy-MM-dd"/>  </p>
						<hr/>
						<p>리더 : ${list.memName}</p>
						<hr/>
						<a href="/main/projectDetail/${list.projId}">View more</a>
					</figcaption>
				</figure>
			</div>
			<!-- 이거 포문 돌리기 ㄱㄱ 끗 -->
				
<!-- 		</div> -->
		</c:forEach>
	</div>
			<!-- 페이징 버튼 -->
				<div style="margin-bottom:50px; margin-left:480px; text-align: center;">
                        <!-- 페이징 처리 버튼 시작 -->
                            <div class="dataTables_paginate paging_simple_numbers" id="app-invoice-table_paginate">
                                <ul class="pagination">
                                
                                	 <!-- 이전 버튼 시작 -->
                                    <c:if test="${pageVO.prev }">
                                    <li style="width:100px;" class="paginate_button page-item previous" id="app-invoice-table_previous">
                                        <a href="/main/bookmark?pageNum=${pageVO.pageNum - 1}&amount=${pageVO.amount}" aria-controls="app-invoice-table" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
                                    </li>
                                    </c:if>
                                    <!-- 이전 버튼 끝 -->
									
                                    <!-- 페이지 블록 시작 -->
                                    <!-- 현재페이지 -->
                                    <c:forEach var = "num" begin = "${pageVO.startPage }" end = "${pageVO.endPage }">
                                    <c:choose>
                                    <c:when test="${pageVO.pageNum eq num }">
	                                    <li class="paginate_button page-item active">
	                                        <a href="/main/bookmark?pageNum=${num}&amount=${pageVO.amount}" aria-controls="app-invoice-table" data-dt-idx="1" tabindex="0" class="page-link info">${num}</a>
	                                    </li>
                                    </c:when>
                                    <c:otherwise>
                                    	<li class="paginate_button page-item">
	                                        <a href="/main/bookmark?pageNum=${num}&amount=${pageVO.amount}" aria-controls="app-invoice-table" data-dt-idx="1" tabindex="0" class="page-link">${num}</a>
	                                    </li>
                                    </c:otherwise>
                                    </c:choose>
                                    </c:forEach>
                                    <!-- 페이지 블록 끝 -->

                                    <!-- 다음 버튼 시작 -->
                                    <c:if test="${pageVO.next }">
                                    <li style="width: 70px;" class="paginate_button page-item next" id="app-invoice-table_next">
                                        <a href="/main/bookmark?pageNum=${pageVO.pageNum + 1}&amount=${pageVO.amount}" aria-controls="app-invoice-table" data-dt-idx="6" tabindex="0" class="page-link">Next</a>
                                    </li>
                                    </c:if>
                                    <!-- 다음 버튼 끝 -->

                                </ul>
                            </div>
                        <!-- 페이징 처리 버튼 끝 -->
                    </div>
			<!-- 페이징 버튼 -->
		</div>
		

	<div class="sidenav-overlay"
		style="touch-action: pan-y; user-select: none; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></div>
	<div class="drag-target"
		style="touch-action: pan-y; user-select: none; -webkit-user-drag: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></div>

	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/vendors.min.js"></script>
	<!-- BEGIN Vendor JS-->

	<!-- BEGIN: Page Vendor JS-->
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/ui/jquery.sticky.js"></script>
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/charts/jquery.sparkline.min.js"></script>
	<!-- END: Page Vendor JS-->

	<!-- BEGIN: Theme JS-->
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/core/app-menu.js"></script>
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/core/app.js"></script>
	<!-- END: Theme JS-->

	<!-- BEGIN: Page JS-->
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/ui/breadcrumbs-with-stats.js"></script>
	<!-- END: Page JS-->
</body>
</html>
<script>
var header = '${_csrf.headerName}';
var token = '${_csrf.token}';

$(function(){
	
});

	function mouseover(param){
 	$("#bookmarkdel"+param).attr("class","feather icon-heart")
	}
	
	function mouseout(param){
 	$("#bookmarkdel"+param).attr("class","fa fa-heart")
	
	}	
	function fn_bookmarkdel(param){
		console.log("param: " ,param);

		data = {
			"projId" :  param
		}
		
		console.log("data : " , data);

		$.ajax({ 
                type : 'POST',
                url : '/main/bookMarkDel',
                contentType : "application/json;  charset=utf-8",
                async : false,
                data :  JSON.stringify(data) ,
                beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
                  xhr.setRequestHeader(header, token);
                },
                success : function(result) {
                  alert("북마크 제거 완료");
                  location.href="/main/bookmark";
              },
              error: function (jqXHR, textStatus, errorThrown)
              {
                    console.log(errorThrown,textStatus);
              }
            });
	}

</script>