<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>

    <!--포토갤러리 업로드 프로세스-->
<%
    try {
        // 1. 첨부된 파일 저장하기

        // 첨부된 파일을 저장하는 폴더 생성 /src/main/webapp/storage
        // 실제 물리적인 경로
        String saveDirectory = application.getRealPath("/storage");
        // D:\java202301\workspace\myweb\out\artifacts\myweb\storage

        // 최대 저장 용량(50M)
        int maxPostSize = 1024*1024*50;

        // 한글 인코딩
        String encoding = "UTF-8";

        // request안에 파일이 있다면 -> 저장경로, 파일 사이즈, 인코딩타입, 중복파일명에 대한 정책
        MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());


        // 2. 1단계에서 저장한 파일의 파일명, 파일크기 가져오기
        String filename = ""; //파일명
        Long filesize = 0L; //파일크기
        File file = null; //실제 파일 담기 -> 파일 크기 때문에 사용
        String item = ""; //name="filename"

        Enumeration files = mr.getFileNames(); //mr에서 <input type=file>을 전부 수거
        while (files.hasMoreElements()) { //여러개의 파일을 첨부하는 경우, 한개씩 처리하기
            item = (String) files.nextElement(); //name="filename"
            filename = mr.getFilesystemName(item); //mr객체에서 item이 가지고 있는 리네임된 파일명을 가져옴

            if(filename != null) { //실제 파일명을 가져왔다면
                file = mr.getFile(item); //mr에서 실제 파일 가져오기

                if (file.exists()) { //파일이 존재한다면
                    filesize = file.length(); //파일크기 가져오기
                }
            }
        }

        // 3. tb_pds 테이블에 저장하기
        String subject = mr.getParameter("subject");
        String wname = mr.getParameter("wname").trim();
        String passwd = mr.getParameter("passwd").trim();

        dto.setWname(wname);
        dto.setSubject(subject);
        dto.setFilename(filename);
        dto.setFilesize(filesize);
        dto.setPasswd(passwd);

        int cnt = dao.create(dto);
        if (cnt == 0) { //insert 결과값이 없을경우
%>
    <script>
        alert('파일 업로드에 실패했습니다')
        location.href='pdsList.jsp?nowPage=<%=nowPage%>'
    </script>
<%      } else { %> <%--insert 성공했을 경우--%>
    <script>
        alert('파일 업로드가 완료되었습니다')
        location.href='pdsList.jsp'
    </script>
<%
        }

    } catch (Exception e) {
%>
    <script>
        alert('파일 업로드에 실패했습니다: <%=e%>')
        location.href='pdsList.jsp?nowPage=<%=nowPage%>'
    </script>
<%
    }
%>
<%@include file="../footer.jsp"%>