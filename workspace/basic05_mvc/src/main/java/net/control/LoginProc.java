package main.java.net.control;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

// Controller + view 둘 다 보여줌
public class LoginProc extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // service() 메소드가 doPost() 메소드를 호출
        try {
            // 1) 한글 인코딩
            request.setCharacterEncoding("UTF-8");

            // 2) 사용자가 요청한 정보를 request 에서 가져와서 변수에 옮겨담기
            String uid = request.getParameter("uid").trim();
            String upw = request.getParameter("upw").trim();

            // 3) 요청한 사용자에게 응답
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<html> ");
            out.println("<head> ");
            out.println("    <title>환영합니다</title> ");
            out.println("</head> ");
            out.println("<body> ");
            out.println("    <h3> 회원 로그인 </h3> ");
            out.println("    아이디 : <strong>" + uid + "</strong> ");
            out.println("    <hr> ");
            out.println("    비밀번호 : <strong>" + upw + "</strong> ");
            out.println("</body> ");
            out.println("</html> ");
            out.close();


        } catch (Exception e) {
            System.out.println("요청 실패: " + e);
        }
    }
}
