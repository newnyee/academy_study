<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <title>sungjukForm.jsp</title>
</head>
<body>
	<div class="container mt-3">
    	<h3>성적 입력 폼</h3>
	    <a href="sungjukList.jsp"><button class="btn btn-primary">성적목록</button></a>
	    <br><br>
	    <div class="form-group">
	    	<form class="form-horizontal" name="sungjukfrm" id="sungjukfrm" method="post" action="sungjukIns.jsp" >
		        <table class="table">
		            <tr>
		                <th class="table-secondary">이름</th>
		                <td><input type="text" class="form-control" name="uname" id="uname" maxlength="50" required autofocus></td>
		            </tr>
		            <tr>
		                <th class="table-secondary">국어</th>
		                <td><input type="number" class="form-control" name="kor" id="kor" size="6" min="0" max="100" placeholder="국어점수" required></td>
		            </tr>
		            <tr>
		                <th class="table-secondary">영어</th>
		                <td><input type="number" class="form-control" name="eng" id="eng" size="6" min="0" max="100" placeholder="영어점수" required></td>
		            </tr>
		            <tr>
		                <th class="table-secondary">수학</th>
		                <td><input type="number" class="form-control" name="mat" id="mat" size="6" min="0" max="100" placeholder="수학점수" required></td>
		            </tr>
		            <tr>
		                <th class="table-secondary">주소</th>
		                <td>
		                    <select name="addr" id="addr" class="form-select">
		                        <option value="Seoul">서울</option>
		                        <option value="Jeju">제주</option>
		                        <option value="Suwon">수원</option>
		                        <option value="Busan">부산</option>
		                    </select>
		                </td>
		            </tr>
		            <tr>
		                <td colspan="2" align="center">
		                    <button type="submit" class="btn btn-secondary">전송</button>
		                    <button type="reset" class="btn btn-primary">취소</button>
		                </td>
		            </tr>
		        </table>
	   		 </form>
   		 </div>
    </div>
</body>
</html>