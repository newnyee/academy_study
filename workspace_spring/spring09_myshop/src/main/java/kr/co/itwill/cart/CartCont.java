package kr.co.itwill.cart;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/cart")
public class CartCont {

    private final CartDAO cartDAO;

    @RequestMapping("/insert")
    public String cartInsert(@ModelAttribute CartDTO dto/*, HttpSession session*/) throws Exception {
        // 로그인 기능을 구현했거나 댓글 작성자를 입력받는 폼이 잇다면 입력 받아온 값으로 사용하면 된다.
        // session.getAttribute() 활용
        // 여기서는 따로 폼을 구현하지 않았기 때문에 임시로 "test"

        dto.setId("test");
        int cnt = cartDAO.cartInsert(dto);

        if (cnt == 1) {
            return "redirect:/cart/list";
        } else {
            return "redirect:/product/list";
        }
    }

    @RequestMapping("/list")
    public ModelAndView cartList(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("cart/list");

        // 로그인 했다면
        // String s_id = session.getAtrribute("s_id")
        // mav.addObject("list", cartDAO.cartlist(s_id));

        String s_id = (String) session.getAttribute("s_id"); //여기서는 임시 아이디 test
        mav.addObject("list", cartDAO.cartlist(s_id));
        return mav;
    }

    @RequestMapping("/delete")
    public String cartDelete(int cartno) {
        int cnt = cartDAO.cartDelete(cartno);

        if (cnt == 1) {
            return "redirect:/cart/list";
        } else {
            return "redirect:/product/list";
        }
    }
}
