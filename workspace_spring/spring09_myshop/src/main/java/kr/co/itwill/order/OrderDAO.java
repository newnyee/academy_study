package kr.co.itwill.order;

import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
@RequiredArgsConstructor
public class OrderDAO {

    private final SqlSession sqlSession;

    public List<OrderDTO> findOrderno (String date) {
        return sqlSession.selectList("order.findOrderno",date);
    }

    public int orderListInsert(OrderDTO dto) {
        return sqlSession.insert("order.orderListInsert", dto);
    }

    public int totalAmount(String s_id) {
        return sqlSession.selectOne("order.totalAmount", s_id);
    }

    public int orderDetailInsert(HashMap<String, String> map) {
        return sqlSession.insert("order.orderDetailInsert", map);
    }

    public List<Map<String, Object>> orderDetailList(String s_id) {
        return sqlSession.selectList("order.orderDetailList", s_id);
    }
}
