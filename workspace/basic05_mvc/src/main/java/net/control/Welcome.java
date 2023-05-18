package main.java.net.control;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

// HttpServlet 클래스
// http 프로토콜 기반의 요청과 응답을 처리해 주는 클래스

// Welcome 서블릿 클래스
// web.xml에 등록하여 사용할 수 있음

// 결과확인
// http://localhost:9090/basic05_mvc/wel.do

public class Welcome extends HttpServlet {
   // class 상속 → extends
   // interface 구현 → implement

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // request : MVC1 방식의 내장객체 request 와 동일
        // response : MVC1 방식의 내장객체 response 와 동일

        try {
            // HTML 문서 구조로 응답
            response.setContentType("text/html;charset=UTF-8");

            // 단순 문자열 응답(AJAX)
            // response.setContentType("text/plain;charset=UTF-8");

            // 요청한 사용자에게 응답하기 위한 출력 객체
            PrintWriter out = response.getWriter();
            out.println("<html> ");
            out.println("<head> ");
            out.println("    <title>환영합니다</title> ");
            out.println("</head> ");
            out.println("<body> ");
            out.println("    <strong>대한민국</strong> ");
            out.println("    <hr> ");
            out.println("    <span style='color: red'>오필승 코리아</span> ");
            out.println("    <hr> ");
            out.println("    <table border='1'> ");
            out.println("        <tr> ");
            out.println("            <th>이름</th> ");
            out.println("            <td>무궁화</td> ");
            out.println("        </tr> ");
            out.println("    </table> ");
            out.println("</body> ");
            out.println("</html> ");
            out.close();
        } catch (Exception e) {
            System.out.println("요청 실패: " + e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
