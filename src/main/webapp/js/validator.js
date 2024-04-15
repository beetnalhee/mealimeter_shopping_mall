// 유효성 검증 관련 정적 메소드
const Validator = function(){}

// required 공백없이 뭐라도 썼는지 유효성검증
Validator.isEmpty = function(input){
  if (input !=null) {
    return input.trim() =="";
  }else{
    return true;
  }
}

// 숫자입력 형식 검증
Validator.isNumber = function(input){
  return /^[0-9]*$/.test(input);
}

// 이메일 형식 검증
Validator.isEmail = function(input){
  return /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/.test(input);
}

// 이름 형식 검증 (한글, 영어)
Validator.isName = function(input){
  return /^[가-힣a-zA-Z]+$/.test(input);
}

// 아이디 형식 검증 (영문자 또는 숫자로 시작하여 영문자, 숫자, 언더스코어(_)로 이루어진 4자 이상 16자 이하의 문자열)
Validator.isUsername = function(input) {
  return /^[a-zA-Z0-9_]{4,16}$/.test(input);
}


// //참고
// const Validator = {};
// Validator.isEmail = function(input){

// }