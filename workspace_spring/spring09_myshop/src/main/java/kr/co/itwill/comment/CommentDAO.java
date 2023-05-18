package kr.co.itwill.comment;

import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class CommentDAO {

    private final SqlSession sqlSession;

    public int commentInsert(CommentDTO comment) {
        int cnt = 0;
        cnt = sqlSession.insert("comment.insert", comment);
        return cnt;
    }

    public List<CommentDTO> commentList(int product_code) {
        return sqlSession.selectList("comment.list", product_code);
    }
}
