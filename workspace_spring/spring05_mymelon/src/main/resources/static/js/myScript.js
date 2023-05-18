
// 삭제 확인
const deleteCheck = (mediano) => {
    let message = "정말 삭제하시겠습니까?\n(삭제된 파일은 복구되지 않습니다.)"
    if (confirm(message)) {
        location.href="delete.do?mediano=" + mediano
    }
}

// 음원등록 확인
const mediaFormCheck = () => {

    // 제목
    let title = document.getElementById('title')
    if (title.value.trim().length < 1) {
        alert("제목을 공백을 제외한 한글자 이상 입력해주세요")
        title.focus()
        return false
    }

    // 포스터 파일
    let posterMF = document.getElementById('posterMF')
    if(posterMF.value.length<1) {
        alert("포스터를 첨부해주세요")
        return false
    }

    let str = posterMF.value.toLowerCase().split("\.")
    if(!(str[str.length-1] === "png" || str[str.length-1] === "jpg")) {
        alert("포스터 파일의 확장자를 확인해주세요.\n(.png .jpg 만 가능)")
        return false
    }

    // 미디어 파일
    let filenameMF = document.getElementById('filenameMF')
    if(filenameMF.value.length<1) {
        alert("미디어 파일을 첨부해주세요")
        return false
    }

    let str1 = filenameMF.value.toLowerCase().split("\.")
    if(!(str1[str1.length-1] === "mp3" || str1[str1.length-1] === "mp4" || str1[str1.length-1] === "wav")) {
        alert("미디어 파일의 확장자를 확인해주세요.\n(.mp3 .mp4 .wav 만 가능)")
        return false
    }

    if (document.getElementById('update') !== null) {
        let message = "파일을 수정하면 기존 파일은 삭제됩니다.\n수정 하시겠습니까?"
        if(confirm(message)){
            return true
        } else {
            return false
        }
    } else if (document.getElementById('create') !== null) {
        return true
    } else {
        return false
    }

}