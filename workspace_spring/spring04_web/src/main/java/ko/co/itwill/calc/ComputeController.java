package ko.co.itwill.calc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class ComputeController {

    public ComputeController() {
        System.out.println("*****ComputeController() 객체 생성");
    }

    // 요청명령어를 처리하는 메소드 매개변수의 유연성
    // @RequestParam("요청변수명") 자료형 변수명
    // 사용자가 요청한 값을 변수에 직접 저장이 가능하다
    @RequestMapping("/diff.do") //메소드 언급 없을 시 get → post 순으로 찾음
    public ModelAndView diff(@RequestParam("no1") int a, @RequestParam("no2") int b) {
        // 결과 확인 http://localhost:9095/diff.do?no1=3&no2=5
        // 사용자가 요청한 값 가져오기
        int result = Math.abs(a-b);

        // View 페이지로 이동하기 위한 클래스
        ModelAndView mav = new ModelAndView();
        mav.setViewName("calcResult"); // /WEB-INF/views/calcResult.jsp

        // 전역변수를 활용하여 공유장소에 값 올리기
        // request.setAttribute() 메소드와 동일한 메소드
        mav.addObject("no1", a);
        mav.addObject("no2", b);
        mav.addObject("result", result);
        mav.addObject("message", "<strong>두 수의 차이(절대값)</strong>");
        mav.addObject("img", "<img src='images/sub.png'>");

        return mav;
    }

    // 사용자가 요청한 값을 매개변수로 직접 저장 가능하다
    @RequestMapping("/max.do")
    public ModelAndView max(int no1, int no2) {
        // 결과 확인 http://localhost:9095/max.do?no1=3&no2=5
        // 사용자가 요청한 값 가져오기
        int result = Math.max(no1,no2);

        // View 페이지로 이동하기 위한 클래스
        ModelAndView mav = new ModelAndView();
        mav.setViewName("calcResult"); // /WEB-INF/views/calcResult.jsp

        // 전역변수를 활용하여 공유장소에 값 올리기
        // request.setAttribute() 메소드와 동일한 메소드
        mav.addObject("no1", no1);
        mav.addObject("no2", no2);
        mav.addObject("result", result);
        mav.addObject("message", "<strong>두 수 중 최대값</strong>");
        mav.addObject("img", "<img src='images/sunny.png'>");

        return mav;
    }
}
