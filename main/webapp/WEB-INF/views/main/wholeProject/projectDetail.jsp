<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="mvo"
	value="${SPRING_SECURITY_CONTEXT.authentication.principal}" />
<c:set var="auth"
	value="${SPRING_SECURITY_CONTEXT.authentication.authorities}" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/join.css">
<script type="text/javascript"
	src="/resources/stack-admin-v4.0/stack-admin/src/js/core/libraries/jquery.min.js"></script>
<head>
<style>
body {
	background-color: #edf1f5;
	margin-top: 20px;
}

.card {
	margin-bottom: 30px;
}

.card {
	position: relative;
	display: flex;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	border: 0 solid transparent;
	border-radius: 0;
}

.card .card-subtitle {
	font-weight: 300;
	margin-bottom: 10px;
	color: #8898aa;
}

.table-product.table-striped tbody tr:nth-of-type(odd) {
	background-color: #f3f8fa !important
}

.table-product td {
	border-top: 0px solid #dee2e6 !important;
	color: #728299 !important;
}
</style>
<script>
    $(function(){
    	$("#markBtn").on("click",function(){
    		let memCode = "${mvo.member.memCode}";
        	console.log("memCode : " , memCode);
        	let data = {
        				"memCode" : memCode
        			};
        	
        	$.ajax({
                url: "/main/${projId}/markInsert",
                type: "post",
                contentType : "application/json;  charset=utf-8",
                data: JSON.stringify(data),
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
                success: function (division) {
                	alert("북마크 등록 완료")
              		location.reload();
                },error : function(division){
                	
                }
            })
        })
    })
    
    function fn_joinProject(projId){
        $.ajax({
            url: "/main/joinProject",
            type: "post",
            data: {"projId" : projId},
            beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function (data) {
                alert("신청을 보냈습니다.")
              location.href="/main/wholeProject";
            },
            error:function(){
                alert("이미 신청한 프로젝트입니다.");
                location.href="/main/wholeProject";
            }
        })

    }
    
    
    </script>
</head>
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<body>
	<div class="container" style="margin-top: 30px;">
		<div class="card">
			<div class="card-body">
				<div class="row" style="align-items: center;">
					<div class="col-4" style="align-items: center">
<!-- 						<div class="row" style="width: 38%; justify-content: center; align-items: center;"> -->
							<div style="text-align: center; flex:1; padding-bottom:5px;">
								<c:forEach var="item" items="${checkMyProject}">
									<c:if test="${item.memCode ne mvo.member.memCode}">
										<button class="btn btn-outline-secondary round" style="width:110px;"
											onclick="fn_joinProject('${projId}')">
											<i class="fa fa-user-o" style="color:#02b5b8;"></i>&nbsp;&nbsp;가입 신청</button>
									</c:if>
								</c:forEach>&nbsp;&nbsp;&nbsp;&nbsp;
								<button id="markBtn" class="btn btn-outline-secondary round" style="width:110px;">
									<i class="feather icon-heart" style="color:red;"></i>&nbsp;&nbsp;북마크</button>
							</div>
<!-- 						</div> -->
						<c:forEach var="item" items="${detailList}" varStatus="idx">
							<div style="margin:auto; text-align:center; padding-top:20px;">
								<img src="/resources/upload/img/${item.projImgRoute}"
									class="img-responsive" style="width:250px; height:250px;">
							</div>
					</div>
					<div class="col-8" style="padding-left: 25px; align-items: center;">
						<div>
							<h2 class="text-primary"
								style="font-family: noto sans, malgun gothic, AppleGothic, dotum;">
								${item.projName}
