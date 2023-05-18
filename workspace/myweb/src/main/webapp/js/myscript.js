/**
 * myscript.js
 */

// 게시판 글쓰기 유효성검사
const bbsCheck = () => {

    // 1) 작성자 1글자 이상 입력
    let wname = document.getElementById("wname").value;
    wname = wname.trim();
    if(wname.length<1) {
        alert("작성자 이름을 한글자 이상 입력해주세요");
        document.getElementById("wname").focus();
        return false
    }

    // 2) 제목 1글자 이상 입력
    let subject = document.getElementById("subject").value;
    subject = subject.trim()
    if(subject.length<1) {
        alert("제목을 공백을 제외한 한글자 이상 입력해주세요");
        document.getElementById("subject").focus();
        return false
    }

    // 3) 내용 1글자 이상 입력
    let ntc_content = document.getElementById("content").value;
    ntc_content = ntc_content.trim();
    if(ntc_content.length<1) {
        alert("내용을 공백을 제외한 한글자 이상 입력해주세요");
        document.getElementById("content").focus();
        return false
    }

    // 비밀번호 4자리 이상 & 숫자로만 입력
    let passwd = document.getElementById("passwd").value;
    passwd = passwd.trim();
    if(passwd.length<4 || isNaN(passwd)) {
        alert("비밀번호를 숫자, 4글자 이상 입력해주세요");
        document.getElementById("passwd").focus();
        return false
    }

    return true
}

// 게시판 글 삭제 비밀번호 유효성 검사, 글삭제 여부 재확인
const pwCheck = () => {
    let passwd = document.getElementById("passwd").value;
    passwd = passwd.trim();
    if(passwd.length<4 || isNaN(passwd)) {
        alert("비밀번호를 숫자, 4글자 이상 입력해주세요");
        document.getElementById("passwd").focus();
        return false
    }

    if(confirm("삭제된 내용은 복구되지 않습니다.\n정말 삭제하시겠습니까?")) {
        return true
    } else {
        window.history.back(); // 삭제 취소 -> 전 페이지로 넘어감
        return false
    }
}

// 게시판 글 수정 비밀번호 유효성 검사
const pwCheckUpdate = () => {
    let passwd = document.getElementById("passwd").value;
    passwd = passwd.trim();
    if(passwd.length<4 || isNaN(passwd)) {
        alert("비밀번호를 숫자, 4글자 이상 입력해주세요");
        document.getElementById("passwd").focus();
        return false
    }
    return true
}

// 검색어 유무 확인
const searchCheck = () => {
    let word = document.getElementById('word').value
    word = word.trim()
    if(word.length === 0) {
        alert("검색어를 입력해 주세요")
        return false
    }
    return true
}

// 로그인 유효성 검사
const loginCheck = () => {
    // 아이디 5 ~ 10 글자 이내인지 검사
    let id = document.getElementById("id").value
    id = id.trim()
    if(id.length<5 || id.length>10) {
        alert("아이디를 5 ~ 10 글자 이내로 입력하세요")
        document.getElementById("id").focus()
        return false
    }

    // 비밀번호 5 ~ 10 글자 이내인지 검사
    let passwd = document.getElementById("passwd").value
    passwd = passwd.trim()
    if(passwd.length<5 || passwd.length>10) {
        alert("비밀번호를 5 ~ 10 글자 이내로 입력하세요")
        document.getElementById("passwd").focus()
        return false
    }

    return true
}

// 공지사항 유효성 검사
const noticeCheck = () => {

    // 제목 2글자 이상 입력
    let ntc_subject = document.getElementById("ntc_subject").value
    ntc_subject = ntc_subject.trim()
    if(ntc_subject.length<1) {
        alert("제목을 공백을 제외한 한글자 이상 입력해주세요")
        document.getElementById("ntc_subject").focus()
        return false
    }

    // 내용 2글자 이상 입력
    let ntc_content = document.getElementById("ntc_content").value
    ntc_content = ntc_content.trim();
    if(ntc_content.length<1) {
        alert("내용을 공백을 제외한 한글자 이상 입력해주세요")
        document.getElementById("ntc_content").focus()
        return false
    }

    return true
}

// 회원가입 id 중복 확인 페이지 이동
const idCheck = () => {
    // 모달창
    //->부모창과 자식창이 한몸으로 구성되어 있음
    //->참조 https://www.w3schools.com/bootstrap/bootstrap_modal.asp

    // 새창 만들기
    // window.open("파일명", "새창이름", "다양한옵션들")
    window.open("idCheckForm.jsp", "idwin", "width=500, height=350")

}

// 회원가입 email 중복 확인 페이지 이동
const emailCheck = () => {
    window.open("emailCheckForm.jsp", "emailwin", "width=500, height=350")
}

