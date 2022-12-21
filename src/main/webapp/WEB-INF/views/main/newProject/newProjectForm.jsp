<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="mvo" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<script>
    $(document).ready(function () {
        $("#projName").change(function () {
            var to = $("#projName").val();
            $("#to").attr("value", to);
            console.log(to);
            $("#teamId").val(to);
        })

    })
</script>
<body>
<div class="app-content container center-layout mt-2" style="overflow: auto">
    <div class="content-overlay"></div>
    <div class="content-wrapper">
        <div class="content-body"><!-- Search form-->
            <section id="search-images" class="card overflow-hidden">
                <div class="card-content collapse show">

                    <div class="app-content container center-layout mt-2" style="margin-top: 100px;">
                        <div class="card-header">
                            <h4 class="card-title" style="font-size: xx-large"><strong>전체 프로젝트</strong></h4>
                        </div>
                        <div class="content-wrapper" >
                            <div class="content-body">
                                <div class="content-header row">
                                    <div class="card-content collapse show">
                                        <div class="card-body">
                                            <form action="/main/newProjectPost" class="form-row" method="post">
                                                <div class="form-group col-md-6 mb-2">
                                                    <label for="projStrtDate">Project Name</label>
                                                    <input type="text" id="projName" class="form-control border-primary"
                                                           placeholder="Project Name" name="projName" value=""/>
                                                    <input type="hidden" id="teamId" name="teamId"/>
                                                </div>
                                                <div class="form-group col-md-6 mb-2"></div>

                                                <div class="form-group col-md-6 mb-2"></div>

                                                <div class="form-group col-md-6 mb-2">
                                                </div>
                                                <div class="form-group col-md-6 mb-2">
                                                    <div class="form-group">
                                                        <div style="float: left">
                                                            <label for="projStrtDate">Project Start Date</label>
                                                            <input type="date" id="projStrtDate"
                                                                   class="form-control border-primary"
                                                                   placeholder="Start Date" name="projStrtDate"/>
                                                        </div>
                                                        <div style="float:right;">
                                                            <label for="projEndDate">Project End Date</label>
                                                            <input type="date" id="projEndDate"
                                                                   class="form-control border-primary"
                                                                   placeholder="End Date" name="projEndDate"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-6 mb-2"></div>
                                                <div class="form-group col-md-6 mb-50">
                                                    <img src="/resources/images/IPMSlogo.png"
                                                         style="width: 200px;height: 300px;">
                                                </div>
                                                <div class="form-group col-12 mb-2 file-repeater">
                                                    <div data-repeater-list="repeater-list">
                                                        <div data-repeater-item="">
                                                            <div class="row mb-1">
                                                                <div class="col-9 col-xl-10">
                                                                    <label class="file center-block">
                                                                        <input type="file" id="file">
                                                                        <span class="file-custom"></span>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <button type="button" data-repeater-create=""
                                                            class="btn btn-secondary">
                                                        <i class="icon-plus4"></i> Add new file
                                                    </button>
                                                </div>
                                                <div class="form-group col-12 mb-2">
                                                     <textarea id="userinput8" rows="5" class="form-control" name="projSmry"
                                                               placeholder="소개"></textarea>
                                                </div>
                                                <div style="margin-left: 10px;">
                                                    <button type="submit" data-repeater-create=""
                                                            class="btn btn-secondary"><i
                                                            class="icon-plus4"></i> 등록
                                                    </button>
                                                </div>
                                                <input type="hidden" name="memAuthList[0].memAuth" value="ROLE_MEMBER"/>
                                                <input type="hidden" name="memAuthList[1].memAuth" value="ROLE_PROJECT_LEADER"/>
                                                <sec:authorize access="isAuthenticated()">
                                                    <input type="hidden" name="memEmail"
                                                           value="<sec:authentication property="principal.username"/>"/>
                                                    <input type="hidden" name="memCode" value="${mvo.member.memCode}"/>
                                                    <input type="hidden" name="" value="${mvo.member}"/>
                                                </sec:authorize>
                                                <sec:csrfInput/>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</div>
</body>
<script>
    CKEDITOR.replace('userinput8');
</script>
