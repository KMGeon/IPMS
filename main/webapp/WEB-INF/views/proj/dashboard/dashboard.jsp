<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- BEGIN: Page CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/core/menu/menu-types/vertical-menu.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/core/colors/palette-gradient.css">
	
<!-- END: Page CSS-->
<!-- BEGIN: font CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/css/commonFont.css">
<!-- END: font CSS-->
<style>
.table-responsive {
	height: 300px;
	overflow: auto;
}
thead{
	position: relative;
	width: 100%;
}

th{
	border-top: 2px solid grey;
	position: sticky;
	top: -1px;
	background-color: white;
	
}
tr{
	padding: 5px;
}
</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script type="text/javascript"
	src="/resources/stack-admin-v4.0/stack-admin/src/js/core/libraries/jquery.min.js"></script>

<div class="content-detached content-left">
	
	<div class="content-body" style="width: 100%;">
		<div class="row" style="width: 100%;">
		<div class="col-12">
			<div id="accordionWrapa1" role="tablist" aria-multiselectable="true">
				<div class="card accordion collapse-icon">
					<div id="heading1" class="card-header collapsed" role="tab" data-toggle="collapse" href="#accordion1" aria-expanded="false" aria-controls="accordion1">
						<a class="card-title lead" href="#">${projInfo.projName}</a>
					</div>
					<div id="accordion1" role="tabpanel" data-parent="#accordionWrapa1" aria-labelledby="heading1" class="collapse" style="">
						<div class="card-content">
							<div class="card-body">
								<div class="row">
									<div class="col-6"><h3>시작일: <fmt:formatDate value="${projInfo.projStrtDate}" pattern="yyyy-MM-dd" /></h3></div>
									<div class="col-6"><h3>종료일: <fmt:formatDate value="${projInfo.projEndDate}" pattern="yyyy-MM-dd" /></h3></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		
		
			<!-- 첫번째 -->
			<div style="display: flex; width: 100%;">
				<div class="row" style="width: 100%;">
					<div class="col-6">
						<div class="card" style="">
							<div class="card-header">
								<h3 class="content-header-title mb-0">일감</h3>
								<p>
									<span class="float-right"><a href="/proj/${projId}/taskList"
										>더보기 <i class="feather icon-arrow-right"></i>
									</a></span>
								</p>
								<a class="heading-elements-toggle"><i
									class="fa fa-ellipsis-v font-medium-3"></i></a>
								<div class="heading-elements"></div>
							</div>
							<div class="card-content">
								<div class="table-responsive">
									<table id="recent-orders"
										class="table table-hover mb-0 ps-container ps-theme-default"
										style="table-layout: fixed;">
										<thead>
											<tr>
												<th style="width: 17%;">번호</th>
												<th style="width: 35%">일감 제목</th>
												<th style="width: 15%">상태</th>
												<th style="width: 20%">진척도</th>
												<th style="width: 20%">담당자</th>
											</tr>
										</thead>
										<tbody id="task">
											
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="col-6">
						<div class="card" style="">
							<div class="card-header">
								<h3 class="content-header-title mb-0">이슈</h3>
								<p>
									<span class="float-right"><a href="/proj/${projId}/issueboard"
										>더보기 <i class="feather icon-arrow-right"></i>
									</a></span>
								</p>
								<a class="heading-elements-toggle"><i
									class="fa fa-ellipsis-v font-medium-3"></i></a>
								<div class="heading-elements"></div>
							</div>
							<div class="card-content">
								<div class="table-responsive">
									<table id="recent-orders"
										class="table table-head-fixed table-hover mb-0 ps-container ps-theme-default"
										style="table-layout: fixed;">
										<thead>
											<tr>
												<th style="width: 15%;">번호</th>
												<th style="width: 35%">이슈 제목</th>
												<th style="width: 15%">담당자</th>
												<th style="width: 15%;text-align: center;">상태</th>
											</tr>
										</thead>
										<tbody id="issue">
											
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 첫번째 끝 -->

			<!-- 두번째 시작 -->

			<div style="display: flex; width: 100%;">

				<div class="row" style="width: 100%;">

					<div class="col-6">

						<div class="card">
							<div class="card-header">
								<h3 class="content-header-title mb-0">공지사항</h3>
								<p>
									<span class="float-right"><a href="/proj/${projId}/noticeBoard"
										>더보기 <i class="feather icon-arrow-right"></i>
									</a></span>
								</p>
							</div>
							<div class="card-content collapse show">
								<div class="table-responsive">
									<table class="table table-striped">
										<thead>
											<tr>
												<th scope="col" style="text-align: center;">번호</th>
												<th scope="col">제목</th>
												<th scope="col">작성자</th>
												<th scope="col">작성일</th>
											</tr>
										</thead>
										<tbody id="notice">
											
										</tbody>
									</table>
								</div>
							</div>
						</div>

					</div>


					<div class="col-6">

						<div class="card">
							<div class="card-header">
								<h3 class="content-header-title mb-0">프로젝트 게시판</h3>
								<a class="heading-elements-toggle"><i
									class="fa fa-ellipsis-v font-medium-3"></i></a>
								<p>
									<span class="float-right"><a href="/proj/${projId}/freeboard"
										>더보기 <i class="feather icon-arrow-right"></i>
									</a></span>
								</p>
							</div>
							<div class="card-content collapse show">
								<div class="table-responsive">
									<table class="table table-striped">
										<thead>
											<tr>
												<th scope="col" style="text-align: center;">번호</th>
												<th scope="col">제목</th>
												<th scope="col">작성자</th>
												<th scope="col">작성일</th>
											</tr>
										</thead>
										<tbody id="freeBoard">
											
										</tbody>
									</table>
								</div>
							</div>
						</div>

					</div>




				</div>
			</div>
			<!-- 두번째 끝 -->
			<div style="display: flex; width: 100%;">
				<div class="row" style="width: 100%;">
					<div class="col-4">
						<div class="card">
							<div class="card-header">
								<h3 class="content-header-title mb-0">ERD</h3>
								<p></p>
							</div>
							<div class="card-content collapse show" style="height: 100%;">
								<div class="table-responsive">
									<table class="table table-striped">
										<thead>
											<tr>
												<th scope="col">번호</th>
												<th scope="col">제목</th>
												<th scope="col">작성자</th>
											</tr>
										</thead>
										<tbody id="erd">
											
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>

					<div class="col-4">
						<div class="card">
							<div class="card-header">
								<h3 class="content-header-title mb-0">위키</h3>
								<p></p>
							</div>
							<div class="card-content collapse show">
								<div class="table-responsive">
									<table class="table table-striped">
										<thead>
											<tr>
												<th scope="col">번호</th>
												<th scope="col">제목</th>
												<th scope="col">작성자</th>
											</tr>
										</thead>
										<tbody id="wiki">
											
										</tbody>
									</table>
								</div>
							</div>
						</div>

					</div>
					<div class="col-xl-4 col-lg-4">

						<div class="card">
							<div class="card-header">
								<h3 class="content-header-title mb-0">진척도</h3>
								<a class="heading-elements-toggle"><i
									class="fa fa-ellipsis-v font-medium-3"></i></a>
							</div>
							<div class="card-content collapse show">
								<div class="card-body">
									<div style="height: 272.5px;">
										<canvas id="simple-pie-chart" width="100%" height="60%"></canvas>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
			<!-- Task Progress -->
		</div>
	</div>
	<script>
	const ctx = document.getElementById('simple-pie-chart').getContext('2d');
	$(function(){
		$.ajax({
			type: "post",
	        url: "/proj/${projId}/selectTask",
	        dataType: "json",
	        beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		  },
	        success: function(data) {
	        	console.log("일감",data);
	        	let str = "";
	        	if(data.length == 0){
	        		str += "<div style='position: absolute;left: 50%;transform: translateX(-50%);'>등록된 일감이 없습니다.</div>";
	        		str += "<br>"
	        	}else{
		        	var title = "";
		        	for(let i=0;i<data.length;i++){
		        		if(data[i].highTaskId == null){
		        			if(data[i].taskTitle.length > 5){
			        			title = data[i].taskTitle.substr(0,5)+"...";
			        		}else{
		        				title = data[i].taskTitle;			        			
			        		}
		        			str += `
			        			<tr>
									<td scope="row" align='center'>\${i+1}</td>
									<td title="\${data[i].taskTitle}">[상위] \${title}</td>
									`;
							if(data[i].taskStusCode == 'danger'){
							str +=	`<td><span class="badge badge-danger">높음</span></td>
									<td>\${data[i].taskPgres}%</td>
									<td>\${data[i].memCode}</td>
								</tr>`;						
							}
							if(data[i].taskStusCode == 'primary'){
							str +=	`<td><span class="badge badge-primary">일반</span></td>
									<td>\${data[i].taskPgres}%</td>
									<td>\${data[i].memCode}</td>
								</tr>`;							
							}
							if(data[i].taskStusCode == 'secondary'){
							str +=	`<td><span class="badge badge-secondary">낮음</span></td>
									<td>\${data[i].taskPgres}%</td>
									<td>\${data[i].memCode}</td>
								</tr>`;							
							}
		        		}else{
		        			if(data[i].taskTitle.length > 8){
		        				title = data[i].taskTitle.substr(0,8)+"...";
			        		}else{
		        				title = data[i].taskTitle;			        			
			        		}
			        		str += `
			        			<tr>
									<td scope="row" align='center'>\${i+1}</td>
									<td title="\${data[i].taskTitle}">\${title}</td>
									`
							if(data[i].taskStusCode == 'danger'){
							str +=	`<td><span class="badge badge-danger">높음</span></td>
									<td>\${data[i].taskPgres}%</td>
									<td>\${data[i].memCode}</td>
								</tr>`							
							}
							if(data[i].taskStusCode == 'success'){
							str +=	`<td><span class="badge badge-success">일반</span></td>
									<td>\${data[i].taskPgres}%</td>
									<td>\${data[i].memCode}</td>
								</tr>`							
							}
							if(data[i].taskStusCode == 'primary'){
							str +=	`<td><span class="badge badge-warning">낮음</span></td>
									<td>\${data[i].taskPgres}%</td>
									<td>\${data[i].memCode}</td>
								</tr>`							
							}
		        		}
		        	}
	        	}
	        	$("#task").html(str);
	        } 
		});
		
		$.ajax({
			type: "post",
	        url: "/proj/${projId}/selectIssue",
	        dataType: "json",
	        beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		  },
	        success: function(data) {
	        	console.log("이슈",data);
	        	let str = "";
	        	if(data.length == 0){
	        		str += "<div style='position: absolute;left: 50%;transform: translateX(-50%);'>등록된 이슈가 없습니다.</div>";
	        		str += "<br>"
	        	}else{
		        	for(let i=0;i<data.length;i++){
		        		var title ="";
		        		if(data[i].issueTitle.length > 13){
		        			title = data[i].issueTitle.substr(0,13)+"...";
		        		}else{
		        			title= data[i].issueTitle;
		        		}
		        		str += `
		        			<tr>
								<td scope="row" align='center'>\${i+1}</td>
								<td title="\${data[i].issueTitle}"><a href='/proj/${projId}/issueDetail?issueId=\${data[i].taskId}'>\${title}</a></td>
								<td>\${data[i].writer}</td>
								`;
						if(data[i].issueStusCode =='해결'){							
							str += 	`<td style="text-align:center;"><span class="badge badge-success">\${data[i].issueStusCode}</span></td>
									</tr>`
						}		
						if(data[i].issueStusCode =='미해결'){							
							str += 	`<td style="text-align:center;"><span class="badge badge-danger">\${data[i].issueStusCode}</span></td>
									</tr>`
						}		
		        	}
	        	}
	        	$("#issue").html(str);
	        } 
		});
		
		$.ajax({
			type: "post",
	        url: "/proj/${projId}/selectNotice",
	        dataType: "json",
	        beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		  },
	        success: function(data) {
	        	console.log("공지사항",data);
	        	let str = "";
	        	if(data.length == 0){
	        		str += "<div style='position: absolute;left: 50%;transform: translateX(-50%);'>등록된 공지사항이 없습니다.</div>";
	        		str += "<br>"
	        	}else{
		        	for(let i=0;i<data.length;i++){
		        		str += `
		        			<tr>
								<td scope="row" align='center'>\${i+1}</td>
								<td><a href='/proj/${projId}/noticeBoardDetail?projNtNum=\${data[i].projNtNum}'>\${data[i].projNtTitle}</a></td>
								<td>\${data[i].memCode}</td>
								<td>\${moment(data[i].projNtWriteDate).format("yyyy-MM-DD")}</td>
							</tr>`
		        	}
	        	}
	        	$("#notice").html(str);
	        } 
		});
		$.ajax({
			type: "post",
	        url: "/proj/${projId}/selectBoard",
	        dataType: "json",
	        beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		  },
	        success: function(data) {
	        	console.log("자유게시판",data);
	        	let str = "";
	        	if(data.length == 0){
	        		str += "<div style='position: absolute;left: 50%;transform: translateX(-50%);'>등록된 자유게시판이 없습니다.</div>";
	        		str += "<br>"
	        	}else{
		        	for(let i=0;i<data.length;i++){
		        		str += `
		        			<tr>
								<td scope="row" align='center'>\${i+1}</td>
								<td><a href='/proj/${projId}/freeBoardDetail?projBdId=\${data[i].projBdId}'>\${data[i].projBdTitle}</a></td>
								<td>\${data[i].writer}</td>
								<td>\${moment(data[i].projBdWriteDate).format("yyyy-MM-DD")}</td>
							</tr>`
		        	}
	        	}
	        	$("#freeBoard").html(str);
	        } 
		});
		$.ajax({
			type: "post",
	        url: "/proj/${projId}/selectErd",
	        dataType: "json",
	        beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		  },
	        success: function(data) {
	        	console.log("erd",data);
	        	let str = "";
	        	if(data.length == 0){
	        		str += "<div style='position: absolute;left: 50%;transform: translateX(-50%);'>등록된 ERD가 없습니다.</div>";
	        		str += "<br>"
	        	}else{
		        	for(let i=0;i<data.length;i++){
		        		str += `
		        			<tr>
		        			<th scope="row">&nbsp;&nbsp;\${i+1}</th>
								<td><a href='/proj/${projId}/erd?erdNum=\${data[i].erdNum}'>\${data[i].erdTitle}</a></td>
								<td>\${data[i].writer}</td>
							</tr>`
		        	}
	        	}
	        	$("#erd").html(str);
	        } 
		});
		$.ajax({
			type: "post",
	        url: "/proj/${projId}/selectWiki",
	        dataType: "json",
	        beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		  },
	        success: function(data) {
	        	console.log("wiki",data);
	        	let str = "";
	        	if(data.length == 0){
	        		str += "<div style='position: absolute;left: 50%;transform: translateX(-50%);'>등록된 위키가 없습니다.</div>";
	        		str += "<br>"
	        	}else{
		        	for(let i=0;i<data.length;i++){
		        		str += `
		        			<tr>
								<th scope="row">&nbsp;&nbsp;\${i+1}</th>
								<td><a href='/proj/${projId}/wiki?wikiId=\${data[i].wikiId}'>\${data[i].wikiTitle}</a></td>
								<td>\${data[i].memCode}</td>
							</tr>`
		        	}
	        	}
	        	$("#wiki").html(str);
	        } 
		});
		$.ajax({
			type: "post",
	        url: "/proj/${projId}/selectPgres",
	        dataType: "json",
	        beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
	            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		  },
	        success: function(data) {
	        	let aData =  Math.round((data.PGRES / (data.TASK *100)) * 100)
	        	let bData =  Math.round(100-aData)
	        	console.log("진척도",data);
	        	if(data.TASK == 0){
	        		
	        	}else{
		        	const myChart = new Chart(ctx, {
		        	    type: 'doughnut',
		        	    data: {
		        	        labels: ['완성률','미완료율'],
		        	        datasets: [{
		        	            label: '# of Votes',
		        	            data: [aData,bData],
		        	            backgroundColor: [
		        	                'rgba(255, 99, 132, 0.2)',
		        	                'rgba(54, 162, 235, 0.2)'
		        	            ],
		        	            borderColor: [
		        	                'rgba(255, 99, 132, 1)',
		        	                'rgba(54, 162, 235, 1)'
		        	            ],
		        	            borderWidth: 1
		        	        }]
		        	    },
		        	    options: {
		        	        scales: {
		        	            y: {
		        	                beginAtZero: true
		        	            }
		        	        }
		        	    }
	        	});
	        	}
	        }
		});
	});
	
</script>
	<!-- BEGIN: Page Vendor JS-->
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/charts/chart.min.js"></script>
	<!-- END: Page Vendor JS-->

	<!-- BEGIN: Page JS-->
	
	<!-- END: Page JS-->