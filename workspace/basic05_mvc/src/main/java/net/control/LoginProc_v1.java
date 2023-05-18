package main.java.net.control;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

// Controller 하나만 담당
public class LoginProc_v1 extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // service() 메소드가 doPost() 메소드를 호출
        try {
            // 1) 한글 인코딩
            request.setCharacterEncoding("UTF-8");

            // 2) 사용자가 요청한 정보를 request 에서 가져와서 변수에 옮겨담기
            String uid = request.getParameter("uid").trim();
            String upw = request.getParameter("upw").trim();

            // 요청한 사용자의 session 객체 선언
            HttpSession session = request.getSession();

            // 요청한 사용자의 application 객체 선언
            ServletContext application = request.getServletContext();

            // 3) 요청한 사용자에게 응답 (페이지 이동)
            if (uid.equals("itwill") && upw.equals("1234")) { //DB연결에 성공했다고 가정
                // request 에 값을 넣음
                request.setAttribute("r_uid", uid);
                request.setAttribute("r_upw", upw);

                // session 에 값을 넣음
                session.setAttribute("s_uid", uid);
                session.setAttribute("s_upw", upw);

                // application 에 값을 넣음
                application.setAttribute("a_uid", uid);
                application.setAttribute("a_upw", upw);

                request.setAttribute("msg", "로그인 성공");
                request.setAttribute("img", "<img src='control/sound.png'>");

            } else { //DB연결에 실패했다고 가정
                // request
                request.setAttribute("r_uid", "guest");
                request.setAttribute("r_upw", "guest");

                // session
                session.setAttribute("s_uid", "guest");
                session.setAttribute("s_upw", "guest");

                // application
                application.setAttribute("a_uid", "guest");
                application.setAttribute("a_upw", "guest");

                request.setAttribute("msg", "로그인 실패");
                request.setAttribute("img", "<img src='control/fail.png'>");

            }

            // 4) 페이지 이동

            //request 값 유효하지 않음
            // response.sendRedirect("control/loginResult.jsp");

            // request 값 유효함
            RequestDispatcher rd = request.getRequestDispatcher("control/loginResult.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            System.out.println("요청 실패: " + e);
        }
    }
}