<%-- 								(<span class="card-subtitle">${projId}</span>) --%>
							</h2>
						</div>
						<hr>
						<div style="padding-top: 10px; padding-bottom: 30px;">
							<h4
								style="font-family: noto sans, malgun gothic, AppleGothic, dotum;">
								<strong>프로젝트 기간</strong><small class="text-primary">&nbsp;(<fmt:formatDate
										value="${item.projStrtDate}" />~<fmt:formatDate
										value="${item.projEndDate}" />)
								</small>
							</h4>
						</div>
						<div style="padding-bottom: 6px;">
							<h4
								style="font-family: noto sans, malgun gothic, AppleGothic, dotum;">
								<strong>프로젝트 리더</strong>
							</h4>
						</div>
						<div>
							<c:forEach var="getDetailLeaderInfo"
								items="${getDetailLeaderInfo}">
								<ul class="list-unstyled">
									<li><i class="fa fa-check text-success"></i>&nbsp;이름 :
										${getDetailLeaderInfo.memName}</li>
								</ul>
							</c:forEach>
						</div>
						<div>
							<h4
								style="font-family: noto sans, malgun gothic, AppleGothic, dotum; padding-top: 20px; padding-bottom: 15px;">
								<strong>프로젝트 소개</strong>
							</h4>
							<div class="form-control border-secondary"
								style="width: 727px; height: 115px; padding-bottom:5px; overflow: auto;">
								<p>${item.projSmry}</p>
							</div>
						</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<!-- 댓글 입력 창----------------------------------------------------------------------- -->
		<div class="card mb-2" style="width: 1340px; height: auto;"
			id="inputCmt">
			<div class="card-body">
					<form class="form-horizontal">
						<div class="row">
							<div class='col-sm-10'>
								<input type="text" class="form-control" id="projSmryCmtCts"
									name="projSmryCmtCts" placeholder="내용을 입력하세요." />
							</div>
							<div class='col-sm-2'>
								<button type="button" class="btn btn-secondary"
									style="width: 150px;" id="projCmtAdd">댓글 등록</button>
							</div>
						</div>
						<input type="hidden" class="form-control" id="projBdCmtId" name="projBdCmtId" value="${ProjSmryCmtVO.projSmryCmtNum}">
						<input type="hidden" class="form-control" id="memCode" name="memCode" value="${ProjSmryCmtVO.memCode}">
						<input type="hidden" class="form-control" id="projId" name="projId" value="${projId}">
					</form>
			</div>
		</div>
		<!-- 댓글 입력 창 끝 ------------------------------------------------------------------------->
		<div class="card mb-2 card border-top-info border-top-2 box-shadow-0"
			style="width: 1340px; height: auto;">
			<div class="card-header"
				style="padding: 13px; color: #455A64; font-size: 15px;">
				Comments&nbsp;<i class="fa fa-comment fa"></i>
			</div>
			<div class="card-body" id="cmtList">
				<div class="user-block">
					<!-- ------------------------------------------------- -->
					<c:forEach var="ProjSmryCmtVO" items="${dataCmt}" varStatus="stat">
						<c:if test="${ProjSmryCmtVO.highCmtId eq null}">
							<!-- 상위댓글 view -->
							<div>
							<form style="padding-bottom: 20px;" class='form-horizontal'>
								<div class='user-block'>
									<div>
										<div style='padding-bottom: 5px;'>
											<div style='font-size: 15px; color:#02b5b8;'>
												<i class='fa fa-user-o'></i>&nbsp;&nbsp;<b>${ProjSmryCmtVO.memCode}</b>
											<span style='font-size: 8px; color: grey; padding-left:5px;'>
												<fmt:formatDate value="${ProjSmryCmtVO.projSmryCmtWriteDate}" pattern="yyyy-MM-dd HH:mm" /></span>
											</div>
										</div>
										<div id="cmtCts" style="display:flex; align-items:center;">
											<div id="cts${ProjSmryCmtVO.projSmryCmtNum}">${ProjSmryCmtVO.projSmryCmtCts}</div>&nbsp;&nbsp;
												<div id="ctsInput${ProjSmryCmtVO.projSmryCmtNum}" style="padding-top:7px; padding-bottom:7px; display:none; width:450px;">
										            <div style="display:inline-block; align-items:center;">
										              <input type="text" class="form-control" id="lowCmtInsert${ProjSmryCmtVO.projSmryCmtNum}" name="projSmryCmtCts" placeholder="댓글을 입력하세요." style="width:300px;">
										            </div>
										            <div style="display:inline-block; align-items:center;">
										              <button onclick="fn_lowCmtInsertOK('${ProjSmryCmtVO.projSmryCmtNum}')" type="button" class="btn btn-secondary" style="width: 55px;">등록</button>
										            </div>
											    </div>
