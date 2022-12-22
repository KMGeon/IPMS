<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="mvo" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<script>
    $(document).ready(function () {
        $("#joinBtn").on("click", function () {
            let fData = $("#joinData").serialize();
            console.log(fData);
            $.ajax({
                url: "/main/joinProject",
                type: "post",
                data: fData,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
                success: function (division) {
                    if (division == 1) {
                        alert("신청 보냈음");
                        $("#joinBtn").css("display", "none");
                    } else {
                        alert("오류입니다.");
                    }
                }
            })
        })
    });
</script>
<body>
<div class="app-content container center-layout mt-2" style="overflow: auto">
    <div class="content-overlay"></div>
    <div class="content-wrapper">
        <div class="content-body"><!-- Search form-->
            <section id="search-images" class="card overflow-hidden">
                <c:forEach var="item" items="${detailList}" varStatus="idx">
                <form id="joinData">
                    <input type="hidden" name="memCode" value="${mvo.member.memCode}">
                    <input type="hidden" name="projId" value="${item.projId}">
                    <input type="hidden" name="teamId" value="${item.projName}">
                </form>
                <div class="card-content collapse show">

                    <div class="app-content container center-layout mt-2" style="margin-top: 100px;">
                        <div class="card-header">
                            <h4 class="card-title" style="font-size: xx-large"><strong>전체 프로젝트</strong></h4>
                            <br>
                            <i class="icon-users"> Mmeber List &nbsp;</i>

                            <div style="text-decoration: underline; margin-bottom: 5px;"
                                 class="badge badge-secondary">${item.projId}</div>
                        </div>
                        <div>
                            <button type="button" id="joinBtn" class="btn btn-primary btn-min-width mr-1 mb-1"><i
                                    class="fa fa-user-o"></i> 가입하기
                            </button>
                            <button type="button" class="btn btn-success btn-min-width mr-1 mb-1"><i
                                    class="fa fa-star-o"></i> 북마크
                            </button>
                        </div>
                    </div>
                    <div class="content-wrapper">
                        <div class="content-body">
                            <div class="content-header row">
                                <div class="card-content collapse show">
                                    <div class="card-body">
                                        <form class="form-row">
                                            <div class="form-group col-md-6 mb-2">
                                                <label for="projStrtDate">Project Name</label>
                                                <input type="text" id="projName" class="form-control border-primary" placeholder="Project Name" name="projName" value="${item.projName}" readonly/>
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

                                                        <input type="text" id="projStrtDate"
                                                               class="form-control border-primary"
                                                               placeholder="Start Date" name="projStrtDate"
                                                               value="<fm:formatDate value="${item.projStrtDate}"/>" readonly>
                                                    </div>
                                                    <div style="float:right;">
                                                        <label for="projEndDate">Project End Date</label>
                                                        <input type="text" id="projEndDate"
                                                               class="form-control border-primary"
                                                               placeholder="Start End" name="projEndDate"
                                                               pattern="yyyy-MM-dd" value="<fm:formatDate value="${item.projEndDate}"/>"
                                                               readonly/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-6 mb-2"></div>
                                            <div class="form-group col-md-6 mb-50">
                                                <img src="/resources/images/IPMSlogo.png"
                                                     style="width: 200px;height: 300px;">
                                            </div>
                                            <div class="form-group col-12 mb-2">
                                                <textarea id="userinput8" rows="5" class="form-control" name="projSmry"
                                                          placeholder="소개 " readonly>${item.projSmry}</textarea>
                                            </div>
                                            <div style="margin-left: 10px;">
                                                <button type="submit" data-repeater-create="" class="btn btn-secondary">
                                                    <i class="icon-plus4"></i> 가입하기
                                                </button>
                                            </div>
                                            <input type="hidden" name="memAuthList[0].memAuth"
                                                   value="ROLE_MEMBER"/>
                                            <input type="hidden" name="memAuthList[1].memAuth"
                                                   value="ROLE_PROJECT_LEADER"/>
                                            <sec:authorize access="isAuthenticated()">
                                                <input type="hidden" name="memEmail"
                                                       value="<sec:authentication property="principal.username"/>"/>
                                                <input type="hidden" name="memCode"
                                                       value="${mvo.member.memCode}"/>
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
        </c:forEach>
        </section>
    </div>
</div>
</div>
</body>
<script>
    <script>
        CKEDITOR.replace('userinput8');
</script>
