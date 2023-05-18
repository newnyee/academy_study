<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/bootstrap_Morph.min.css">
   	<title>travelBook.jsp</title>
	<style>
		section{
			height: auto;
			min-height: 100%;
			padding-bottom: 30px;
		}
		footer{
			height: 30px;
			position: relative;
			transform: translateY(-100%);
			text-align:center;
		}
		body{margin:50px}
		nav{padding-bottom: 30px;}
		.headerdiv{margin:10px}
		h3{text-align:center;}
		.form-select {height: 50px; padding: 5px;}
	</style>
	
	<script>
	function validate () {
		//유효성 검사
		//1) 예약번호 글자 갯수가 8글자 인지 확인
		let rno = document.getElementById('rno').value;
		rno=rno.trim();
		if(rno.length!=8) {
			alert("예약번호 8자리를 입력해주세요");
			return false;
		}
		
		//2) 상품코드를 선택했는지 확인
		let tcode = document.getElementById('tcode').value;
		if(tcode==0){
			alert("상품코드를 선택해 주세요");
			return false;
		}
	
	
		//3) 주민번호가 숫자형으로 입력되었는지 확인
		let rjumin1 = document.getElementById('rjumin1').value;
		rjumin1 = rjumin1.trim();
		if(isNaN(rjumin1) || rjumin1.length!=6) {
			alert('주민번호 앞 6자리를 입력해 주세요');
			return false;
		}

		let rjumin2 = document.getElementById('rjumin2').value;
		rjumin2 = rjumin2.trim();
		if(isNaN(rjumin2) || rjumin2.length!=7) {
			alert('주민번호 뒤 7자리를 입력해 주세요');
			return false;
		}
	
		//4) 예약자 전화가 숫자형으로 입력되었는지 확인
		let rphone1 = document.getElementById("rphone1").value;
		rphone1 = rphone1.trim();
		if(isNaN(rphone1) || rphone1.length!=3) {
			alert('예약자 전화번호 첫 3자리를 입력해주세요');
			return false;
		}

		let rphone2 = document.getElementById("rphone2").value;
		rphone2 = rphone2.trim();
		if(isNaN(rphone2) || rphone2.length!=4) {
			alert('예약자 전화번호 중간 4자리를 입력해주세요');
			return false;
		}

		let rphone3 = document.getElementById("rphone3").value;
		rphone3 = rphone3.trim();
		if(isNaN(rphone3) || rphone3.length!=4) {
			alert('예약자 전화번호 마지막 4자리를 입력해주세요');
			return false;
		}
		
		//5) 고객 이메일에 @문자가 있는지 확인
		let remail = document.getElementById("remail").value;
		remail = remail.trim();
		if(remail.indexOf('@') === -1) {
			alert('이메일 서식에 맞게 작성해 주세요');
			document.getElementById("remail").focus();
			return false;
		}
		return true;
	}
	</script>
	</head>
	<body>
		<!-- header -->
		<header>
			<div class="headerdiv">
				<h3>여행 예약 프로그램</h3>
			</div>
		</header>
	
	<!-- nav -->
	<nav>
		<div class="container-fluid">
			<ul class="nav nav-tabs" role="tablist">
			   <li class="nav-item" role="presentation">
			      <a class="nav-link" data-bs-toggle="tab" href="home.jsp" aria-selected="false" role="tab" tabindex="-1">홈으로</a>
			   </li>
			   <li class="nav-item" role="presentation">
			      <a class="nav-link  active" data-bs-toggle="tab" href="travelBook.jsp" aria-selected="false" role="tab" tabindex="-1">예약등록</a>
			   </li>
			   <li class="nav-item" role="presentation">
			      <a class="nav-link" data-bs-toggle="tab" href="travelList.jsp" aria-selected="false" role="tab" tabindex="-1">예약조회</a>
			   </li>
			</ul>
		</div>
	</nav>
	
	<!-- main -->
	<section>
			<div class="container-fluid">
				<form name="travelfrm" id="travelfrm" method="post" action="travelBookProc.jsp" onsubmit="return validate()">
					<table class="table">
						<tr >
							<th scope="row">예약번호</th>
							<td><input type="text" class="form-control form-control-sm" name="rno" id="rno" maxlength="8" placeholder="예약번호 8자리"></td>
							<td rowspan="7">
								[JJ01] 제주 2018-12-01 09:30(AM) 출발 - 360,000원 (2박3일) <br><br>
								[JJ02] 부산 2018-12-02 10:00(AM) 출발 - 280,000원 (2박3일) <br><br>
								[JJ03] 제주 2018-12-04 10:00(AM) 출발 - 360,000원 (2박3일) <br><br>
								[JJ04] 제주 2018-12-07 11:00(AM) 출발 - 420,000원 (3박4일) <br><br>
								[JJ05] 부산 2018-12-09 13:30(AM) 출발 - 260,000원 (2박3일) <br><br>
								[JJ06] 제주 2018-12-10 09:30(AM) 출발 - 460,000원 (3박4일)

							</td>

						</tr>
						<tr >
							<th scope="row">상품코드</th>
							<td>
								<select name="tcode" id="tcode" class="form-select">
									<option value="0">상품선택</option>
