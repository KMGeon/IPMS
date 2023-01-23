function CheckAddProduct(){
	//<input type="text" id="productId" name="productId" />
	let productId = document.getElementById("productId");
	//<input type="text" id="name" name="name" />
	let name = document.getElementById("pname");
	let unitPrice = document.getElementById("unitPrice");
	let unitsInStock = document.getElementById("unitsInStock");
	
	//상품 아이디 체크. 
	//1) 첫글자는 P.  2) 숫자를 조합하여 5~12자까지 입력 가능
	//i) P1234 => if(!true) => if(false) => if문을 건너뜀
	//ii) S1234 => if(!false) => if(true) => if문을 수행
	if(!check(/^P[0-9]{4,11}$/, productId
	, "[상품 코드]\nP와 숫자를 조합하여 5~12자까지 입력하세요\n첫 글자는 P로 시작하세요")){
		return false;	//함수 멈춰
	}
	
	//상품명 체크
	//4~12자까지 입력 가능
	//ex)name.value : 삼성갤러시S22
	if(name.value.length < 4 || name.value.length > 12){
		alert("[상품명]\n최소 4자에서 최대 12자까지 입력하세요");
		name.select();
		name.focus();
		return false;	//함수 멈춰
	}
	
	//상품 가격 체크
	//숫자만 입력 가능
	//ex) unitPrice.value : 1200000
	if(unitPrice.value.length == 0 || isNaN(unitPrice.value)){
		alert("[가격]\n숫자만 입력하세요");
		unitPrice.select();
		unitPrice.focus();
		return false; 	//함수 멈춰
	}
	
	//ex) unitPrice.value : -1200000 막아보자
	if(unitPrice.value < 0){
		alert("[가격]\n음수는 입력할 수 없습니다.");
		unitPrice.select();
		unitPrice.focus();
		return false;	//함수 멈춰
	}
	
	//ex) unitPrice.value : 1200000.1234982174092837 => 1200000.35
	//?:이 뭔지 고민해보자 => spring VO에서 어노테이션으로 자동 처리
	//i) 1200000.35 => if(!true) => if(false) => 함수를 통과
	//ii) 1200000.357 => if(!false) => if(true) => 함수를 멈춤
	if(!check(/^\d+(?:[.]?[\d]?[\d])?$/,unitPrice,"[가격]\n소수점 둘째 자리까지만 입력하세요")){
		return false; //함수 멈춰
	}
	
	//재고 수 체크
	//숫자만 입력 가능
	//isNaN : 이거숫자니? 
	if(isNaN(unitsInStock.value)){
		alert("[재고 수]\n숫자만 입력하세요");
		unitsInStock.select();
		unitsInStock.focus();
		return false;
	}
	
	//regExp : 정규식 / e : 대상객체 / msg : 메시지
	function check(regExp, e, msg){
		//test() : 맞니?틀리니? / exec() : 찾자
		//i) e.value => P1234
		//ii) e.value => S1234
		//iii) e.value => 1200000.35(o)
		//iv) e.value => 1200000.357(x)
		if(regExp.test(e.value)){
			return true;
		}
		alert(msg);
		e.select();	//글자선택
		e.focus();	//커서위치
		return false; //check()를 호출한곳으로 false를 리턴
	}
	//<form name="newProduct" ...
	document.newProduct.submit();
}









