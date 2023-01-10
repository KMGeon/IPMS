<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<div class="row breadcrumbs-top" >
        <div class="breadcrumb-wrapper col-12">
            <ol class="breadcrumb" style="position: relative;margin-right: 15px; font-size: 25px;">
                <li class="breadcrumb-item" style="font-family: noto sans, malgun gothic, AppleGothic, dotum;">자주 묻는 질문</li>
            </ol>
        </div>
    </div>
    <br>
		<div id="accordion"
			style="width: 1000px">
			<c:forEach items="${list}" var="svcNoticeVO" varStatus="stat">
			<div class="card">
				<div class="card-header" id="headingOne">
					<h5 class="mb-0">
						<button class="btn btn-link" data-toggle="collapse"
							data-target="#collapse${stat.count}" aria-expanded="true"
							aria-controls="collapse${stat.count}">
							${svcNoticeVO.siteNtTitle}</button>
					</h5>
				</div>

				<div id="collapse${stat.count}" class="collapse"
					aria-labelledby="heading${stat.count}" data-parent="#accordion">
					<div class="card-body">${svcNoticeVO.siteNtCts}</div>
				</div>
			</div>
			</c:forEach>
		</div>
