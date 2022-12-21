<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="mvo" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/forms/selects/select2.min.css">
<script
	src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/forms/select/select2.full.min.js"></script>
 <script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
 <script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
 <style>
  .ck.ck-editor {
    max-width: 100%;
  }
  .ck-editor__editable {
    min-height: 500px;
  }
  input {
  	max-width: 100%;
  }
  select {
	max-width: 100%;
	}
</style>
<script>

$(document).ready(function() {
	//여기 아래 부분
	 ClassicEditor.create( document.querySelector( '#editor' ), {
		    language: "ko",
		    height : 300
		    
		  } );
});
</script>


<div class="card-body">
	<h1>위키 등록</h1><br>
	<form class="form" style="max-width: 80%;" action="/proj/${projId}/wikiInsert" method="post">
		<div class="form-body">
			<div class="form-group">
				<select class="form-control" name="highWikiId">
					<option value="" selected>상위 위키 선택</option>
						<c:forEach items="${highWikiId}" var="id">
								<option value="${id.wikiId}">${id.wikiTitle}</option>				
						</c:forEach>
				</select>
			</div>
			<div class="form-group">
				<label for="donationinput1">위키 제목</label> <input type="text"
					id="donationinput1" class="form-control square" placeholder="위키 제목"
					name="wikiTitle">
			</div>

			<div class="form-group">
				<label for="donationinput2">위키 내용</label><br>
				<textarea id="editor" class="summernote" name="wikiCts"></textarea> 
			</div>

<!-- 				<label for="donationinput2">파일 첨부</label><br> -->
<!-- 			<div class="custom-file"> -->
<!-- 				<input type="file" class="custom-file-input" id="inputGroupFile01"> -->
<!-- 				<label class="custom-file-label" for="inputGroupFile01">Choose -->
<!-- 					file</label> -->
<!-- 			</div> -->
		</div>
		<sec:csrfInput/>
		<input type="hidden" name="projId" value="${projId}">
		<input type="hidden" name="memCode" value="${mvo.member.memCode}">
		<div class="form-actions right">
			<button type="reset" class="btn btn-warning mr-1">
				<i class="feather icon-x"></i> Cancel
			</button>
			<button type="submit" class="btn btn-primary">
				<i class="fa fa-check-square-o"></i> Save
			</button>
		</div>
	</form>

</div>

<script type="text/javascript">
		$('select').select2();
</script>