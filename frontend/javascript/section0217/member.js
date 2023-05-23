/* member1.js */

const validate = () => {
  // 이름
  // 1. 두글자 이상
  // 2. trim() 적용
  // 조건 불만족시
  // 입력창 아래에 "두 글자 이상의 한글 또는 영문만 사용 가능합니다." 출력(color:red)
  // 해당 폼이 서버로 전송되는것을 차단
  // 커서가 입력창으로 가게하기
  let uname = document.getElementById('uname').value
  uname = uname.trim()
  if(uname.length<2) {
    let uname_text = document.getElementById('uname_text')
    uname_text.textContent = "두 글자 이상의 문자를 입력해주세요."
    uname_text.style.color = "red"
    document.getElementById('uname').focus()
    return false
  } else {
    uname_text.textContent = ""
  }

  // 아이디
  // 1. 5~20자 사이
  // 2. trim() 적용
  // 조건 불만족시
  // 입력창 아래에 "5~20자의 숫자 또는 문자를 입력해주세요." 출력(color:red)
  // 해당 폼이 서버로 전송되는것을 차단
  // 커서가 입력창으로 가게하기
  let uid = document.getElementById('uid').value
  uid = uid.trim()
  if(uid.length<5 || uid.length>20) {
    const uid_text = document.getElementById('uid_text')
    uid_text.textContent = "5~20자의 숫자 또는 문자를 입력해주세요."
    uid_text.style.color = "red"
    document.getElementById('uid').focus()
    return false
  } else {
    uid_text.textContent = ""
  }

  // 비밀번호
  // 1. 8~16자 사이
  // 2. trim() 적용
  // 조건 불만족시
  // 입력창 아래에 "8~16자의 숫자 또는 문자를 입력해주세요." 출력(color:red)
  // 해당 폼이 서버로 전송되는것을 차단
  // 커서가 입력창으로 가게하기
  let upw = document.getElementById('upw').value
  upw = upw.trim()
  if(upw.length<8 || upw.length>16) {
    const upw_text = document.getElementById('upw_text')
    upw_text.textContent = "8~16자의 숫자 또는 문자를 입력해주세요."
    upw_text.style.color = "red"
    document.getElementById('upw').focus()
    return false
  } else {
    upw_text.textContent = ""
  }

  // 주민번호1
  // 1. 6자의 숫자
  // 2. trim() 적용
  // 조건 불만족시
  // 입력창 아래에 "주민등록번호 앞 6자리의 숫자를 입력해주세요."
  let jumin1 = document.getElementById('jumin1').value
  if(jumin1.length !== 6) {
    const jumin1_text = document.getElementById('jumin1_text')
    jumin1_text.textContent = "주민등록번호 앞 6자리의 숫자를 입력해주세요."
    jumin1_text.style.color = "red"
    document.getElementById('jumin1').focus()
    return false
  } else {
    jumin1_text.textContent = ""
  }

  // 주민번호2
  // 1. 7자의 숫자
  // 2. trim() 적용
  // 조건 불만족시
  // 입력창 아래에 "주민등록번호 뒤 7자리의 숫자를 입력해주세요." 출력(color:red)
  let jumin2 = document.getElementById('jumin2').value
  jumin2 = jumin2.trim()
  if(jumin2.length<8 || jumin2.length>16) {
    const jumin2_text = document.getElementById('jumin2_text')
    jumin2_text.textContent = "주민등록번호 뒤 7자리의 숫자를 입력해주세요."
    jumin2_text.style.color = "red"
    document.getElementById('jumin2').focus()
    return false
  } else {
    jumin2_text.textContent = ""
  }

  // 이용약관 동의 (필수)
  // 1. scroll 창에 약관 내용
  // 2. 체크박스 체크
  // 조건 불만족시
  // alert로 "이용약관에 동의해주세요"
  let checkbox = document.getElementById('checkbox')
  if(checkbox.checked === false) {
    alert('이용약관에 동의해주세요')
    return false
  }
  

  alert('가입이 완료되었습니다')
  return true
}