<%
	Connection conn = null;
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
		
		String sql = new StringBuilder()
				.append("SELECT tcode, tarea, tdate FROM tbl_tourcode_02 ORDER BY tcode")
				.toString();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()){
			String tcode = rs.getString("tcode");
			String tarea = rs.getString("tarea");
			String tdate = new StringBuilder()
					.append(rs.getString("tdate").substring(0, 4))
					.append("-")
					.append(rs.getString("tdate").substring(4, 6))
					.append("-")
					.append(rs.getString("tdate").substring(6))
					.toString();
			%>
			<option value="<%=tcode%>">[<%=tcode %>] <%=tarea %> <%=tdate%> 출발</option>
			<%
		}
		
		rs.close();
		pstmt.close();
		
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		try { if(conn != null) conn.close(); } catch(SQLException e){}
	}
%>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">주민번호</th>
							<td>
								<input type="text" class="form-control form-control-sm" name="rjumin1" id="rjumin1" maxlength="6" placeholder="주민번호 앞 6자리">
								<input type="text" class="form-control form-control-sm" name="rjumin2" id="rjumin2" maxlength="7" placeholder="주민번호 뒤 7자리">
							</td>
						</tr>
						<tr>
							<th scope="row">예약자성명</th>
							<td><input type="text" class="form-control form-control-sm" name="rname" id="rname" maxlength="20" placeholder="이름"></td>
						</tr>
						<tr>
							<th scope="row">예약자전화</th>
							<td>
								<input type="text" class="form-control form-control-sm" name="rphone1" id="rphone1" maxlength="3" placeholder="전화번호 앞 3자리">
								<input type="text" class="form-control form-control-sm" name="rphone2" id="rphone2" maxlength="4" placeholder="전화번호 중간 4자리">
								<input type="text" class="form-control form-control-sm" name="rphone3" id="rphone3" maxlength="4" placeholder="전화번호 뒷 4자리">
							</td>
						</tr>
						<tr>
							<th scope="row">고객이메일</th>
							<td><input type="text" class="form-control form-control-sm" name="remail" id="remail" maxlength="30" placeholder="이메일"></td>
						</tr>
						<tr>
							<th scope="row">결제상태</th>
							<td>
								<input type="radio" name="rstat" value="1" checked>미납 
								<input type="radio" name="rstat" value="2">완납
							</td>
						</tr>
						<tr>
							<td colspan="3" align="center">
								<div class="btn-group" role="group" aria-label="Basic example">
								  <button type="submit" class="btn btn-secondary">예약</button>
								  <button type="reset" class="btn btn-secondary">다시쓰기</button>
								</div>
							</td>
						</tr>
					</table>
				</form>
			</div>
	</section>
	
	<!-- footer -->
	<footer>
		<p>
			KOREA Copyright&copy;2018 All rights reserved.<br>
			Human Resources Development Service of Korea.
		</p>
	</footer>
</body>
</html>
			
			






