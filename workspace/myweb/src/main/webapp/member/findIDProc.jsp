<%@ page import="javax.mail.Authenticator" %>
<%@ page import="javax.mail.Session" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.Message" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%@ page import="java.util.Date" %>
<%@ page import="javax.mail.Transport" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="ssi.jsp"%>
<%@include file="../header.jsp"%>


    <%--비밀번호찾기 프로세스--%>
    <%--이름과 이메일이 일치하면 이메일 작성 프로세스에서 임시비밀번호 이메일 전송--%>
<%
        String mname = request.getParameter("mname").trim();
        String email = request.getParameter("email").trim();
        String newPw = dao.findPw(mname, email);

        if (newPw.equals("")) { //이름과 이메일 일치하지 않을 때
%>          <script>
                alert("가입한 이름 또는 이메일과 일치하지 않거나,\n존재하지 않는 이름 또는 이메일 입니다")
                location.href='javascript:history.back()'
            </script>
<%
        } else { //이름과 이메일 일치할 때, 임시비밀번호 이메일 전송

            try {
                // 1) 사용하고자 하는 메일 서버에서 인증받은 계정과 비번 등록하기
                // -> MyAuthenticator 클래스 생성

                // 2) 메일 서버(POP3/SMTP) 지정하기
                String mailServer = "mw-002.cafe24.com"; //cafe24 메일 서버
                Properties props = new Properties();
                props.put("mail.smtp.host", mailServer); //메일서버
                props.put("mail.smtp.auth", true); //권한확인

                // 3) 메일 서버에서 인증받은 계정 + 비번
                Authenticator myAuth = new MyAuthenticator(); //다형성

                // 4) 2번과 3번이 유효한지 검증
                Session sess = Session.getInstance(props, myAuth);

                // 5) 메일 보내기
                request.setCharacterEncoding("UTF-8");
                String to = email.trim();
                String from = "myweb@naver.com";
                String subject = "[My Universe] 요청하신 임시 비밀번호 입니다.";
                String content = new StringBuilder()
                        .append("안녕하세요. <strong>" + mname + "</strong>님!<br>")
                        .append("<hr>")
                        .append(mname + "님의 임시 비밀번호 10자리는 아래와 같습니다.<br>")
                        .append("먼저, 사이트에 방문하셔서 로그인 하신 후 비밀번호를 변경하시기 바랍니다.<br>")
                        .append("임시 비밀번호 : <strong>" + newPw +"</strong>")
                        .toString();


                // 받는 사람 이메일 주소
                InternetAddress[] address = {new InternetAddress(to)};

                // 메일 관련 정보 작성
                Message msg = new MimeMessage(sess);

                // 받는사람
                msg.setRecipients(Message.RecipientType.TO, address);
                //참조 msg.setRecipients(Message.RecipientType.CC, address);
                //숨은 참조 msg.setRecipients(Message.RecipientType.BCC, address);

                // 보내는 사람
                msg.setFrom(new InternetAddress(from));

                // 메일 제목
                msg.setSubject(subject);

                // 메일 내용
                msg.setContent(content, "text/html; charset=UTF-8");

                // 메일 보낸 날짜
                msg.setSentDate(new Date());

                // 메일 전송
                Transport.send(msg);

%>              <script>
                    let str = "<%=email%>".split("@")
                    window.open("http://www."+ str[str.length-1])
                    alert("입력하신 이메일로 임시 비밀번호가 발급되었습니다")
                    location.href='../member/loginForm.jsp'
                </script>
<%          } catch (Exception e) { %>
                <script>
                    alert("메일 전송 실패: <%=e%>")
                    location.href='javascript:history.back()'
                </script>
<%          }
        }%>



<%--    <div style="height: 600px; display: flex; justify-content: center; align-items: center;">--%>
<%--        <div style="width: 400px; height: 300px; display: flex; flex-direction: column; justify-content: center; align-items: center;">--%>
<%--            <div>--%>
<%--                <h4>아이디/비밀번호 찾기</h4>--%>
<%--            </div>--%>
<%--            <div>--%>
<%--                <form name="sub1" method="post" action="../mail/mailProc.jsp">--%>
<%--                    <div style="padding: 5px;">--%>
<%--                        <input class="form-control" type="text" name="mname" id="mname" value="<%=mname%>" maxlength="20" readonly>--%>
<%--                    </div>--%>
<%--                    <div style="padding: 5px;">--%>
<%--                        <input class="form-control" type="email" name="to" id="to"value="<%=email%>" maxlength="50" readonly>--%>
<%--                    </div>--%>
<%--                    <input type="hidden" name="from" id="from" value="myweb@naver.com">--%>
<%--                    <input type="hidden" name="subject" id="subject" value="[My Universe] 요청하신 임시 비밀번호 입니다.">--%>
<%--                    <textarea style="display: none" name="content" id="content">--%>
<%--                        안녕하세요. <%=mname%> 님!--%>
<%--                        <%=mname%>님의 임시 비밀번호 10자리는 아래와 같습니다.--%>
<%--                        먼저, 사이트에 방문하셔서 로그인 하신 후 비밀번호를 변경하시기 바랍니다.--%>
<%--                        임시 비밀번호 : <%=newPw%>--%>
<%--                    </textarea>--%>
<%--                    <div style="padding: 5px;">--%>
<%--                        <button type="submit" class="btn btn-primary btn-block">임시 비밀번호 메일전송</button>--%>
<%--                    </div>--%>
<%--                </form>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>

<%@include file="../footer.jsp"%>
