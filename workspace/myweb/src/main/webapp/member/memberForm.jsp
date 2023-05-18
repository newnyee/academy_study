<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<%@include file="../header.jsp"%>

    <!--회원가입 폼-->
    <div style="display: flex; justify-content: center; align-items: center;">
        <div style="width: 400px; display: flex; flex-direction: column;">
            <div>
                <h3 style="text-align: center"> 회원 가입 </h3>
            </div>
            <div style="display: flex; flex-direction: column; align-items: flex-end">
                <span style="color: red; font-weight: bold; font-size: small">* 필수입력</span>
            </div>
            <div>
                <form method="post" name="memfrm" id="memfrm" action="memberProc.jsp" onsubmit="return memberCheck()">
                    <div style="padding: 5px 0;">
                        <label>*아이디</label><br>
                        <div class="input-group">
                            <input class="form-control"  type="text" name="id" id="id" maxlength="10" readonly>
                            <div class="input-group-btn">
                                <input class="btn btn-default" id="idbutton" type="button" value="ID중복확인" onclick="idCheck()"> <%--myscript.js--%>
                            </div>
                        </div>
                    </div>
                    <div style="padding: 5px 0;">
                        <label>*비밀번호</label><br>
                        <input class="form-control" type="password" name="passwd" id="passwd" maxlength="10">
                    </div>
                    <div style="padding: 5px 0;">
                        <label>*비밀번호 확인</label><br>
                        <input class="form-control" type="password" name="repasswd" id="repasswd" maxlength="10">
                    </div>
                    <div style="padding: 5px 0;">
                        <label>*이름</label><br>
                        <input class="form-control" type="text" name="mname" id="mname" maxlength="20">
                    </div>
                    <div style="padding: 5px 0;">
                        <label>*이메일</label><br>
                        <div class="input-group">
                            <input class="form-control" type="text" name="email" id="email" maxlength="50" readonly>
                            <div class="input-group-btn">
                                <input class="btn btn-default" id="emailbutton" type="button" value="Email중복확인" onclick="emailCheck()"> <%--myscript.js--%>
                            </div>
                        </div>
                    </div>
                    <div style="padding: 5px 0;">
                        <label>전화번호</label><br>
                        <input class="form-control" type="text" name="tel" id="tel" maxlength="14">
                    </div>
                    <div style="padding: 5px 0;">
                        <label>우편번호</label><br>
                        <div class="input-group">
                            <input class="form-control" type="text" name="zipcode" id="zipcode" readonly>
                            <div class="input-group-btn">
                               <input class="btn btn-default" type="button" value="주소찾기" onclick="DaumPostcode()">
                            </div>
                        </div>
                    </div>
                    <!-- 다음 우편번호 API 시작 -->
                    <div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
                        <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
                    </div>
                    <div style="padding: 5px 0;">
                        <label>주소</label><br>
                        <input class="form-control" type="text" name="address1" id="address1" readonly>
                    </div>
                    <div style="padding: 5px 0;">
                        <label>나머지 주소</label><br>
                        <input class="form-control" type="text" name="address2" id="address2" >
                    </div>
                    <div style="padding: 5px 0;">
                        <label>직업</label><br>
                        <select class="form-control" name="job"  id="job">
                            <option value="0">선택하세요.</option>
                            <option value="A01">회사원</option>
                            <option value="A02" selected>IT관련직</option>
                            <option value="A03">학생</option>
                            <option value="A04">주부</option>
                            <option value="A05">기타</option>
                        </select>
                    </div>
                    <div style="padding: 20px 0;">
                        <input class="btn btn-info btn-lg btn-block" type="submit" value="회원가입" class="btn btn-default">
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        // 우편번호 찾기 찾기 화면을 넣을 element
        var element_wrap = document.getElementById('wrap');

        function foldDaumPostcode() {
            // iframe을 넣은 element를 안보이게 한다.
            element_wrap.style.display = 'none';
        }

        function DaumPostcode() {
            // 현재 scroll 위치를 저장해놓는다.
            var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
            new daum.Postcode({
                oncomplete: function(data) {
                    // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

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
                        document.getElementById("address2").value = extraAddr;

                    } else {
                        document.getElementById("address2").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('zipcode').value = data.zonecode;
                    document.getElementById("address1").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("address2").focus();

                    // iframe을 넣은 element를 안보이게 한다.
                    // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                    element_wrap.style.display = 'none';

                    // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                    document.body.scrollTop = currentScroll;
                },
                // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
                onresize : function(size) {
                    element_wrap.style.height = size.height+'px';
                },
                width : '100%',
                height : '100%'
            }).embed(element_wrap);

            // iframe을 넣은 element를 보이게 한다.
            element_wrap.style.display = 'block';
        }
    </script>

<%@include file="../footer.jsp"%>