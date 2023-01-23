<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="mvo" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/join.css">
<script src="/resources/js/jquery-3.6.0.js"></script>
<script>
    function myFunction() {
        let value = $("#startDate").val();
        let year = value.substring(2, 4);
        let month = value.substring(5, 7);
        let day = value.substring(8, 10);
        let inputDateVal = year + "/" + month + "/" + day;
        console.log(inputDateVal);
        $("#startDateVal").val(inputDateVal);
    }

    function myFunction2() {
        let value = $("#endDate").val();
        let year = value.substring(2, 4);
        let month = value.substring(5, 7);
        let day = value.substring(8, 10);
        let inputDateVal2 = year + "/" + month + "/" + day;
        console.log(inputDateVal2);
        $("#endDateVal").val(inputDateVal2);
    }


    $(function () {
        $(function () {
            $("#testOption").change(function () {
                let test = $("#testOption").val($(this).val());
                if (test.val() == 'D') {
                    $("#keyWordInput").css("display", "none");
                    $("#startDate").css("display", "block");
                    $("#endDate").css("display", "block");
                }
            });
        });
    })


</script>
<div class="app-content container center-layout mt-2" style="overflow: auto">
    <div class="content-overlay"></div>
    <div class="content-wrapper">
        <div class="content-body"><!-- Search form-->
            <section id="search-images" class="card overflow-hidden">
                <div class="card-header">
                    <a class="heading-elements-toggle"><i class="fa fa-ellipsis-v font-medium-3"></i></a>
                </div>
                <div class="card-content collapse show">
                    <div class="card-body pb-0">
                    </div>

                    <!--Search Navbar-->
                    <div class="row">
                        <div class="col-sm-12 col-md-7"></div>
                        <div class="col-sm-12 col-md-5" >

                            <div id="app-invoice-table_filter" class="dataTables_filter">
                                <label style="float: right">
                                    <form id="searchForm" action="/main/wholeProject" method="get">
                                        <div class="row" style="padding-right: 40px">
                                        <select name="type" id="testOption">
                                            <option value="T">프로젝트 아이디</option>
                                            <option value="C">프로젝트 이름</option>
                                            <option value="D">날짜</option>
                                        </select>
                                            <input type="text" id="keyWordInput" class="" name="keyword">
                                            <input type="date" id="startDate" value="22/12/03" style="display: none" oninput="myFunction()" required/>
                                            <input type="date" id="endDate" style="display: none" oninput="myFunction2()" required/>
                                            <input type="text"  id="startDateVal" name="StrtDateKeyword" value="" style="display: none"/>
                                            <input type="text" id="endDateVal" name="EndDateKeyword" value="" style="display: none"/>
                                            <input type="hidden" name="pageNm" value="${pageMaker.cri.pageNum}">
                                            <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                                            <input type="submit" class="btn btn-secondary" style="" value="검색">
                                        </div>
                                    </form>
                                </label>
                            </div>
                        </div>
                    </div>

                    <div id="search-results" class="card-body">
                        <div class="my-gallery" itemscope="" itemtype="http://schema.org/ImageGallery"
                             data-pswp-uid="1">
                            <div class="card-deck-wrapper">
                                <div class="card-deck">
                                    <c:forEach var="item" items="${list}" varStatus="idx">
                                        <div class="grid-item" style="width:300px;margin-left:10px;">
                                            <figure class="card card-img-top border-grey border-lighten"
                                                    itemprop="associatedMedia" itemscope
                                                    itemtype="http://schema.org/ImageObject">
                                                <a href="/main/projectDetail/${item.projId}" itemprop="contentUrl"
                                                   data-size="480x360"><img class="gallery-thumbnail card-img-top"
                                                                            src="/resources/upload/img/${item.projImgRoute}"
                                                                            itemprop="thumbnail"
                                                                            alt="Image description" style="height: 300px">
                                                </a>
                                                <div class="card-body px-0">
                                                    <div style="text-align: center">
                                                        <strong>${item.projName}</strong>
                                                    </div>
                                                    </p>
                                                    <br/>
                                                    <div style="text-align: center">
                                                        <span><fm:formatDate value="${item.projStrtDate}"/></span>~
                                                        <span><fm:formatDate value="${item.projEndDate}"/></span>
                                                    </div>
                                                </div>
                                            </figure>
                                        </div>
                                    </c:forEach>


                                </div>
                            </div>
                        </div>

                        <div class="text-center">
                            <nav aria-label="Page navigation">
                                <ul class="pagination pagination-separate pagination-round pagination-flat"
                                    style="text-align: center;margin-left: 500px">

                                    <c:if test="${pageMaker.prev}">
                                        <li class="page-item">
                                            <a class="page-link" href="${pageMaker.pageNum-1}" aria-label="Previous">
                                                <span aria-hidden="true"> Prev</span>
                                                <span class="sr-only">Previous</span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
                                        <li class="page-item active${pageMaker.cri.pageNum==num-1?"active":""}"><a
                                                class="page-link" href="${num}">${num}</a></li>
                                    </c:forEach>
                                    <c:if test="${pageMaker.next}">
                                        <li class="page-item">
                                            <a class="page-link" href="${pageMaker.pageNum+1}" aria-label="Previous">
                                                <span aria-hidden="true">Next</span>
                                                <span class="sr-only">Next</span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <form id="actionForm" action="/main/wholeProject" method="get">
                                        <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"/>
                                        <input type="hidden" name="amount" value="${pageMaker.cri.amount}"/>
                                    </form>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</div>
<script>
    var actionForm = $("#actionForm");
    $(".page-link ").on("click", function (e) {
        e.preventDefault();

        var targetPage = $(this).attr("href");
        console.log(targetPage);
        actionForm.find("input[name='pageNum']").val(targetPage);
        actionForm.submit();
    });

</script>