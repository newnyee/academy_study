<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%-- ssi.jsp 공통 페이지 --%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="net.sungjuk.*"%>

<jsp:useBean id="dao" class="net.sungjuk.SungjukDAO" scope="page"></jsp:useBean>
<jsp:useBean id="dto" class="net.sungjuk.SungjukDTO" scope="page"></jsp:useBean>

<%request.setCharacterEncoding("UTF-8"); %>
<html>
  <head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <title>sungjukList.jsp</title>
  </head>
  <body>
  <div class="container mt-3">
    <h3>성적 상세보기</h3>
    <p>
      <a href="sungjukForm.jsp"><button class="btn btn-secondary">성적입력</button></a>
      <a href="sungjukList.jsp"><button class="btn btn-primary">성적목록</button></a>
    </p>
    <%

      int sno = Integer.parseInt(request.getParameter("sno"));
      dto = dao.read(sno);
      if(dto==null) {
        out.println("해당 글없음");
      } else {
    %>
    <div class="form-group">
      <table class="table">
        <tr>
          <th class="table-secondary">이름</th>
          <td><%=dto.getUname() %></td>
        </tr>
        <tr>
          <th class="table-secondary">국어</th>
          <td><%=dto.getKor() %></td>
        </tr>
        <tr>
          <th class="table-secondary">영어</th>
          <td><%=dto.getEng() %></td>
        </tr>
        <tr>
          <th class="table-secondary">수학</th>
          <td><%=dto.getMat() %></td>
        </tr>
        <tr>
          <th class="table-secondary">평균</th>
          <td><%=dto.getAver() %></td>
        </tr>
        <tr>
          <th class="table-secondary">주소</th>
          <%
            String addr = dto.getAddr();

            if(addr.equals("Seoul")){
              addr = "서울";
            } else if (addr.equals("Jeju")) {
              addr = "제주";
            } else if (addr.equals("Suwon")) {
              addr = "수원";
            } else {
              addr = "부산";
            }
          %>
          <td><%=addr%></td>
        </tr>
        <tr>
          <th class="table-secondary">작성일</th>
          <td><%=dto.getWdate().substring(0,10)%></td>
        </tr>
      </table>
      <a href="sungjukUpdate.jsp?sno=<%=sno%>"><button class="btn btn-secondary">수정</button></a>
      <button class="btn btn-primary" id="delete">삭제</button>
    </div>
    <%
      }

    %>
  </div>
  <script>
    document.addEventListener("DOMContentLoaded", ()=>{
      const button = document.getElementById("delete")
      button.addEventListener('click', ()=>{
        if(confirm('성적을 삭제하시겠습니까?')) {
          location.href='sungjukDel.jsp?sno=<%=dto.getSno()%>'
        }
      })
    })
  </script>
  </body>
</html>
