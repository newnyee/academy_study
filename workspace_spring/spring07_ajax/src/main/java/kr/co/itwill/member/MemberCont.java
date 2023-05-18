package kr.co.itwill.member;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/member")
public class MemberCont {
    public MemberCont() {
        System.out.println("***** MemberCont()객체 생성");
    }

    // 아이디 중복 페이지 불러오기
    // 결과 확인 http://localhost:9095/member/idCheckform.do
    @RequestMapping("idCheckform.do")
    public String idCheckform() {
        return "member/idCheck";
    }

    @RequestMapping("idcheckproc.do")
    @ResponseBody
    public String idCheckproc(HttpServletRequest request) {
        String userid = request.getParameter("userid").trim();
        String message = "";

        if (userid.length() < 5 || userid.length() > 15) {
            message = "<span style='color:blue; font-weight:bold'>아이디는 5~15자 이내로 입력해 주세요</span>";
        } else {
            if (userid.equals("itwill") || userid.equals("webmaster")) {
                message = "<span style='color:red; font-weight:bold'>중복된 아이디 입니다</span>";
            } else {
                message = "<span style='color:green; font-weight:bold'>사용 가능한 아이디 입니다</span>";
            }
        }
        return message;
    }

    // 쿠키를 활용하여 아이디 중복확인을 해야함 회원가입이 가능하다
    // 결과확인 http://localhost:9095/member/idcheckcookieform.do
    @RequestMapping("idcheckcookieform.do")
    public String idCheckcookieform() {
        return "member/idCheck_cookie";
    }

    @RequestMapping("idcheckcookieproc.do")
    @ResponseBody
    public String idCheckCookieProc(HttpServletRequest request) {
        String userid = request.getParameter("userid").trim();
        String cnt = "0";

        if (userid.equals("itwill") || userid.equals("webmaster")) {
            cnt = "1";
        }
        // 1)text 응답 -> return cnt;

        // 2)json 응답 -> return cnt;
        // http://mvnrepository.com 에서 json-simple 검색 후, pom.xml에 의존성 추가해야함
        JSONObject json = new JSONObject();
        json.put("count", cnt);
        return json.toString();
    }

    @RequestMapping(value = "insert.do", method = RequestMethod.POST)
    public void insert(HttpServletRequest request) {
        System.out.println("아이디: " + request.getParameter("userid"));
        System.out.println("비밀번호: " + request.getParameter("passwd"));
        System.out.println("이름: " + request.getParameter("name"));
        System.out.println("이메일: " + request.getParameter("email"));
    }
}
