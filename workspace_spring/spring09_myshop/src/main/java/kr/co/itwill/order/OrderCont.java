package kr.co.itwill.order;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/order")
public class OrderCont {

    private final OrderDAO orderDAO;

    @RequestMapping("/orderform")
    public String orderForm () {
        return "/order/orderForm";
    }

    @RequestMapping("/insert")
    public String orderInsert(@ModelAttribute OrderDTO dto, HttpSession session) {
        ModelAndView mav = new ModelAndView();

        /*
        * 주문서 번호 생성 알고리즘
        * 예) 최초주문 202305231717231
        * 주문번호 202305231717231 이 있다면 202305231717232생성*/

        // 오늘날짜 및 현재 시각을 문자열로 구성
        SimpleDateFormat sd = new SimpleDateFormat("yyyyMMddHHmmss");
        String orderno = sd.format(new Date()); //"년월일시분초"
        List<OrderDTO> list = orderDAO.findOrderno(orderno);
        if(list.size()>0){
            orderno += list.size()+1;
        } else {
            orderno += 1;
        }
        dto.setOrderno(orderno);

        // insert
        int cnt = orderDAO.orderInsert(dto);
        return "redirect:/order/orderform";
    }
}
