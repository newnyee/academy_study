package kr.co.itwill.product;

import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Repository
@RequiredArgsConstructor // 스프링 빈으로 생성된 객체를 가져와서 연결하기
public class ProductDAO {

    private final SqlSession sqlSession;

    public List<Map<String, Object>> list() {
        return sqlSession.selectList("product.list");
    }

    public int insert(Map<String, Object> map) {
        return sqlSession.insert("product.insert", map);
    }

    public List<Map<String, Object>> search(String product_name) {
        return sqlSession.selectList("product.search", product_name);
    }

    public Map<String, Object> detail(int product_code) {
        return sqlSession.selectOne("product.detail", product_code);
    }

    public int delete(int product_code) {
        return sqlSession.delete("product.delete", product_code);
    }

    public int update(Map<String, Object> map) {
        return sqlSession.update("product.update", map);
    }

}
