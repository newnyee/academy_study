package ko.co.itwill.login;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginCont {

    public LoginCont() {
        System.out.println("*****LoginCont() 객체 생성");
    }

    @RequestMapping(value = "login.do", method = RequestMethod.GET)
    public String loginForm() {
        return "login/loginForm";
    }

    @RequestMapping(value = "login.do", method = RequestMethod.POST)
    public ModelAndView loginProc(LoginDTO dto, HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        String id = dto.getId();
        String pw = dto.getPw();
/*      request.getParameter("id");
        request.getParameter("pw");*/

        ModelAndView mav = new ModelAndView();
        if(id.equals("itwill") && pw.equals("1234")) { //로그인 성공
            mav.setViewName("login/loginProc");
            // session 전역변수에 값 올리기
            session.setAttribute("s_id", id);
            session.setAttribute("s_pw", pw);
            request.setAttribute("message", "<strong>로그인 성공</strong>");
        } else {
            mav.setViewName("login/msgView");
            request.setAttribute("message", "<p>아이디와 비번이 일치하지 않습니다</p>");
            request.setAttribute("link", "<a href='javascript:history.back()'>[다시시도]</a>");
        }
        return mav;
    }
}
