<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="ssi.jsp"%>
<%@include file="../header.jsp"%>

    <!--본문-->
    <%-- 로그인 결과 --%>
<%
    String id = request.getParameter("id").trim();
    String passwd = request.getParameter("passwd").trim();

    dto.setId(id);
    dto.setPasswd(passwd);

    String mlevel = dao.loginProc(dto);
    if(mlevel == null) { //로그인 실패
%>
    <script>
        alert("아이디(로그인 전용 아이디) 또는 비밀번호를 잘못 입력했습니다.\n입력하신 내용을 다시 확인해주세요.")
        location.href='javascript:history.back()'
    </script>
<%
    } else { //로그인 성공

        // 다른 페이지에서도 로그인 상태 정보를 공유할 수 있도록
        session.setAttribute("s_id", id);
        session.setAttribute("s_passwd", passwd);
        session.setAttribute("s_mlevel", mlevel);

        // 쿠키 시작
        String c_id = net.utility.Utility.checkNull(request.getParameter("c_id")); //불러온값이 null일경우 빈문자열로 바꿔줌
        Cookie cookie = null;
        if(c_id.equals("SAVE")) { //ID 저장 체크시 쿠키에 ID 저장

            // new생성자로 객체 생성하며 초기화할 수 있음
            cookie = new Cookie("c_id", id);

            //쿠키 생존기간 1개월
            cookie.setMaxAge(60*60*24*30); //시간과 관계없이 각 브라우저에서 쿠키삭제 가능
        } else {
            cookie = new Cookie("c_id", "");
            cookie.setMaxAge(0);
        }
        response.addCookie(cookie); //요청한 사용자 PC에 쿠키 값을 저장

        // 첫 페이지로 이동
        String root = net.utility.Utility.getRoot(); // /myweb반환
        response.sendRedirect(root + "/index.jsp");
    }
%>

<%@include file="../footer.jsp"%>