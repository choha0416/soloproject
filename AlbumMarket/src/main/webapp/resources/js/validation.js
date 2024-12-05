function CheckAddAlbum() {
	var albumId=document.getElementById("albumId");
	var name=document.getElementById("name");
	var unitPrice=document.getElementById("unitPrice");
	var unitsInStock=document.getElementById("unitsInStock");
	var description=document.getElementById("description");
	
	//앨범아이디 체크
	if(!check(/^ISAN[0-9]{4,11}$/,albumId,"[음반 코드]\nISAN과 숫자를 조합하여 5~12자 까지 입력하세요\n첫 글자는 반드시 ISAN으로 시작하세요"))
	return false;
	
	//앨범명 체크 
	if (name.value.length < 1 || name.value.length >50) {
		alert("[음반 이름]\n최소 1자에서 최대 50자까지 입력하세요");
		name.focus();
		return false;
	}
	
	//앨범 가격 체크
	if (unitPrice.value.lenghth==0 || isNaN(unitPrice.value)) {
		alert("[가격]\n숫자만 입력하세요");
		unitPrice.focus();
		return false;
	}
	
	if (unitPrice.value < 0) {
		alert("[가격]\n음수는 입력할 수 없습니다");
		unitPrice.focus();
		return false;
	}albumId
	
	//재고 개수 체크
	if (isNaN(unitsInStock.value)) {
		alert("[재고 수]\n숫자만 입력하세요");
		unitsInStock.focus();
		return false;
	}
	//상세 설명
	if (description.value.length < 100) {
		alert("[상세설명]\n최소 100자 이상 입력하세요");
		description.focus();
		return false;
	}
	
	function check(regExp, e, msg) {
		if (regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		e.focus();
		return false;
	}
	document.newAlbum.submit()
	
}