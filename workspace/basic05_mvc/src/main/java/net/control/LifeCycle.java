package main.java.net.control;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/*
    [HttpServlet 클래스의 계층도]
    class GenericServlet {}
    class HttpServlet extends GenericServlet {}
    class LifeCycle extends HttpServlet {}

    [HttpServlet 생명주기]
    init() 서블릿이 호출되면 한번만 호출
        → service() 사용자가 요청할 때마다 계속 호출(요청 방식을 구분하는 역할)
        → service()
        → service()
    destroy() 서버가 중지되면 한번만 호출

    [HttpServlet 사용방법]
    LifeCycle 서블릿을 /WEB-INF/web.xml에 등록해야 함
    결과확인 http://localhost:9090/basic05_mvc/life.do
 */

public class LifeCycle extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // method=get 방식으로 요청하면 호출됨
        super.doGet(req, resp);
        System.out.println("doGet()호출");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // method=post 방식으로 요청하면 호출됨
        super.doPost(req, resp);
        System.out.println("doPost()호출");
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // URL을 통해서 요청이 들어오면, 전송방식 method=get 또는 method=post 방식으로 서비스를 요청했는지를 판단해서
        // doGet()메소드와 doPost()메소드를 구분해서 호출해주는 함수
        super.service(req, resp);
        System.out.println("service()호출");
    }

    @Override
    public void destroy() {
        // 서버가 중지되면 자동으로 한번만 호출됨
        super.destroy();
        System.out.println("destroy()호출");
    }

    @Override
    public void init() throws ServletException {
        // 서블릿(LifeCycle)이 최초로 호출될 때 한번만 호출됨
        // 초기 환경 설정할 때 사용
        super.init();
        System.out.println("init()호출");
    }

}