<%-- 											<c:if test="${ProjSmryCmtVO.deleteYn eq 'y' && ProjSmryCmtVO.highCmtId eq null}"> --%>
<!-- 												<div id="delCts">삭제된 댓글입니다.</div> -->
<%-- 											</c:if> --%>
											<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<span id="fnEdit${ProjSmryCmtVO.projSmryCmtNum}">
												<!-- 로그인한 회원과 댓글 작성자가 일치하면 댓글 수정,삭제 버튼 -->
													<div style="padding-left:20px;"> 
														<a id="lowCmtOpen${ProjSmryCmtVO.projSmryCmtNum}" style="font-size: 12px; text-decoration: underline;" onclick="fn_lowCmtInsert('${ProjSmryCmtVO.projSmryCmtNum}')" type="button">댓글작성</a>&nbsp;&nbsp;
													<c:if test="${ProjSmryCmtVO.memEmail eq mvo.member.memEmail}">
														<a style='color: red; font-size: 12px; text-decoration: underline; padding-right:5px;' onclick='fn_delete(${ProjSmryCmtVO.projSmryCmtNum})' type='button'>삭제</a>
				                            			<a style='color: grey; font-size: 12px; text-decoration: underline;' id='cmtModify' type='button' onclick="fn_update('${ProjSmryCmtVO.projSmryCmtNum}','${stat.index}')">수정</a>
													</c:if>
													</div>
												</span>
												<span id="fnUpdate${ProjSmryCmtVO.projSmryCmtNum}" style="display:none;">
													<input type="text" class="form-control" id="projSmryCmtCts${ProjSmryCmtVO.projSmryCmtNum}" name="projSmryCmtCts" value="${ProjSmryCmtVO.projSmryCmtCts}" style="display: none; width: 500px; padding-bottom:5px;" />
													<button type="button" class="btn btn-warning btn-sm" onclick="fn_updateCancel(${ProjSmryCmtVO.projSmryCmtNum}, '${stat.index}')" style="width:50px; float:right; margin:3px;">취소</button>
													<button type="button" class="btn btn-secondary btn-sm" onclick="fn_updateGo(${ProjSmryCmtVO.projSmryCmtNum}, '${stat.index}')" style="width:50px; float:right; margin:3px;">등록</button>
												</span>
	                            			</div>
										</div>
									</div>
								</div>
								<input type="hidden" class="form-control" id="projSmryCmtNum" name="projSmryCmtNum" value="${ProjSmryCmtVO.projSmryCmtNum}">
								<input type="hidden" id="writer" name="writer" value="<sec:authentication property='principal.member.memCode'/>" />
							</form>
							</div>
							<!-- ------------------------------------------------ -->
						</c:if>
						<!-- 하위댓글 view -->
						<c:forEach var="ProjSmryCmtVO2" items="${dataCmt}">
							<c:if test="${ProjSmryCmtVO.projSmryCmtNum eq ProjSmryCmtVO2.highCmtId}">
								<div>
									<form style="padding-left:20px; padding-bottom: 10px;" class='form-horizontal'>
										<div>
											<div style="padding-bottom: 5px;" id="${ProjSmryCmtVO2.projSmryCmtNum}">
												<span class="username"> </span>
												<div style="font-size: 15px; color:#3B4897;">
													<i class="feather icon-corner-down-right"></i><i
													class="feather icon-user"></i> <b>${ProjSmryCmtVO2.memCode}</b><span
													style="font-size: 8px; color: grey; padding-left:5px;"><fmt:formatDate value="${ProjSmryCmtVO2.projSmryCmtWriteDate}" pattern="yyyy-MM-dd HH:mm" /></span>
												</div>
											</div>
											<div id="cmtCts2" style="display: flex;">
												<div style="display: flex;" id="lowCts${ProjSmryCmtVO2.projSmryCmtNum}">&nbsp;&nbsp;&nbsp;&nbsp;${ProjSmryCmtVO2.projSmryCmtCts}&nbsp;&nbsp;</div>
												&nbsp;&nbsp;&nbsp;&nbsp;
												<input style="width: 400px;" type="hidden" value="${ProjSmryCmtVO2.projSmryCmtCts}">
												<span id="fnEdit${ProjSmryCmtVO2.projSmryCmtNum}">
													<c:if test="${ProjSmryCmtVO2.memEmail eq mvo.member.memEmail}">
														<a style="color: red; font-size: 12px; text-decoration: underline;" onclick="fn_delete('${ProjSmryCmtVO2.projSmryCmtNum}')" type="button">삭제</a>&nbsp;
														<a style="color: grey; font-size: 12px; text-decoration: underline;" onclick="fn_update2('${ProjSmryCmtVO2.projSmryCmtNum}','${stat.index}')" type="button">수정</a>
													</c:if>
												</span>
												<span id="fnUpdate${ProjSmryCmtVO2.projSmryCmtNum}" style="display:none;">
													<input type="text" class="form-control" id="projSmryCmtCts${ProjSmryCmtVO2.projSmryCmtNum}" name="projSmryCmtCts" value="${ProjSmryCmtVO2.projSmryCmtCts}" style="display: none; width: 500px; padding-bottom:5px;" />
													<a class="btn btn-warning btn-sm" onclick="fn_updateCancel2(${ProjSmryCmtVO2.projSmryCmtNum}, '${stat.index}')" style="color:white; width:50px; float:right; margin:3px;">취소</a>
													<a class="btn btn-secondary btn-sm" onclick="fn_updateGo(${ProjSmryCmtVO2.projSmryCmtNum}, '${stat.index}')" style="color:white; width:50px; float:right; margin:3px;">등록</a>
												</span>
											</div>
										</div>
										<br>
										<input type="hidden" class="form-control" id="projSmryCmtNum" name="projSmryCmtNum" value="${ProjSmryCmtVO2.projSmryCmtNum}">
										<input type="hidden" id="writer" name="writer" value="<sec:authentication property='principal.member.memCode'/>" />
									</form>
								</div>
							</c:if>
						</c:forEach>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript">

