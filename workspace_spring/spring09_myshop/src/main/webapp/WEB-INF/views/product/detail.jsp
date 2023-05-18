<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-17
  Time: 오후 3:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link href="../../css/main.css" rel="stylesheet" type="text/css">
    <script src="../../js/jquery-3.6.4.min.js"></script>
    <title>detail.jsp</title>

    <script>
        const product_delete = () => {
            if(confirm("정말 삭제하시겠습니까?\n(삭제된 파일은 복구되지 않습니다)")) {
                document.productfrm.action="/product/delete"
                document.productfrm.submit()
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h3 align="center">상품 상세 / 상품 수정 / 상품 삭제</h3>
        <p><button class="btn btn-success" type="button" onclick="location.href='/product/list'">상품전체목록</button></p>

        <form name="productfrm" id="productfrm" method="post" action="/product/update" enctype="multipart/form-data">
            <input type="hidden" name="product_code" value="${product_code}">
            <table class="table">
                <tr>
                    <td class="success">상품명</td>
                    <td><input class="form-control" type="text" name="product_name" value="${product.PRODUCT_NAME}"></td>
                </tr>
                <tr>
                    <td class="success">상품가격</td>
                    <td><input class="form-control" type="number" name="price" value="${product.PRICE}"></td>
                </tr>
                <tr>
                    <td class="success">상품설명</td>
                    <td>
                        <textarea class="form-control" rows="5" cols="60" name="description" style="resize: none">${product.DESCRIPTION}</textarea>
                    </td>
                </tr>
                <tr>
                    <td class="success">상품사진</td>
                    <td>
                        <c:if test="${product.FILENAME != '-'}">
                            <img src="/storage/${product.FILENAME}" width="100px">
                        </c:if>
                        <br>
                        <input class="form-control" type="file" name="img">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" class="btn btn-success" value="상품수정">
                        <input type="button" class="btn" onclick="product_delete()" value="상품삭제">
                    </td>
                </tr>
            </table>
        </form>
        <hr>

        <%--댓글--%>
        <div>
            <form name="commentInsertForm" id="commentInsertForm">
                <div>
                    <input type="hidden" name="product_code" id="product_code" value="${product.PRODUCT_CODE}">
                    <div class="form-group">
                        <label for="content">댓글</label>
                        <textarea class="form-control" rows="3" name="content" id="content" style="resize: none" placeholder="내용을 입력해 주세요"></textarea>
                    </div>
                    <div style="text-align: right">
                        <button class="btn btn-success" type="button" name="commentInsertBtn" id="commentInsertBtn">등록</button>
                    </div>
                </div>
            </form>
        </div>

        <%-- 댓글 목록 --%>
        <div>
            <div class="commentList"></div>
        </div>
    </div>

    <%-- 댓글 관련 자바스크립트 --%>
    <script>
        let product_code = '${product.PRODUCT_CODE}' //부모글번호

        // 댓글 등록 버튼 이벤트
        $('#commentInsertBtn').on('click', ()=>{
            let insertData = $('#commentInsertForm').serialize() //serialize(): 폼의 모든 요소 가져오기
            commentInsert(insertData) //댓글등록 함수 호출
        })

        // 댓글 등록 함수
        const commentInsert = (insertData) => {
            $.ajax({
                url:'/comment/insert', //요청명령어
                type:'post',
                data:insertData, //요청데이터
                error:(error)=>{ //에러메세지
                    alert(error)
                },
                success:(data)=>{ //응답데이터
                    if (data === 1) { //댓글이 등록됐다면
                        commentList() //댓글 작성 후 댓글 목록 함수 호출
                        $('#content').val('') //기존 댓글 내용을 빈 문자열로 대입
                    }
                }
            })
        }

        // 댓글 목록 함수
        const commentList = () => {
            $.ajax({
                url:'/comment/list',
                type: 'get',
                data: {'product_code': product_code}, //jason형태로 넘김
                success: (data)=>{
                    let a = ''
                    $.each(data, (key, value)=>{ //(인덱스, Object)
                        a += value.content + "<br>"
                        // alert(value.content)
                        // alert(value.wname)
                        // alert(value.regdate)
                        // alert(value.product_code)
                    })
                    $('.commentList').html(a)
                }
            })
        }

        $(document).ready(()=>{
            commentList()
        })
    </script>
</body>
</html>
