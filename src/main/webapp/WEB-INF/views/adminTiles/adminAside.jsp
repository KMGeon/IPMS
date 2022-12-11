<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	.d-inline{
		color: #3F4E89;
	}
</style>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<div class="content-left ml-5" style="width: 12%">
<div class="card-head">
		<div class="form-group form-group-compose">
            <!-- compose button  -->
            <a href="/main/customerServiceMana" class="btn btn btn-glow btn-block my-2 compose-btn" style="background:#3F4E89; color:white;">
                <i class="fa fa-pencil-square-o"></i>
                	관리자 페이지
            </a>
        </div>
	<div class="media p-1">
	    <div class="media-left pr-1"></div>
	    <div class="media-body media-middle">
	        <h5 class="media-heading" style="padding-left: 37px">관리자님 </h5>
	        <h4 class="media-heading" style="font-size: 15px"></h4>	        
	    </div>
	</div>
</div>
	<div class="sidebar-menu-list">
		<!-- sidebar menu  -->
		<div class="list-group" >
			<a href="/main/adminSvcNotice" class="list-group-item" id="inbox-menu">
				<div class="d-inline mr-25">
					<i class="fa fa-paper-plane"></i> &nbsp;&nbsp;고객 센터 관리
				</div> 
			</a> <a href="/main/projManagement" class="list-group-item">
				<div class="d-inline mr-25" >
					<i class="fa fa-th"></i> &nbsp;&nbsp;전체 프로젝트 관리
				</div> 
			</a> <a href="/main/adminMemberManagement" class="list-group-item">
				<div class="d-inline mr-25">
					<i class="fa fa-users"></i> &nbsp;&nbsp;전체 회원 관리
				</div> 
			</a> 
		</div>
		<!-- sidebar menu  end-->
	</div>
</div>