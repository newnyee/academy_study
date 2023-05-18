<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="member/auth.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- Theme Made By www.w3schools.com - No Copyright -->
    <title>My web</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
    <link rel="stylesheet" href="css/layout.css">
    <link rel="icon" type="image/png" href="images/20230426_200831-removebg-preview.png">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="js/jquery-3.6.4.min.js"></script>
    <script src="js/moment.min.js"></script>
    <script>

        // 메인페이지 하단 사진 스크롤
        let ctnt = [];
        ctnt[0] = "<img src='images/universe2.jpg' class='image-thumbnail'>";
        ctnt[1] = "<img src='images/universe3.jpg' class='image-thumbnail'>";
        ctnt[2] = "<img src='images/universe4.jpg' class='image-thumbnail'>";
        ctnt[3] = "<img src='images/universe5.jpg' class='image-thumbnail'>";
        ctnt[4] = "<img src='images/universe2.jpg' class='image-thumbnail'>";
        ctnt[5] = "<img src='images/universe3.jpg' class='image-thumbnail'>";
        ctnt[6] = "<img src='images/universe4.jpg' class='image-thumbnail'>";
        ctnt[7] = "<img src='images/universe5.jpg' class='image-thumbnail'>";

        let timer; // scroll 함수를 실행시키면 setTimeout 함수의 상태가 저장되고, killtime 함수를 실행시키면 clearTimeout() 함수가 작동되어 setTimeout 함수를 중지함


        const scroll = () => {
            // 이미지 8장을 동시에 왼쪽여백 조정하기
            for (let i=0; i<ctnt.length; i++) {
                let tmp = $("#area" + i).css('left')
                tmp = parseInt(tmp) - 1 + "px" // 몇 px 씩 움직일지 결정
                // 이미지 순환을 위해서 이미지 재배치
                if (tmp === "-380px") {
                    tmp = "2660px"
                }
                $("#area" + i).css('left', tmp)
            }
            // 스크롤 속도 -> 이미지를 -1px 씩 몇초마다 옮길지
            timer = setTimeout(scroll,15)
        }

        // ctnt에 저장된 이미지를 id=mydiv에 배치
        const start = () => {
            for(let i=0; i<ctnt.length; i++) {
                $('#mydiv').append(
                    $("<div id='area" + i + "' style='position:absolute; top:0; left:" + 380*i + "px'>")
                        .append($(ctnt[i]))
                )
            }
            // 페이지 시작 시 스크롤함수 시작 시간 설정
            setTimeout(scroll, 0)
        }

        $(document).ready(()=>{
            const showtime = () => {
                let fullDate = moment().format('YYYY MMM DD ddd h:mm:ss a')
                $('#myp').text(fullDate)
            }
            showtime()
            setInterval(showtime,1000)
            start()
        })
    </script>

</head>


<body>

    <!-- navbar -->
    <nav class="navbar navbar-default">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<%=request.getContextPath()%>">My Universe</a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="bbs/bbsList.jsp">자유게시판</a></li>
                    <li><a href="notice/noticeList.jsp">공지사항</a></li>
                    <li><a href="pds/pdsList.jsp">포토갤러리</a></li>
                    <li><a href="mail/mailForm.jsp">메일보내기</a></li>
<%
    if(s_id.equals("guest") || s_passwd.equals("guest") || s_mlevel.equals("guest")) {
        out.println("<li><a href='member/loginForm.jsp'>로그인</a></li>");
    } else {
        out.println("<li><a href='member/loginForm.jsp'>로그아웃</a></li>");
    }
%>
                </ul>
            </div>
        </div>
    </nav>

    <!-- First Container -->
    <div class="container-fluid bg-1 text-center">
        <img src="images/universe1.jpeg" class="img-responsive img-circle margin" style="display:inline" alt="universe" width="305" height="305"><br>
        <p id="myp"></p>
    </div>

    <!-- Second Container -->
    <div class="container-fluid text-center">
        <div id="mydiv" class="col-xs-12">
        </div>
    </div>

    <!-- Footer -->
    <footer class="container-fluid bg-4 text-center">
        Copyright &copy; 2023 MyWeb
    </footer>

</body>
</html>
