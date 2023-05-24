package kr.co.itwill.comment;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.yaml.snakeyaml.nodes.ScalarNode;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/comment")
public class CommentCont {

    private final CommentDAO commentDAO;

    @RequestMapping("/insert")
    @ResponseBody
    public int commentServiceInsert(int product_code, String content, HttpSession session) throws Exception {
        CommentDTO comment = new CommentDTO();
        String s_id = (String) session.getAttribute("s_id");

        comment.setProduct_code(product_code);
        comment.setContent(content);

        // 로그인 기능을 구현했거나 따로 댓글 작성자를 입력받는 폼이 있다면 입력 받아온 값으로 사용하면 된다.
        // session.getAttribute()
        // 따로 폼을 구현하지 않았기 때문에 임시로 wname 값에 "test" 주입
        comment.setWname(s_id);
        return commentDAO.commentInsert(comment); //cnt>0 => insert 성공
    }

    @RequestMapping("/list")
    @ResponseBody
    public List<CommentDTO> commentServiceList(int product_code) throws Exception { //@RequestParam 어노테이션 생략 가능
        return commentDAO.commentList(product_code);
    }

    @RequestMapping("/delete/{cno}") //"/delete/{cno}" 형태로 파라미터를 받으려면 @PathVariable 어노테이션을 사용해야함
    @ResponseBody //리턴한 값을 그대로 반환
    public int commentServiceDelete(@PathVariable int cno) throws Exception {
        return commentDAO.commentDelete(cno);
    }

    @RequestMapping("/update")
    @ResponseBody
    public int commentServiceUpdate(CommentDTO dto) throws Exception {
        return commentDAO.commentUpdate(dto);
    }
}


