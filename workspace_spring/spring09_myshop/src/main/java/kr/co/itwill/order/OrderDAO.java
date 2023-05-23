package kr.co.itwill.order;

import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class OrderDAO {

    private final SqlSession sqlSession;

    public List<OrderDTO> findOrderno (String date) {
        return sqlSession.selectList("order.findOrderno",date);
    }

    public int orderInsert(OrderDTO dto) {
        return sqlSession.insert("order.orderInsert", dto);
    }
}
