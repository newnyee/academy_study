package kr.co.itwill;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class HomeController {

    public HomeController() {
    }

    // http://localhost:9095
    @RequestMapping("/")
    public ModelAndView home(HttpSession session) {
        String s_id = "test";
        session.setAttribute("s_id", s_id);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("redirect:/product/list");
        return mav;
    }
}
