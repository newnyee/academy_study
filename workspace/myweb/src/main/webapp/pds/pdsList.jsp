<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="ssi.jsp"%>
<%@include file="../header.jsp"%>


    <!--포토갤러리 파일 전체 조회-->
<%  int totalRecord = dao.count(col, word); %>
    <h3 style="text-align: center">포토 갤러리</h3>
    <div style="display: flex; justify-content: space-between" >
        <p style="margin: 10px 0;">총 <strong style="color: red"><%=totalRecord%></strong>건</p>
        <a href="pdsForm.jsp?nowPage=<%=nowPage%>"><button class="btn btn-default">글쓰기</button></a>
    </div>
    <div class="table-responsive" style="margin: 0">
        <table class="table table-hover">
            <thead>
            <tr>
                <th style="text-align: center">번호</th>
                <th style="text-align: center">제목</th>
                <th style="text-align: center">썸네일</th>
                <th style="text-align: center">작성자</th>
                <th style="text-align: center">작성일</th>
                <th style="text-align: center">조회수</th>
            </tr>
            </thead>
            <tbody>
<%
    int recordPerPage = 8;
    ArrayList<PdsDTO> list = dao.list(col, word, nowPage, recordPerPage, totalRecord);
    if (list==null) { //list에 값이 없을 때
%>
            <tr>
                <td colspan='6' style='text-align: center;'>일치하는 자료가 없습니다</td>
            </tr>
            </tbody>
        </table>
    </div>

    <!-- 검색 창 -->
    <div style="text-align: center; height: 50px;">
        <form action="pdsList.jsp" onsubmit="return searchCheck()">
            <div style="display: flex; justify-content: center">
                <div style="margin: 3px">
                    <select name="col" id="col" class="form-control">
                        <option value="subject">제목</option>
                        <option value="wname">작성자</option>
                    </select>
                </div>
                <div class="input-group" style="margin: 3px">
                    <input type="text" class="form-control" placeholder="Search" name="word" id="word">
                    <div class="input-group-btn">
                        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <%
    } else { //list에 값이 있을 때

        String today = net.utility.Utility.getDate(); //오늘 날짜 저장

        for(PdsDTO ldto : list) { //list값 추출
            int pdsno = ldto.getPdsno();
            int rnum = ldto.getRnum();
            String wname = ldto.getWname();
            String subject = ldto.getSubject();
            String filename = ldto.getFilename();
            String regdate = ldto.getRegdate().substring(0, 10);
            int readcnt = ldto.getReadcnt();

%>               <tr>
                    <td style="text-align: center; vertical-align: middle"><%=rnum%></td> <%--글번호--%>
                    <td style="text-align: center; vertical-align: middle">
                        <a href="pdsRead.jsp?pdsno=<%=pdsno%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>"><%=subject%></a> <%--제목(링크)--%>
<%
                            // 새 게시글 new 이미지 출력
                            if(regdate.equals(today)) { //올린 날짜가 오늘날짜와 같을 때
                                out.println("<img src='../images/new.gif'>");
                            }

                            // 조회수가 10 이상이면 hot 이미지 출력
                            if(readcnt>=10) {
                                out.println("<img src='../images/hot.gif'>");
                            }
                        %>
                    </td>
                    <td style="text-align: center; vertical-align: middle"><img src="../storage/<%=filename%>" style="max-width: 50px"></td> <%--사진--%>
                    <td style="text-align: center; vertical-align: middle"><%=wname%></td> <%--작성자--%>
                    <td style="text-align: center; vertical-align: middle"><%=regdate%></td> <%--작성일--%>
                    <td style="text-align: center; vertical-align: middle"><%=readcnt%></td> <%--조회수--%>
                </tr>
<%      } //list 값 추출 종료 %>
             </tbody>
        </table>
    </div>

    <!--페이징-->
    <div style="text-align: center; height: 70px;">
<%      String paging = new Paging().paging1(totalRecord, nowPage, recordPerPage, col, word, "pdsList.jsp");
            out.println(paging);
%>  </div>

    <!-- 검색 창 -->
    <div style="text-align: center; height: 50px;">
        <form action="pdsList.jsp" onsubmit="return searchCheck()">
            <div style="display: flex; justify-content: center">
            <div style="margin: 3px">
            <select name="col" id="col" class="form-control">
                <option value="subject">제목</option>
                <option value="wname">작성자</option>
            </select>
            </div>
            <div class="input-group" style="margin: 3px">
                <input type="text" class="form-control" placeholder="Search" name="word" id="word">
                <div class="input-group-btn">
                    <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                </div>
            </div>
            </div>
        </form>
    </div>

<%
    } //list if 문(list에 값이 있을 때) 종료
%>

<%@include file="../footer.jsp"%>