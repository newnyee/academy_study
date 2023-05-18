<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="ssi.jsp"%>
<%@include file="../header.jsp"%>

    <!--공지사항 글목록 조회-->
    <h3 style="text-align: center">공지 사항</h3>
<%
    int totalRecord = dao.count(col, word);
    if(s_mlevel.equals("A1") || s_mlevel.equals("B1")) { %> <%-- 관리자일 경우 글쓰기 버튼 생성 --%>
    <div style="display: flex; justify-content: space-between" >
        <p style="margin: 10px 0">총 <strong style="color: red"><%=totalRecord%></strong>건</p>
        <a href="noticeForm.jsp?nowPage=<%=nowPage%>"><button class="btn btn-default">글쓰기</button></a>
    </div>
<%  } else {
%>
    <div>
        <p style="margin: 10px 0">총 <strong style="color: red"><%=totalRecord%></strong>건</p>
    </div>
<%  } %>
    <div class="table-responsive" style="margin: 0">
        <table class="table table-hover">
            <thead>
                <tr>
                    <th style="text-align: center">번호</th>
                    <th style="text-align: center">제목</th>
                    <th style="text-align: center">작성일</th>
                    <th style="text-align: center">조회수</th>
                </tr>
            </thead>
            <tbody>
<%
    int recordPerPage = 8;
    ArrayList<NoticeDTO> list = dao.list(col, word, nowPage, recordPerPage, totalRecord);
    if (list==null) {
%>
                <tr>
                    <td colspan='4' style='text-align: center;'>일치하는 자료가 없습니다</td>
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
                        <option value="ntc_subject">제목</option>
                        <option value="ntc_content">내용</option>
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
    } else {
         String today = net.utility.Utility.getDate();
         for(NoticeDTO ldto : list) {
             int ntc_no = ldto.getNtc_no();
             String ntc_subject = ldto.getNtc_subject();
             int ntc_readcnt = ldto.getNtc_readcnt();
             String ntc_regdt = ldto.getNtc_regdt().substring(0, 10);
             int ntc_fix = ldto.getNtc_fix();
             int rnum = ldto.getRnum();

%>
                <tr <%if(ntc_fix == 1){ out.print("style='background-color: rgba(102,191,255,0.13)'");}%>>
<%                  if(ntc_fix == 1) { %>
                    <td style="text-align: center"><img src="../images/pngegg.png" style="width: 20px"></td>
<%                  } else {%>
                    <td style="text-align: center"><%=rnum%></td>
<%                  }%>
                    <td style="text-align: center">
                    <a href="noticeRead.jsp?ntc_no=<%=ntc_no%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>"><%=ntc_subject%></a>
<%
            // 새 게시글 new 이미지 출력
            if(ntc_regdt.equals(today)) {
                out.println("<img src='../images/new.gif'>");
            }

            // 조회수가 10 이상이면 hot 이미지 출력
            if(ntc_readcnt>=10) {
                out.println("<img src='../images/hot.gif'>");
            }
%>
                    </td>
                    <td style="text-align: center"><%=ntc_regdt%></td>
                    <td style="text-align: center"><%=ntc_readcnt%></td>
                </tr>
<%
        } //list 반복문 종료
%>
            </tbody>
        </table>
    </div>

    <!--페이징-->
    <div style="text-align: center; height: 70px;">
<%      String paging = new Paging().paging1(totalRecord, nowPage, recordPerPage, col, word, "noticeList.jsp");
        out.println(paging);
%>  </div>

    <!-- 검색 창 -->
    <div style="text-align: center; height: 50px;">
        <form action="pdsList.jsp" onsubmit="return searchCheck()">
            <div style="display: flex; justify-content: center">
                <div style="margin: 3px">
                    <select name="col" id="col" class="form-control">
                        <option value="subject_content">제목+내용</option>
                        <option value="ntc_subject">제목</option>
                        <option value="ntc_content">내용</option>
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
    } //list if 문 종료
%>


<%@include file="../footer.jsp"%>