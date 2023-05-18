package kr.co.itwill.comment;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/comment")
public class CommentCont {

    private final CommentDAO commentDAO;

    @RequestMapping("/insert")
    @ResponseBody
    public int commentServiceInsert(@RequestParam int product_code, @RequestParam String content) throws Exception {
        CommentDTO comment = new CommentDTO();
        comment.setProduct_code(product_code);
        comment.setContent(content);

        // 로그인 기능을 구현했거나 따로 댓글 작성자를 입력받는 폼이 있다면 입력 받아온 값으로 사용하면 된다.
        // session.getAttribute()
        // 따로 폼을 구현하지 않았기 때문에 임시로 wname 값에 "test" 주입
        comment.setWname("test");
        return commentDAO.commentInsert(comment); //cnt>0 => insert 성공
    }

    @RequestMapping("/list")
    @ResponseBody
    public List<CommentDTO> commentServiceList(@RequestParam int product_code) throws Exception {
        return commentDAO.commentList(product_code);
    }
}


