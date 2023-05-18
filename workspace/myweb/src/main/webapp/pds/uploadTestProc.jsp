<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.io.File" %><%--
  Created by IntelliJ IDEA.
  User: itwill
  Date: 2023-04-25
  Time: 오후 1:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>uploadTestProc.jsp</title>
</head>
<body>
    <h3>파일 첨부 테스트 결과</h3>
<%
    /*
    <form>에 encType = "multipart/form-date"속성이 추가되면
    request 내장 객체가 가지고 있는 값을 제대로 가져올 수 없다
    request.getParameter("")는 null이 반환된다.
    text-text로 file-file로 받아야함

    request.setCharacterEncoding("UTF-8");
    out.print(request.getParameter("uname")); //null
    out.print("<hr>");
    out.print(request.getParameter("subject")); //null
    out.print("<hr>");
    out.print(request.getParameter("content")); //null
    out.print("<hr>");
    out.print(request.getParameter("filenm")); //null
    out.print("<hr>");
     */


    // 1. 첨부된 파일 저장하기
    // 첨부된 파일을 저장하는 폴더 생성 /src/main/webapp/storage
    //실제 물리적인 경로
    String saveDirectory = application.getRealPath("/storage");
    System.out.println(saveDirectory);
    // E:\java202301\workspace\myweb\out\artifacts\myweb\storage

    // 최대 저장 용량(10M)
    int maxPostSize = 1024*1024*10;

    // 한글 인코딩
    String encoding = "UTF-8";

    try {
        // request안에 파일이 있다면 -> 저장경로, 파일 사이즈, 인코딩타입, 중복파일명에 대한 정책
        MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());

        // 2. mr 참조변수가 가리키고 있는 text 정보 가져오기
        out.print(mr.getParameter("uname"));
        out.print("<hr>");
        out.print(mr.getParameter("subject"));
        out.print("<hr>");
        out.print(mr.getParameter("content"));
        out.print("<hr>");

        // 3. /storage 폴더에 저장된 파일 정보 확인
        //   1) mr에서 <input type=file>의 요소를 전부 가져옴
        //      열거형 Enumeration enum = {"kim","lee","park",...}
        //      만약 첨부된 파일이 3개라면 files = {<input type=file>, <input type=file>, <input type=file>, ...} 형태로 저장
        Enumeration files = mr.getFileNames();

        //   2) 1번의 files가 가지고 있는 값들 중에서 개별적으로 접근하기 위해서 name 값 가져오기
        //      예) 첨부 : <input type=file name=filenm>
        String item = (String) files.nextElement(); //"filenm"

        //   3) 2번의 item 이름 (filenm)이 가지고 있는 실제 파일을 mr객체에서 가져오기
        String ofileName = mr.getOriginalFileName(item);
        out.print("원본 파일명: " + ofileName);
        out.print("<hr>");
        String fileName = mr.getFilesystemName(item);
        out.print("리네임 파일명: " + fileName);
        out.print("<hr>");

        //   4) /storage 폴더에 저장된 파일의 기타 정보 확인하기
        File file = mr.getFile(item);
        if (file.exists()) { //파일 존재여부 확인
            out.print("파일명: " + file.getName());
            out.print("<hr>");
            out.print("파일크기: " + file.length() + "byte");
            out.print("<hr>");
        } else {
            out.print("해당 파일이 존재하지 않음");
        }


    } catch (Exception e) {
        out.print(e);
        out.print("<p>파일 업로드 실패</p>");
        out.print("<a href='javascript:history.back();'>[다시시도]</a>");
    }

%>

</body>
</html>
