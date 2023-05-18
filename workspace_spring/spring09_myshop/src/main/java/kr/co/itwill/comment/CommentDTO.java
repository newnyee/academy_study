package kr.co.itwill.comment;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CommentDTO {

    private int product_code;
    private int cno;
    private String content;
    private String wname;
    private String regdate;

    public CommentDTO() {}

    @Override
    public String toString() {
        return "CommentDTO{" +
                "product_code=" + product_code +
                ", cno=" + cno +
                ", content='" + content + '\'' +
                ", wname='" + wname + '\'' +
                ", regdate='" + regdate + '\'' +
                '}';
    }
}
