<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- BEGIN: Vendor CSS-->
<link rel="stylesheet" type="text/css"
      href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/forms/icheck/icheck.css">
<link rel="stylesheet" type="text/css"
      href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/forms/icheck/custom.css">
<!-- END: Vendor CSS-->

<!-- BEGIN: Page CSS-->
<link rel="stylesheet" type="text/css"
      href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/core/menu/menu-types/horizontal-menu.css">
<link rel="stylesheet" type="text/css"
      href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/core/colors/palette-gradient.css">
<link rel="stylesheet" type="text/css"
      href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/pages/login-register.css">

<!-- BEGIN: Custom CSS-->
<link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/assets/css/style.css">
<!-- END: Custom CSS-->


<script>
    $(document).ready(function(){
        if(${param.error!=null}){
           alert("다시 입력하세요");
        }
    });

</script>
<section class="">
    <!-- Jumbotron -->
    <div
            class="px-4 py-5 px-md-5 text-center text-lg-start"
            style="background-color: hsl(0, 0%, 96%)"
    >
        <div class="container" style="margin-top: 100px;">
            <div class="row gx-lg-5 align-items-center">
                <div class="col-lg-6 mb-5 mb-lg-0">
                    <h1 class="my-5 display-3 fw-bold ls-tight">
                        The best offer <br/>
                        <span class="text-primary">for your business</span>
                    </h1>
                    <p style="color: hsl(217, 10%, 50.8%)">
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet,
                        itaque accusantium odio, soluta, corrupti aliquam quibusdam tempora
                        at cupiditate quis eum maiores libero veritatis? Dicta facilis sint
                        aliquid ipsum atque?
                    </p>
                </div>

                <div class="col-lg-6 mb-5 mb-lg-0">
                    <div class="card">
                        <div class="card-body py-5 px-md-5">
                            <div class="card-title text-center">
                                <img src="/resources/logoImage/logo.jpg" href="" alt="branding logo"
                                     style="width: 100px; height: auto;">
                            </div>
                            <h6 class="card-subtitle line-on-side text-muted text-center font-small-3 pt-2"><span>Login with IPMS</span>
                            </h6>
                            <form action="/main/loginPost" method="post">

                                <!-- Email input -->
                                <div class="form-outline mb-4">
                                    <label class="form-label style=" float: left">Email </label>
                                    <input type="text" id="email" name="memEmail" class="form-control" placeholder="Your Email" required/>
                                </div>

                                <!-- Password input -->
                                <div class="form-outline mb-4">
                                    <label class="form-label" style="float: left">Password</label>
                                    <input type="password" id="paswd" name="memPasswd" class="form-control"
                                           placeholder="Enter Password" required/>
                                </div>
                                <!-- Checkbox -->
                                <div class="col-sm-6 col-12 text-center text-sm-left">
                                    <fieldset>
                                        <input type="checkbox" name="remember-me">로그인 유지<br>
                                    </fieldset>
                                </div>
                                <!-- Submit button -->
                                <button type="submit" class="btn btn-primary btn-block mb-4">
                                    Login
                                </button>
                                <a href="/main/signUpForm">회원가입</a><br><a href="/main/fgtPwd">비밀번호 찾기</a>
                                <!-- Register buttons -->
                                <!--  csrf 공격 방어를 위해 동적 생성 -->
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
                                <sec:csrfInput/>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Jumbotron -->
</section>
<!-- Section: Design Block -->

<!-- BEGIN: Page Vendor JS-->
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/forms/icheck/icheck.min.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/js/forms/validation/jqBootstrapValidation.js"></script>
<!-- END: Page Vendor JS-->

<!-- BEGIN: Page JS-->
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/ui/breadcrumbs-with-stats.js"></script>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/forms/form-login-register.js"></script>
<!-- END: Page JS-->