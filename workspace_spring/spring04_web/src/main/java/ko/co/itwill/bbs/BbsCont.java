package ko.co.itwill.bbs;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BbsCont {

    public BbsCont() {
        System.out.println("*****BbsCont() 객체 생성");
    }

    // 결과 확인 http://localhost:9095/bbs/create.do GET 방식으로 호출
    @RequestMapping(value = "/bbs/create.do", method = RequestMethod.GET)
    // 1)
    /*public ModelAndView bbsFrom() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("bbs/bbsForm");
        return mav;
    }*/

    // 2) 위의 1번과 동일하게 페이지 이동 가능
    public String bbsForm() {
        return "bbs/bbsForm"; // /WEB-INF/views/bbs/bbsForm.jsp
    }

    // 동일한 요청명령어를 GET | POST 방식으로 구분해서 호출 가능
    @RequestMapping(value = "/bbs/create.do", method = RequestMethod.POST)
/*  1) 매개변수가 HttpServletRequest 객체인 경우
    public ModelAndView bbsIns(HttpServletRequest request) {
        // 사용자가 입력 요청한 정보 가져오기
        String wname = request.getParameter("wname").trim();
        String subject = request.getParameter("subject");
        String content = request.getParameter("content");
        String passwd = request.getParameter("passwd").trim();

        ModelAndView mav = new ModelAndView();
        mav.setViewName("bbs/bbsResult");

        mav.addObject("wname", wname);
        mav.addObject("subject", subject);
        mav.addObject("content", content);
        mav.addObject("passwd", passwd);

        return mav;
    }*/


    /*  2) 매개변수가 DTO 객체인 경우
    *   [매개변수로 객체를 사용할 경우 지켜야할 것]
    *   객체가 자바빈의 형식이어야함 (멤버변수/기본생성자/getter,setter메소드)
    *   객체의 멤버 변수와 폼 컨트롤 요소의 이름과 동일해야함
    *   @ModelAttribute 어노테이션 생략 가능*/
    public ModelAndView bbsIns(@ModelAttribute BbsDTO dto) {
        // 결과 확인 http://localhost:9095/bbs/create.do GET 방식으로 호출
        ModelAndView mav = new ModelAndView();
        mav.setViewName("bbs/bbsResult2");

        // 객체 자체를 Model에 저장해서 "객체.멤버변수"로 값을 꺼낼 수 있음 (EL방식)
        mav.addObject("dto", dto);

        return mav;
    }
}
