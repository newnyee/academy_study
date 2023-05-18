<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<title>04_배열.jsp</title>
	<style>
		body{
			font-family: 'D2coding';
		}
	</style>
</head>
<body>
	<h3>배열</h3>
	
<%
	String[] uname = {"라일락", "진달래", "개나리", "무궁화", "홍길동"};
	int[] kor = {100, 50, 95, 80, 60};
	int[] eng = {100, 55, 95, 85, 40};
	int[] mat = {100, 60, 35, 90, 30};
	int size = uname.length;
	
	// 평균 구하기
	int[] aver = {0, 0, 0, 0, 0};
	for(int i=0; i<size; i++) {
		aver[i] = (kor[i] + eng[i] + mat[i])/3;
	}
	
	// 등수 구하기 (평균을 기준으로)
	int[] rank = {1, 1, 1, 1, 1};
	for(int a=0; a<size; a++) {
		for(int b=0; b<size; b++) {
			if(aver[a]<aver[b]) {
				rank[a] = rank[a]+1;
			}
		}
	}
%>

	<!-- 출력 -->
	<div class="container">
		<table class="table">
			<thead>
				<tr class="success">
					<th>이름</th>
					<th>국어</th>
					<th>영어</th>
					<th>수학</th>
					<th>평균</th>
					<th>등수</th>
					<th>결과</th>
				</tr>
			</thead>
			<tbody>
<%
			for (int i=0; i<size; i++) {
%>
				<tr>
					<td><%=uname[i] %></td>
					<td><%=kor[i] %></td>
					<td><%=eng[i] %></td>
					<td><%=mat[i] %></td>
					<td><%=aver[i] %></td>
					<td><%=rank[i] %></td>
					<td>
	<%
				if(aver[i]<60) {
					out.print("불합격 &nbsp;");
				} else if(kor[i]>=40 && eng[i]>=40 && mat[i]>=40) {
					out.print("합&nbsp; 격 &nbsp;");
				} else {
					out.print("재시험 &nbsp;");
				}
	
				for(int j=1; j<=10; j++) {
					if(j<=(aver[i]/10)){
						out.print("*");
					} else {
						out.print("&nbsp;");
					}
				}
				
				if(aver[i]>=95) {
					out.print("<span style='color:red; font-weight:bold;'>");
					out.print("&nbsp; 장학생");
					out.print("</span>");
				}

%>
				</td>				
			</tr>
<%	
			}
%>
			</tbody>
		</table>
	</div>

</body>
</html>