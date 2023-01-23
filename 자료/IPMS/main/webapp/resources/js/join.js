$(document).ready(function(){






    //아이디 조건 만족 불만족 확인하기
    var text_id = $('.field_id input');
    text_id.focus(function(){               //포커스 되면
        $('.field_id .txt_guide').css('display', 'block');
    });
    text_id.blur(function(){              //포커스에서 벗어나면
        
        id_check();              //id_check() 함수 실행
        
    });


    //비밀번호 조건 만족 불만족 확인하기
    var text_pw = $('.field_pw input');
    text_pw.focus(function(){               //포커스 되면
        $('.field_pw .txt_guide').css('display', 'block');
    });
    text_pw.blur(function(){              //포커스에서 벗어나면
        
        pw_check();              //id_check() 함수 실행    
    });


    //비밀번호 확인 조건 만족 불만족 확인하기

    var text_pw2 = $('.field_repw input');
    text_pw2.focus(function(){
        $('.field_repw .txt_guide').css('display', 'block');
    });
    text_pw2.blur(function(){      
        pw2_check();
    });


    //아이디 중복 체크
    $('.field_id .btn').click(function(){

        if ($('.field_id input').val() == '') {    //만약에 아무것도 입력 되지 않은 상태면
            alert('아이디를 입력해주세요');
            $(".field_id .txt_guide .txt_case2").css('color', '#b3130b');
            return;
        }

        id_overlap_input = document.querySelector('input[name="id"]');
    
        $.ajax({
          type: "GET",
          url: "./id_check?id="+id_overlap_input,    //해당 url로 데이터를 넘김
          data: {
            'username': $('.field_id input').val()
          },
          datatype: 'json',
          success: function (data) {
            console.log(data['overlap']);
            if (data['overlap'] == "fail") {
              alert("이미 존재하는 아이디 입니다.");
              $(".field_id .txt_guide .txt_case2").css('color', '#b3130b');
              id_overlap_input.focus();
              return;
            } else {
              alert("사용가능한 아이디 입니다.");
              $(".field_id .txt_guide .txt_case2").css('color', '#0f851a');
              return;
            }
          }
        });
    });

    //이메일 중복 체크
    $('.field_email .btn').click(function(){

        if ($('.field_email input').val() == '') {    //만약에 아무것도 입력 되지 않은 상태면
            alert('이메일을 입력해주세요');
            return;
        }

        email_overlap_input = document.querySelector('input[name="email"]');
    
        $.ajax({
          type: "GET",
          url: "./email_check?id="+email_overlap_input,    //해당 url로 데이터를 넘김
          data: {
            'email': $('.field_email input').val()
          },
          datatype: 'json',
          success: function (data) {
            console.log(data['overlap']);
            if (data['overlap'] == "fail") {
              alert("이미 존재하는 이메일 입니다.");
              email_overlap_input.focus();
              return;
            } else {
              alert("사용가능한 이메일 입니다.");
              return;
            }
          }
        });
    });




    $('#addressSearch').click(function(){
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    
                
                } else {
                    
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
               
                document.getElementById("user_address").value = addr;
                
               

                //주소 검색이 완료된 후 변하는 css 목록
                $('.field_address input').css('display', 'block');
                $('#addressNo').text('재검색')

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("user_detail_address").focus();





                







                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                // 예제를 참고하여 다양한 활용법을 확인해 보세요.
                // http://postcode.map.daum.net/guide  api주소 
            }
        }).open();



    });












});