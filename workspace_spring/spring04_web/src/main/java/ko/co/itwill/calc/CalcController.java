package ko.co.itwill.calc;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CalcController {

    public CalcController() {
        System.out.println("*****CalcController() 객체 생성");
    }

    // URL에서 요청한 명령어를 등록
    // @RequestMapping(value = "", method = )
     @RequestMapping(value = "/add.do", method = RequestMethod.GET)
    public ModelAndView add(HttpServletRequest request) {

        // 결과확인 http://localhost:9095/add.do?no1=3&no2=5
        // 사용자가 요청한 값 가져오기
        int no1 = Integer.parseInt(request.getParameter("no1"));
        int no2 = Integer.parseInt(request.getParameter("no2"));
        int result = no1 + no2;

        // 전역변수를 활용하여 공유장소에 값 올리기
        request.setAttribute("no1", no1);
        request.setAttribute("no2", no2);
        request.setAttribute("result", result);
        request.setAttribute("message", "<strong>두 수의 합</strong>");
        request.setAttribute("img", "<img src='images/add.png'>");

        // View 페이지로 이동하기 위한 클래스
        ModelAndView mav = new ModelAndView();
        mav.setViewName("calcResult"); // /WEB-INF/views/calcResult.jsp
        return mav;
    }

     @RequestMapping(value = "/sub.do", method = RequestMethod.GET)
    public ModelAndView sub(HttpServletRequest request) {

        // 결과확인 http://localhost:9095/sub.do?no1=3&no2=5
        // 사용자가 요청한 값 가져오기
        int no1 = Integer.parseInt(request.getParameter("no1"));
        int no2 = Integer.parseInt(request.getParameter("no2"));
        int result = no1 - no2;

        // View 페이지로 이동하기 위한 클래스
        ModelAndView mav = new ModelAndView();
        mav.setViewName("calcResult"); // /WEB-INF/views/calcResult.jsp

        // 전역변수를 활용하여 공유장소에 값 올리기
        // request.setAttribute() 메소드와 동일한 메소드
        mav.addObject("no1", no1);
        mav.addObject("no2", no2);
        mav.addObject("result", result);
        mav.addObject("message", "<strong>두 수의 차</strong>");
        mav.addObject("img", "<img src='images/sub.png'>");

        return mav;
    }

    @RequestMapping(value = "/mul.do", method = RequestMethod.GET)
    public ModelAndView mul(HttpServletRequest request) {

        // 결과확인 http://localhost:9095/mul.do?no1=3&no2=5
        // 사용자가 요청한 값 가져오기
        int no1 = Integer.parseInt(request.getParameter("no1"));
        int no2 = Integer.parseInt(request.getParameter("no2"));
        int result = no1 * no2;

        // View 페이지로 이동하기 위한 클래스
        ModelAndView mav = new ModelAndView();
        mav.setViewName("calcResult"); // /WEB-INF/views/calcResult.jsp

        // 전역변수를 활용하여 공유장소에 값 올리기
        // request.setAttribute() 메소드와 동일한 메소드
        mav.addObject("no1", no1);
        mav.addObject("no2", no2);
        mav.addObject("result", result);
        mav.addObject("message", "<strong>두 수의 곱</strong>");
        mav.addObject("img", "<img src='images/mul.png'>");

        return mav;
    }

    @RequestMapping(value = "/div.do", method = RequestMethod.GET)
    public ModelAndView div(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        // 결과확인 http://localhost:9095/div.do?no1=3&no2=5
        // 사용자가 요청한 값 가져오기
        int no1 = Integer.parseInt(request.getParameter("no1"));
        int no2 = Integer.parseInt(request.getParameter("no2"));
        double result = (double) no1 / no2;

        // View 페이지로 이동하기 위한 클래스
        ModelAndView mav = new ModelAndView();
        mav.setViewName("calcResult"); // /WEB-INF/views/calcResult.jsp

        // 전역변수를 활용하여 공유장소에 값 올리기
        // request.setAttribute() 메소드와 동일한 메소드
        mav.addObject("no1", no1);
        mav.addObject("no2", no2);
        mav.addObject("result", result);
        mav.addObject("message", "<strong>두 수의 나누기</strong>");
        mav.addObject("img", "<img src='images/div.png'>");

        return mav;
    }
}
