<%@ page import="java.util.Properties" %>
<%@ page import="javax.mail.Authenticator" %>
<%@ page import="main.java.net.utility.MyAuthenticator" %>
<%@ page import="javax.mail.Session" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.Message" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%@ page import="java.util.Date" %>
<%@ page import="javax.mail.Transport" %><%--
  Created by IntelliJ IDEA.
  User: itwill
  Date: 2023-04-24
  Time: 오전 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="../member/auth.jsp"%>
<%@include file="../header.jsp"%>

    <!--메일 작성 프로세스-->
<%
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
        String to = request.getParameter("to").trim();
        String from = request.getParameter("from").trim();
        String subject = request.getParameter("subject");
        String content = request.getParameter("content");
        String mname = request.getParameter("mname");

        // 엔터 및 특수문자 변경
        content = net.utility.Utility.convertChar(content);

        // html형식으로 보내지기 때문에 태그를 이용하여 테이블형태로 보낼 수 있음
        /*
        content = new StringBuilder()
                .append("<hr>")
                .append("<table border='1'>")
                .append("<tr>")
                .append("    <th>상품명</th>")
                .append("    <th>상품가격</th>")
                .append("</tr>")
                .append("<tr>")
                .append("    <td>운동화</td>")
                .append("    <td><span style='color: red; font-weight: bold;'>15,000원</span></td>")
                .append("</tr>")
                .append("</table>")


        // 이미지 출력하기
                .append("<hr>")
                .append("<img src='http://localhost:9090/myweb/images/universe1.jpeg'>")
                .toString();
         */

        // 받는 사람 이메일 주소
        InternetAddress[] address = {new InternetAddress(to)};

        /*
        받는 사람이 여러명일 때
        InternetAddress[] address = {new InternetAddress(to1),
                                     new InternetAddress(to2),
                                     new InternetAddress(to3), ...};
         */

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
%>      <script>
             alert("<%=to%> 님에게 메일이 발송되었습니다")
             location.href='javascript:history.back()'
        </script>
<% } catch (Exception e) { %>
        <script>
            alert("메일 전송 실패: <%=e%>")
            location.href='javascript:history.back()'
        </script>
<%  } %>

<%@include file="../footer.jsp"%>