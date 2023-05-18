<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>searchTest.jsp</title>
	<script src="../js/jquery-3.6.4.min.js"></script>
</head>
<body>

	<h3>교재 검색</h3>

	<form name="search" id="search">
	  <input type="text" name="keyword" id="keyword">
	  <input type="button" value="검색"> 
	</form>
	
	<!-- 검색 결과 출력 -->
	<div id="panel" style="display:none"></div>
	
	<script>
		$('#keyword').keyup(function(){

			if($('#keyword').val()==""){ //검색어가 존재하지 않으면
				$('#panel').hide()      //출력결과 숨기기
			}
			
			//1)id="keyword" 값 가져오기
			//let params=$("#keyword").val();
			//alert(params);  //java
		
			//2)<form id="search"></form>
			//  본문의 폼안의 모든 컨트롤 요소를 가져오기
			let params=$('#search').serialize()
			//alert(params);  //keyword=java
			
			$.post("searchproc.do", params, responseProc = (data) => {
				if (data.length>0) { //응답받은 데이터가 있다면
					const result = data.split("|")
					let title = result[1].split(",")
					let str = ""
					$.each(title, (index, key) => {
						str += "<a href='#'>" + key + "</a><br>"
					})
					$('#panel').html(str)
					$('#panel').show()
				} else {
					$('#panel').hide()
				}
			})
		})
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>