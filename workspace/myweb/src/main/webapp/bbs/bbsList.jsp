<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="ssi.jsp"%>
<%@include file="../header.jsp"%>

    <!--글 전체 조회-->
    <h3 style="text-align: center">자유 게시판</h3>
    <div style="display: flex; justify-content: space-between" >
<%
    int totalRecord = dao.count2(col, word);
%>
        <p style="margin: 10px 0;">총 <strong style="color: red"><%=totalRecord%></strong>건</p>
        <a href="bbsForm.jsp?nowPage=<%=nowPage%>"><button class="btn btn-default">글쓰기</button></a>

    </div>
    <div class="table-responsive" style="margin: 0">
        <table class="table table-hover">
            <thead>
                <tr>
                    <th style="text-align: center">번호</th>
                    <th style="text-align: center">제목</th>
                    <th style="text-align: center">작성자</th>
                    <th style="text-align: center">작성일</th>
                    <th style="text-align: center">조회수</th>
                </tr>
            </thead>
            <tbody>
<%
    int recordPerPage = 8;
    ArrayList<BbsDTO> list = dao.list3(col, word, nowPage, recordPerPage, totalRecord);
    if (list==null) { //list에 값이 없을 때
%>
                <tr>
                    <td colspan='5' style='text-align: center;'>일치하는 자료가 없습니다</td>
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
                        <option value="subject_content">제목+내용</option>
                        <option value="subject">제목</option>
                        <option value="content">내용</option>
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
         for(BbsDTO ldto : list) { //list값 추출
             int bbsno = ldto.getBbsno();
             String wname = ldto.getWname();
             String subject = ldto.getSubject();
             int readcnt = ldto.getReadcnt();
             String regdt = ldto.getRegdt().substring(0, 10);
             int indent = ldto.getIndent();
             int rnum = ldto.getRnum();

%>
                <tr>
                    <td style="text-align: center"><%=rnum%></td> <%--글번호--%>
                    <td style="text-align: left">
<%
            // 답변 이미지 출력
            for(int n=1; n<=indent; n++) {
                if(n == indent){
                    out.println("<img src='../images/reply.gif'>");
                } else {
                    out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
                }
            }

            // 리플일 때 제목 앞에 're: ' 출력
            if(indent>0) {
                out.println("<span style='color:red;'>re: </span>");
            }
%>
                    <a href="bbsRead.jsp?bbsno=<%=bbsno%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>"><%=subject%></a> <%--제목(링크)--%>
<%
            // 부모글일때 댓글 갯수 출력
            if(indent==0) {
                int cnt = dao.replyCount(bbsno);
                if(cnt>0) {
                    out.println("(" + cnt + ")");
                }
            }

            // 새 게시글 new 이미지 출력
            if(regdt.equals(today)) { //올린 날짜가 오늘날짜와 같을 때
                out.println("<img src='../images/new.gif'>");
            }

            // 조회수가 10 이상이면 hot 이미지 출력
            if(readcnt>=10) {
                out.println("<img src='../images/hot.gif'>");
            }
%>
                    </td>
                    <td style="text-align: center"><%=wname%></td> <%--작성자--%>
                    <td style="text-align: center"><%=regdt%></td> <%--올린날짜--%>
                    <td style="text-align: center"><%=readcnt%></td> <%--조회수--%>
                </tr>
<%
        } //list 값 추출 종료
%>
            </tbody>
        </table>
    </div>

    <!--페이징-->
    <div style="text-align: center; height: 70px;">
<%      String paging = new Paging().paging1(totalRecord, nowPage, recordPerPage, col, word, "bbsList.jsp");
        out.println(paging);
%>  </div>

    <!-- 검색 창 -->
    <div style="text-align: center; height: 50px;">
        <form action="pdsList.jsp" onsubmit="return searchCheck()">
            <div style="display: flex; justify-content: center">
                <div style="margin: 3px">
                    <select name="col" id="col" class="form-control">
                        <option value="subject_content">제목+내용</option>
                        <option value="subject">제목</option>
                        <option value="content">내용</option>
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