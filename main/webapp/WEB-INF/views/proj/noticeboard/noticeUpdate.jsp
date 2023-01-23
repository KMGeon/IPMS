<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/join.css">
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="mvo" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/>
<head>

</head>
<!-- END: Head-->
<!-- BEGIN: Body-->

<body>
	<!-- BEGIN: Content-->
	<div class="content-body">
		<!-- Basic form layout section start -->
		<section id="basic-form-layouts">
			<div class="row match-height">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header" style="text-align: center;">
							<h4 class="form-section" style="font-family: 'MICEGothic Bold';">
								<i class="feather icon-edit"
									style="color: #0D47A1; padding-right: 5px;"></i>공지사항 수정하기
							</h4>
							<hr>
						</div>
						<div class="card-content collapse show">
							<div class="card-body">
								<form class="form" action="/proj/${projId}/noticeBoardUpdatePost" method="post" 
									enctype="multipart/form-data">
									<div class="row justify-content-md-center">
										<div class="col-md-6">
											<div class="form-body">
												<div class="form-group">
													<label for="projNtTitle">제목</label> <input type="text"
														id="projNtTitle" class="form-control"
														placeholder="제목을 입력해주세요." name="projNtTitle" value="${data.projNtTitle}" required>
												</div>

												<div class="form-group">
													<label for="projNtCts">내용</label>
													<textarea cols="5" id="projNtCts" class="form-control"
														placeholder="내용을 입력해주세요." name="projNtCts" required>${data.projNtCts}</textarea>
												</div>

											<div class="form-group">
												<label for="itgrnAttachFileNum"></label><br><label id="itgrnAttachFileNum"
													class="file center-block"> <input type="file"
													id="itgrnAttachFileNum" name="uploadFile" multiple> <span class="file-custom"></span>
												</label>
											</div>
											<div>
												<!--data.intgAttachFileVOList => List<IntgAttachFileVO> intgAttachFileVOList -->
												<i class="feather icon-link"></i>첨부파일:&nbsp;
												<c:forEach var="intgAttachFileVO" items="${data.intgAttachFileVOList}">
													${intgAttachFileVO.fileName}
												</c:forEach>
											</div>
											</div>
											<div class="form-actions center"
												style="padding-top: 50px; padding-bottom: 120px;">
												<button type="submit" class="btn btn-secondary" id="updateNt">
													<i class="fa fa-check-square-o"></i> 등록
												</button>
												<a href="/proj/${projId}/noticeBoardDetail?projNtNum=${data.projNtNum}" class="btn btn-warning mr-1" id="cancelBtn">
													<i class="feather icon-x"></i> 취소
												</a>
											</div>
										</div>
									</div>
										<input type="hidden" id="projNtNum" name="projNtNum" value="${data.projNtNum}">
<%-- 									<sec:authentication property="principal.freeboardVO.projBdId"/> --%>
<!-- 									<input type="hidden" id="projId" name="projId"/> -->
<!-- 									<input type="hidden" id="deleteYn" name="deleteYn"/> -->
<!-- 									<input type="hidden" id="itgrnAttachFileNum" name="itgrnAttachFileNum" /> -->
									<input type="hidden" id="memCode" name="memCode" value="<sec:authentication property='principal.member.memCode'/>" />
									<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
									<sec:csrfInput />
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- // Basic form layout section end -->
	</div>
	<!-- END: Content-->
</body>
<!-- END: Body-->
</html>

<script type="text/javascript">
CKEDITOR.replace('projNtCts');
</script>

<script>

$(document).ready(function() {

	 ClassicEditor.create(document.querySelector('#projNtCts'), {
		    language: "ko",
		    height : 300
		    
	  });
});
</script>