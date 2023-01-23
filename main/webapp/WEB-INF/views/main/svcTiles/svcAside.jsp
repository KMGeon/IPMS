<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	.d-inline{
		color: #404e67 !important;
	}
</style>

<div class="content-left ml-5" style="width: 12%">
<div class="card-head">
		<div class="form-group form-group-compose">
            <!-- compose button  -->
            <a href="/main/svcNotice" class="btn btn btn-glow btn-block my-2 compose-btn" style="background:#00b5b8 !important; color:white;">
                <i class="icon-pin"></i>
                	고객센터
            </a>
        </div>
</div>
	<div class="sidebar-menu-list">
		<!-- sidebar menu  -->
		<div class="list-group" >
			<a href="/main/svcNotice" class="list-group-item" id="inbox-menu">
				<div class="d-inline mr-25">
					<i class="feather icon-volume-1"></i> &nbsp;&nbsp;공지사항
				</div> 
			</a> <a href="/main/svcFaq" class="list-group-item">
				<div class="d-inline mr-25">
					<i class="feather icon-info"></i> &nbsp;&nbsp;자주 묻는 질문
				</div> 
			</a> 
			 <a href="/main/svcQaA" class="list-group-item">
				<div class="d-inline mr-25" >
					<i class="feather icon-help-circle"></i> &nbsp;&nbsp;Q&A
				</div> 
			</a>
		</div>
		<!-- sidebar menu  end-->
	</div>
</div>