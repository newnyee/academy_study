package kr.co.itwill;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

//URL에서 요청한 명령어를 읽어서 처리해 주는 클래스
//HelloController 클래스는 컨트롤러 기능이다
//스프링 컨테이너 (웹서버)가 자동으로 객체 생성된다
@Controller
public class HelloController {

    public HelloController() {
        System.out.println("HelloController() 객체 생성됨");
    }

    // 결과 확인 http://localhost:9095/hello.do
    // 요청 명령에 등록 후 실행의 주체는 메소드
    @RequestMapping("/hello.do")
    public ModelAndView hello() {
        // application.properties 환경 설정 파일의 prefix와 suffix값을 조합해서 뷰 페이지를 완성
        ModelAndView mav = new ModelAndView();
        mav.setViewName("hello"); // /WEB-INF/views/hello.jsp

        // 서로 다른 페이지들 간에 값을 공유하기 위한 전역변수
        // request, session, application 활용변수

        // request.setAttribute() 메소드와 동일
        mav.addObject("message", "<strong>환영합니다!</strong> Welcome To MyHome!");

        return mav;
    }

}