var mine = "${mvo.member.memCode}";
var mine2 = "${mvo.member.memEmail}";

// 댓글 등록
	$("#projCmtAdd").on("click",function() {
		
		alert("댓글 등록 떠라");
		
		let projId = $("#projId").val();
		let projSmryCmtNum = $("#projSmryCmtNum").val();		// 댓글 번호
		let memCode = mine;										// 댓글 작성자
		let projSmryCmtCts = $("#projSmryCmtCts").val();		// 댓글 내용
		
		console.log("projId: " + projId);
		console.log("projSmryCmtNum: " + projSmryCmtNum);
		console.log("memCode: " + memCode);
		console.log("projSmryCmtCts: " + projSmryCmtCts);
	
		let data = {"projId":projId,"projSmryCmtNum":projSmryCmtNum,"memCode":memCode,"projSmryCmtCts":projSmryCmtCts};	
		
		$.ajax({
			url:"/main/{projId}/projCmtInsert",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			dataType:"json",
			type:"post",
	   		beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success: function(result) {
				console.log("result : " + result);
				
				alert("댓글 작성 성공!");
	
				location.reload();
			},
			error:function(request,status,error){
	            alert("댓글 작성 실패. 다시 시도해주세요.");
	        }
		});	// ajax end
		
		$("#projSmryCmtCts").val("");
		
});

	//하위 댓글 등록 창 열기
	function fn_lowCmtInsert(param, idx){
		
		alert(param+" : "+idx);
		
		$("#ctsInput"+param).css("display","block");
//		$("#cts"+param).css("display","none");
		$("#fnEdit"+param).css("display","none");
	}

	//하위 댓글 등록
	function fn_lowCmtInsertOK(param, idx){
		
		alert("대댓글 등록 떠라"+param);
		
		let projId = $("#projId").val();
		let memCode = mine;										// 댓글 작성자
		let projSmryCmtNum = $("#projSmryCmtNum"+param).val();		// 댓글 번호
//		let projSmryCmtCts = $("#projSmryCmtCts"+param).val();
		let projSmryCmtCts = $("#lowCmtInsert"+param).val();	// 댓글 내용
		
		console.log("projId: " + projId);
		console.log("projSmryCmtNum: " + projSmryCmtNum);
		console.log("memCode: " + memCode);
		console.log("projSmryCmtCts: " + projSmryCmtCts);
	
		let data = {"projId":projId,"projSmryCmtNum":projSmryCmtNum,"memCode":memCode,"projSmryCmtCts":projSmryCmtCts,"highCmtId":param};	
		
		$.ajax({
			url:"/main/{projId}/projCmtInsert2",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			dataType:"json",
			type:"post",
	   		beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success: function(result) {
				console.log("result : " + result);
				
				alert("대댓글 작성 성공!");
	
				location.reload();
			},
			error:function(request,status,error){
	            alert("대댓글 작성 실패. 다시 시도해주세요.");
	        }
		});	// ajax end
		
		$("#projSmryCmtCts").val("");
	}

	// 상위댓 수정 창 열기
	function fn_update(param, idx) {
		
 		let data = {"projSmryCmtNum":param, "idx":idx};

		console.log("data: " + JSON.stringify(data));
		
		$("#projSmryCmtCts"+param).css("display","block");
		$("#fnUpdate"+param).css("display","block");
		$("#fnEdit"+param).css("display","none");
		$("#lowCmtInsert"+idx).css("display","none");
		$("#cts"+param).css("display","none");
		
	}
	
	// 하위댓 수정 창 열기
	function fn_update2(param, idx) {
 		let data = {"projSmryCmtNum":param, "idx":idx};

		console.log("data: " + JSON.stringify(data));
		//projSmryCmtCts3
		$("#projSmryCmtCts"+param).css("display","block");
		$("#fnUpdate"+param).css("display","block");
		$("#fnEdit"+param).css("display","none");
		$("#lowCts"+param).css("display","none");
		
	}
	
	// 상위댓 수정 취소
	function fn_updateCancel(param, idx){
		  location.reload();
		}
	
	// 하위댓 수정 취소
	function fn_updateCancel2(param, idx){
		  location.reload();
		}
	
	// 수정 완료 버튼
	function fn_updateGo(param, idx) {
		
		alert("수정버튼 : " + param + " : " + idx);
		
		//기본키
		let projSmryCmtNum = param;
		
		//내용
		let projSmryCmtCts = $("#projSmryCmtCts"+param).val();
		
		let data = {"projSmryCmtNum":projSmryCmtNum,"projSmryCmtCts":projSmryCmtCts};
		
		console.log("data: " + JSON.stringify(data));
		
		$.ajax({
			url:"/main/{projId}/projCmtUpdate",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			dataType:"json",
			type:"post",
	   		beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success: function(result) {
				console.log("result : " + result);
				
				if(result > 0) {
					alert("댓글을 수정하였습니다.");
					location.reload();
				} else {
					alert("수정 실패. 다시 시도해주세요.");
				}
			},

		});	// ajax end
		
	}
	
	
	// 댓글 삭제
	function fn_delete(param){
		
		alert("삭제 눌렀엉");
		
		console.log("this: ",param);
		
	//	let projSmryCmtNum = $("#projSmryCmtNum").val(); // 댓글 번호

		let data = {"projSmryCmtNum":param};
		
		console.log("data: " + JSON.stringify(data));
		
		// 아자작
		$.ajax({
			url:"/main/{projId}/projCmtDel",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			dataType:"json",
			type:"post",
			beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success: function(result) {
			
			console.log("result: " + JSON.stringify(result));
			
			// result가 0보다 크면 성공, 아니면 실패
			if(result > 0) {
				alert("댓글을 삭제하였습니다.");
				location.reload();
				
			} else {
				alert("삭제 실패. 다시 시도해주세요.");
			}
		}
		}); // ajax end
		
	}; // 댓글 삭제 end

</script>

</body>
</html>