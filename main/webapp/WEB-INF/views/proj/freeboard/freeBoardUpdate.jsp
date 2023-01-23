<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
									style="color: #0D47A1; padding-right: 5px;"></i>글 수정하기
							</h4>
							<hr>
						</div>
						<div class="card-content collapse show">
							<div class="card-body">
								<form class="form" action="/proj/${projId}/freeBoardUpdatePost" method="post">
									<div class="row justify-content-md-center">
										<div class="col-md-6">
											<div class="form-body">
												<div class="form-group">
													<label for="projBdTitle">제목</label> <input type="text"
														id="projBdTitle" class="form-control"
														placeholder="제목을 입력해주세요." name="projBdTitle" value="${data.projBdTitle}" required>
												</div>

												<div class="form-group">
													<label for="projBdCts">내용</label>
													<textarea cols="5" id="projBdCts" class="form-control"
														placeholder="내용을 입력해주세요." name="projBdCts" required>${data.projBdCts}</textarea>
												</div>

<!-- 											<div class="form-group"> -->
<!-- 												<label for="itgrnAttachFileNum">첨부파일</label><br><label id="itgrnAttachFileNum" -->
<!-- 													class="file center-block"> <input type="file" -->
<!-- 													id="itgrnAttachFileNum"> <span class="file-custom"></span> -->
<!-- 												</label> -->
<!-- 											</div> -->
											
											</div>
											<div class="form-actions center"
												style="padding-top: 50px; padding-bottom: 120px;">
												<button type="submit" class="btn btn-secondary" id="updateFree">
													<i class="fa fa-check-square-o"></i> 등록
												</button>
												<a href="/proj/${projId}/freeBoardDetail?projBdId=${data.projBdId}" class="btn btn-warning mr-1" id="cancelBtn">
													<i class="feather icon-x"></i> 취소
												</a>
											</div>
										</div>
									</div>
<%-- 										<input type="hidden" id="writer" name="writer" value="${data.writer}"> --%>
<%-- 										<input type="hidden" id="deleteYn" name="deleteYn" value="${data.deleteYn}"> --%>
										<input type="hidden" id="projBdId" name="projBdId" value="${data.projBdId}">
										<input type="hidden" id="projId" name="projId" value="${projId}">
										<input type="hidden" id="writer" name="writer" value="<sec:authentication property='principal.member.memCode'/>" />
<%-- 									<sec:authentication property="principal.member"/> --%>
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
CKEDITOR.replace('projBdCts');
</script>

<script>

$(document).ready(function() {

	 ClassicEditor.create(document.querySelector('#projBdCts'), {
		    language: "ko",
		    height : 300
		    
	  });
});
</script>