<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="mvo" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/join.css">
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/forms/selects/select2.min.css">
<script
	src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/forms/select/select2.full.min.js"></script>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
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

<div class="card-body">
	<h3 style="font-family: noto sans, malgun gothic, AppleGothic, dotum; padding-bottom:30px;">게시물 등록</h3><br>
	
	<form class="form" style="max-width: 80%;" action="/main/adminNoticeInsert" method="post">
	<div class="form-body">
	<label for="donationinput1">게시물 분류</label><br>
		<select name="ntCtgCode" style="width:30%;">
				<option value="notice">공지사항</option>
				<option value="faq">자주묻는 질문</option> 
		</select>		
			<div class="form-group" style="padding-top:20px;">
				<label for="donationinput1">게시물 제목</label> <input type="text"
					id="donationinput1" class="form-control square" placeholder="제목을 입력하세요."
					name="siteNtTitle">
			</div>
			<div class="form-group">
				<label for="donationinput2">게시물 내용</label><br>
				<textarea id="editor" class="summernote" name="siteNtCts"></textarea> 
			</div>
		</div>
		<sec:csrfInput/>
		<div class="form-actions right">
			<button type="submit" class="btn btn-secondary">
				<i class="fa fa-check-square-o"></i> 등록
			</button>
			<button type="reset" class="btn btn-danger mr-1">
				<i class="feather icon-x"></i> 취소
			</button>
		</div>
	</form>

</div>

<script type="text/javascript">
		$('select').select2({
			minimumResultsForSearch: Infinity
		});
	
		CKEDITOR.replace('siteNtCts',
				{
					height:'150px'
			
			});
</script>
