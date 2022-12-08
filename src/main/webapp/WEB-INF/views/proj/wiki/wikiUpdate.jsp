<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
	<h1>위키 업데이트</h1><br>
	<form class="form" style="max-width: 80%;" action="/proj/wikiUpdate" method="post">
		<div class="form-body">
			<div class="form-group">
				<input type="hidden" name="wikiId" value="${list.wikiId}">
				<select class="form-control" name="highWikiId">
					
						<c:forEach items="${highWikiId}" var="id">
						<c:if test="${id.wikiId == list.wikiId}">
							<c:if test="${id.highWikiId == 0}">
								<option value="" selected>${id.wikiTitle}</option>	
								
							</c:if>
						</c:if>
						<option value="${id.wikiId}">${id.wikiTitle}</option>
						</c:forEach>
				</select>
			</div>
			<div class="form-group">
				<label for="donationinput1">위키 제목</label> <input type="text"
					id="donationinput1" class="form-control square" placeholder="위키 제목"
					name="wikiTitle" value="${list.wikiTitle}">
			</div>

			<div class="form-group">
				<label for="donationinput2">위키 내용</label><br>
				<textarea id="editor" class="summernote" name="wikiCts">${list.wikiCts}</textarea> 
			</div>
		</div>

		<div class="form-actions right">
			<a class="btn btn-warning mr-1" href="/proj/wiki">
				<i class="feather icon-x"></i> Cancel
			</a>
			<button type="submit" class="btn btn-primary">
				<i class="fa fa-check-square-o"></i> Save
			</button>
		</div>
	</form>

</div>
<script type="text/javascript">
		$('select').select2();
</script>