// 회원가입 유효성 검사
const memberCheck = () => {

    // 아이디 유무 확인
    let id = document.getElementById("id").value
    if(id.length<1) {
        alert("아이디를 설정해주세요")
        document.getElementById("idbutton").focus()
        return false
    }

    // 비밀번호 유효성 검사
    let passwd = document.getElementById("passwd").value
    passwd = passwd.trim()
    let pwCheck= /[ㄱ-ㅎㅏ-ㅣ]/g
    if(pwCheck.test(passwd) || passwd.length<5 || passwd.length>10) {
        alert("비밀번호 5~10자 영문 대 소문자, 숫자, 특수문자를 사용하세요.")
        document.getElementById("passwd").focus()
        return false
    }

    // 비밀번호와 비밀번호확인이 일치하는지
    let repasswd = document.getElementById("repasswd").value
    repasswd.trim()
    if(passwd !== repasswd) {
        alert("비밀번호가 일치하지 않습니다")
        document.getElementById("repasswd").focus()
        return false
    }

    // 이름 유효성 검사
    let mname = document.getElementById("mname").value;
    mname = mname.trim();
    let nameCheck = /[^가-힣a-zA-Z]/g
    if(nameCheck.test(mname) || mname.length<2) {
        alert("2자 이상의 한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)");
        document.getElementById("mname").focus()
        return false
    }

    // 이메일 유무 확인
    let email = document.getElementById("email").value
    if(email.length<1) {
        alert("이메일을 설정해주세요")
        document.getElementById("emailbutton").focus()
        return false
    }

    // 직업 선택 여부
    let job = document.getElementById("job").value
    if(job === "0") {
        alert("직업을 선택해 주세요")
        document.getElementById("job").focus()
        return false
    }
}

// 이메일 보내기 유효성 검사
const emailValidate = () => {

    // 받는사람 이메일 유무 확인, 이메일 형식이 맞는지 확인
    let to = document.getElementById("to").value
    to = to.trim()
    let toCheck = /[a-z0-9]+@[a-z]+\.[a-z]{2,3}/
    if(to.length<5) {
        alert("받는사람 이메일을 5자 이상 입력해주세요")
        return false
    }
    if(toCheck.test(to) === false) {
        alert("받는사람 이메일을 형식에 맞게 입력해주세요")
        return false
    }

    // 보내는사람 이메일 유무 확인, 이메일 형식이 맞는지 확인
    let from = document.getElementById("from").value
    from = from.trim()
    let fromCheck = /[a-z0-9]+@[a-z]+\.[a-z]{2,3}/
    if(from.length<5) {
        alert("보내는사람 이메일을 5자 이상 입력해주세요")
        return false
    }
    if(fromCheck.test(from) === false) {
        alert("보내는사람 이메일을 형식에 맞게 입력해주세요")
        return false
    }

    // 제목 글 유무 확인
    let subject = document.getElementById("subject").value
    subject = subject.trim()
    if(subject.length<1) {
        alert("제목을 입력해주세요")
        return false
    }

    // 내용 글 유무 확인
    let content = document.getElementById("content").value
    content = content.trim()
    if(content.length<1) {
        alert("내용을 입력해주세요")
        return false
    }

    return true
}

// 탈퇴 재확인
const withdrawCheck = () => {
    if(confirm("정말 탈퇴하시겠습니까?")) {
        return true
    } else {
        window.history.back(); // 삭제 취소 -> 전 페이지로 넘어감
        return false
    }
}

// 포토갤러리 업로드 유효성 검사
const pdsCheck = () => {

    // 작성자 1글자 이상 입력
    let wname = document.getElementById("wname").value;
    wname = wname.trim();
    if (wname.length < 1) {
        alert("작성자 이름을 한글자 이상 입력해주세요");
        document.getElementById("wname").focus();
        return false
    }

    // 제목 1글자 이상 입력
    let subject = document.getElementById("subject").value;
    subject = subject.trim()
    if (subject.length < 1) {
        alert("제목을 공백을 제외한 한글자 이상 입력해주세요");
        document.getElementById("subject").focus();
        return false
    }

    // 첨부파일 확장자명이 png, jpg, gif 인지 확인
    let filename = document.getElementById("filename").value
    filename = filename.trim().toLowerCase() //공백제거, 전체문자 소문자변환
    const file = filename.split('\.') //도트를 기준으로 나눈 값을 배열로 저장
    if (filename.length === 0) {
        alert("첨부 파일을 선택하세요")
        return false
    }
    if (!(file[file.length - 1] === 'png' || file[file.length - 1] === 'jpg' || file[file.length - 1] === 'gif')) {
        alert("첨부파일의 종류를 확인해주세요.\n(이미지파일 (png, jpg, gif)만 업로드 가능)")
        return false
    }

    // 비밀번호 4자리 이상 & 숫자로만 입력
    let passwd = document.getElementById("passwd").value;
    passwd = passwd.trim();
    if (passwd.length < 4 || isNaN(passwd)) {
        alert("비밀번호는 4자 이상의 숫자로 입력해주세요");
        document.getElementById("passwd").focus();
        return false
    }

    return true
}
