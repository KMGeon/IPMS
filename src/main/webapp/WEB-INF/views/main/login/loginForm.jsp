<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link rel="stylesheet" type="text/css" href="/resources/GatherCss.css">
<script src="/resources/GatherJs.js"></script>

<script>
    $(document).ready(function(){
        if(${param.error!=null}){
           alert("다시 입력하세요");
        }
    });
</script>

<section class="">
    <div class="px-4 py-5 px-md-5 text-center text-lg-start" style="background-color: hsl(0, 0%, 96%)">
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
                            <form action="/login" method="post">

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
                                <!-- Remember-Me -->
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

                            <form action="/login" method="post">
                            <input type="hidden" name="memEmail" value="java">
                            <input type="hidden" name="memPasswd" value="1234">
                            <input type="submit" value="로그인 버튼(프로젝트 리더)">
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
