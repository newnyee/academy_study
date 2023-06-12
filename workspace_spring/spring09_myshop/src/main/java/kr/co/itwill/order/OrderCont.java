package kr.co.itwill.order;

import kr.co.itwill.cart.CartDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/order")
public class OrderCont {

    private final OrderDAO orderDAO;
    private final CartDAO cartDAO;

    @RequestMapping("/orderform")
    public String orderForm () {
        return "/order/orderForm";
    }

    @RequestMapping("/insert")
    public ModelAndView orderInsert(@ModelAttribute OrderDTO dto, HttpSession session) {
        ModelAndView mav = new ModelAndView();
        String s_id = (String) session.getAttribute("s_id"); //세션 아이디 가져오기

        // 주문서 번호만들기
        /* 주문서 번호 생성 알고리즘
        * 예) 최초주문 202305231717231
        * 주문번호 202305231717231 이 있다면 202305231717232생성*/
        SimpleDateFormat sd = new SimpleDateFormat("yyyyMMddHHmmss"); //오늘날짜 및 현재 시각을 문자열로 구성
        String orderno = sd.format(new Date()); //"년월일시분초"
        List<OrderDTO> list = orderDAO.findOrderno(orderno);
        if(list.size()>0){
            orderno += list.size()+1;
        } else {
            orderno += 1;
        }

        // 총 결제금액 구하기
        int totalamount = orderDAO.totalAmount(s_id);

        // dto에 담기
        dto.setId(s_id);
        dto.setOrderno(orderno);
        dto.setTotalamount(totalamount);

        // 주문정보(orderlist) 행추가
        int cnt = orderDAO.orderListInsert(dto);

        // 장바구니의 상품들 orderdetil 테이블에 행추가
        if (cnt == 1) {
            HashMap<String, String> map = new HashMap<>();
            map.put("orderno", orderno);
            map.put("s_id", s_id);

            int result = orderDAO.orderDetailInsert(map);

            // 장바구니 비우기
            if (result > 0) {
                int resultCount = cartDAO.cartDeleteAll(s_id);

                // 주문내역서 메일 보내기
                if (resultCount > 0) {
                    mav.addObject("orderResult", "1"); //주문 성공
                    mav.addObject("orderno", orderno);
                } else {
                    mav.addObject("orderResult", "0"); //주문 실패
                }
            }
        }
        mav.setViewName("/order/orderResult");
        return mav;
    }

    @RequestMapping("/orderdetail")
    public ModelAndView orderDetailList (HttpSession session) {
        ModelAndView mav = new ModelAndView();
        String s_id = (String) session.getAttribute("s_id");

        List<Map<String, Object>> list = orderDAO.orderDetailList(s_id);
        mav.addObject("list", list);

        mav.setViewName("/order/orderDetailList");
        return mav;
    }
}