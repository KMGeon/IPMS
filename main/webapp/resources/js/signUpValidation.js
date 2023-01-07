// onsubmit 관련된 코드짜기

function on_id_check() {          //id 검사 함수
    var email = $(".field_memEmail input").val();
    if (email.length == 0) {

        alert('이메일을 정확히 입력해주세요');
        return false;
    } else {

        return true;
    }
}

function on_pw_check() {           //비밀번호 검사 함수
    var pw = $(".field_memPasswd input").val();
    var num = /[0-9]/;
    var eng = /[a-zA-Z]/;
    var spe = /[~!@#$%^&*()_+|<>?:{}]/;
    if (pw.length < 10) {

        alert('비밀번호를 정확히 입력해주세요');
        return false;
    } else if (num.test(pw) == 0 || eng.test(pw) == 0 || spe.test(pw) == 0) {

        alert('비밀번호를 정확히 입력해주세요');
        return false;
    } else {

        return true;
    }
}

function on_pw2_check() {           //비밀번호 확인 검사 함수
    var pw = $(".field_memPasswd input").val();
    var pw2 = $(".field_memPasswd2 input").val();
    if (pw2.length == 0) {

        alert('비밀번호 확인을 다시해주세요');
        return false;
    } else if (pw != pw2) {

        alert('비밀번호 확인을 다시해주세요');
        return false;
    } else {

        return true;
    }
}

function on_name_check() {             //이름 검사 함수
    var name = $(".field_memName input").val();
    if (name.length == 0) {

        alert('이름을 입력해주세요');
        return false;
    } else {

        return true;
    }
}

function on_phone_check() {               //휴대폰번호 검사함수
    var phone = $(".field_memPhoneNumber input").val();
    if (phone.length == 0) {

        alert('휴대폰 번호를 입력해주세요');
        return false;
    } else {

        return true;
    }
}


function on_submit_check() {               // fomr에 onsubmit으로 최종적으로 넘겨야될 함수

    var check = false;                   //check변수에 false를 넣어주고 다른 함수들이 false를 반환하면 다음페이지로 못넘어가게 설정
    if (on_id_check() == check) {
        return false;
    } else if (on_pw_check() == check) {
        return false;
    } else if (on_pw2_check() == check) {
        return false;
    } else if (on_name_check() == check) {
        return false;
    } else if (on_email_check() == check) {
        return false;
    } else if (on_phone_check() == check) {
        return false;
    } else {
        return true;
    }
}

function id_check() {
    var id = $(".field_memEmail input").val();
    var spe = /[~!@#$%^&*()_+|<>?:{}]/;


    if (id.length < 6) {                     //만약에 id의 길이가 6보다 작으면
        $(".field_id .txt_guide .txt_case1").css('color', '#b3130b');   //글자색 변경
    } else if (spe.test(id) == 1) {    //spe.test(id) --> id안에 특수문자가 있으면 true반환 없으면 false반환
        $(".field_id .txt_guide .txt_case1").css('color', '#b3130b');   //글자색 변경
    } else {          // 모든 조건이 일치하지 않다면
        $(".field_id .txt_guide .txt_case1").css('color', '#0f851a');  //글자색 초록색으로 변경
    }
}

function pw_check() {
    var pw = $(".field_memPasswd input").val();                   // 변수 pw에 pw값 대입

    var num = /[0-9]/;
    var eng = /[a-zA-Z]/;
    var spe = /[~!@#$%^&*()_+|<>?:{}]/;


    if (pw.length < 10) {                                  //pw의 길이가 10 이하일 때
        $(".field_pw .txt_guide .txt_case1").css('color', '#b3130b');
    }

    if (pw.length >= 10) {                                  //pw의 길이가 10 이상일 때
        $(".field_pw .txt_guide .txt_case1").css('color', '#0f851a');
    }

    if (num.test(pw) == 0 || eng.test(pw) == 0 || spe.test(pw) == 0) {    // pw의 숫자가 없거나 , 영어가 없거나, 특수문자가 없을경우 실패
        $(".field_pw .txt_guide .txt_case2").css('color', '#b3130b');
    }


    if (num.test(pw) == 1 && eng.test(pw) == 1 && spe.test(pw) == 1) { // pw의 숫자,영어,특수문자가 1개이상씩 있을경우 성공
        $(".field_pw .txt_guide .txt_case2").css('color', '#0f851a');
    }

}


function pw2_check() {
    var pwd1 = $(".field_ input").val();
    var pwd2 = $(".field_repw input").val();

    if (pwd1 != '' && pwd2 == '') {          //둘다 빈칸일 경우 아무것도 하지 않음
        null;
    } else if (pwd1 != "" || pwd2 != "") {     // 빈칸이 아닐 경우
        if (pwd1 == pwd2) {                    // 비교해서 같으면
            $(".field_repw .txt_guide .txt_case1").css('color', '#0f851a');
            $(".field_repw .txt_guide .txt_case1").text("비밀번호가 동일합니다.");


        } else {        // 비교해서 같지 않으면
            $(".field_repw .txt_guide .txt_case1").css('color', '#b3130b');
            $(".field_repw .txt_guide .txt_case1").text("비밀번호가 일치하지 않습니다.");


        }
    }


}
