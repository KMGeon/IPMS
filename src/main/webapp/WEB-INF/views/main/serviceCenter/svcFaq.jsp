<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<body>
<div class="content-wrapper" style="margin-top: 100px" ;>
    <div class="content-header row" style="margin-left: 46%;">
        <div class="content-header-left col-md-6 col-12 mb-2">
            <h3 class="content-header-title mb-2" style="">고객센터</h3>
        </div>
    </div>
    <div class="row breadcrumbs-top" style="margin-left: 720px;font-weight: bold; ">
        <div class="breadcrumb-wrapper col-12">
            <ol class="breadcrumb" style="position: relative;margin-right: 15px">
                <li class="breadcrumb-item bold "><a href="/main/svcNotice">공지사항</a>
                </li>
                <li class="breadcrumb-item"><a href="/main/svcFaq">자주묻는질문</a>
                </li>
                <li class="breadcrumb-item active"><a href="/main/svcQaA">Q&A</a>
                </li>
            </ol>
        </div>
    </div>
    <div id="accordion" style="width: 70%;margin-top: 100px;height: auto;margin-left: 250px;">
        <div class="card">
            <div class="card-header" id="headingOne">
                <h5 class="mb-0">
                    <button
                            class="btn btn-link"
                            data-toggle="collapse"
                            data-target="#collapseOne"
                            aria-expanded="true"
                            aria-controls="collapseOne"
                    >
                        Collapsible Group Item #1
                    </button>
                </h5>
            </div>

            <div
                    id="collapseOne"
                    class="collapse show"
                    aria-labelledby="headingOne"
                    data-parent="#accordion"
            >
                <div class="card-body">
                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus
                    terry richardson ad squid. 3 wolf moon officia aute, non cupidatat
                    skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.
                </div>
            </div>
        </div>
        <div class="card">
            <div class="card-header" id="headingTwo">
                <h5 class="mb-0">
                    <button
                            class="btn btn-link collapsed"
                            data-toggle="collapse"
                            data-target="#collapseTwo"
                            aria-expanded="false"
                            aria-controls="collapseTwo"
                    >
                        Collapsible Group Item #2
                    </button>
                </h5>
            </div>
            <div
                    id="collapseTwo"
                    class="collapse"
                    aria-labelledby="headingTwo"
                    data-parent="#accordion"
            >
                <div class="card-body">
                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus
                    terry richardson ad squid. 3 wolf moon officia aute, non cupidatat
                    skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.
                </div>
            </div>
        </div>
        <div class="card">
            <div class="card-header" id="headingThree">
                <h5 class="mb-0">
                    <button
                            class="btn btn-link collapsed"
                            data-toggle="collapse"
                            data-target="#collapseThree"
                            aria-expanded="false"
                            aria-controls="collapseThree"
                    >
                        Collapsible Group Item #3
                    </button>
                </h5>
            </div>
            <div
                    id="collapseThree"
                    class="collapse"
                    aria-labelledby="headingThree"
                    data-parent="#accordion"
            >
                <div class="card-body">
                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus
                    terry richardson ad squid. 3 wolf moon officia aute, non cupidatat
                    skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.
                    Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid
                </div>
            </div>
        </div>
    </div>
</body>
</html>
