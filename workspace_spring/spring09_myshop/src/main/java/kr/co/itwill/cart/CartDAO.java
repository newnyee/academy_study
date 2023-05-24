package kr.co.itwill.cart;

import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@RequiredArgsConstructor
public class CartDAO {

    private final SqlSession sqlSession;

    public int cartInsert(CartDTO dto) {
        return sqlSession.insert("cart.insert", dto);
    }

    public List<Map<String, Object>> cartlist(String s_id) {
        return sqlSession.selectList("cart.list", s_id);
    }

    public int cartDelete(int cartno) {
        return sqlSession.delete("cart.delete", cartno);
    }

    public int cartDeleteAll(String s_id) {
        return sqlSession.delete("cart.deleteAll", s_id);
    }
}
