package kr.co.mymelon.mediagroup;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Collections;
import java.util.List;

@Controller
public class MediaGroupCont {

    //스프링 컨테이너가 생성한 객체 사용시 @Autowired 어노테이션 사용
    private final MediaGroupDAO dao;

    // 생성자로 객체 생성 확인
    public MediaGroupCont(MediaGroupDAO dao) {
        this.dao = dao;
        System.out.println("***** MediaGroupCont() 객체 생성");
    }

    // 미디어 그룹 쓰기 페이지 호출
    // http://localhost:9095/mediagroup/create.do
    @RequestMapping(value = "mediagroup/create.do", method = RequestMethod.GET)
    public String createForm() {
        return "mediagroup/createForm"; // /WEB-INF/views/mediagroup/createForm.jsp
    }

    // 글 쓰기 프로세스
    // http://localhost:9095/mediagroup/create.do
    @RequestMapping(value = "mediagroup/create.do", method = RequestMethod.POST)
    public ModelAndView createProc(@ModelAttribute MediaGroupDTO dto) {
        ModelAndView mav = new ModelAndView();

        int cnt = dao.create(dto);

        if (cnt == 0) {
            mav.setViewName("mediagroup/msgView");
            String msg1 = "<p>미디어 그룹 등록 실패</p>";
            String img = "<img src='../images/fail.png'>";
            String link1 = "<input type='button' value='다시시도' onclick='javascript:history.back()'>";
            String link2 = "<input type='button' value='그룹목록' onclick='location.href=\"list.do\"'>";

            mav.addObject("msg1", msg1);
            mav.addObject("img", img);
            mav.addObject("link1", link1);
            mav.addObject("link2", link2);
        } else {
            mav.setViewName("redirect:/mediagroup/list.do");
        }
        return mav;
    }

    // 글 목록 조회
    // http://localhost:9095/mediagroup/list.do
    @RequestMapping("mediagroup/list.do")
    public ModelAndView list(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("mediagroup/list");

        int totalRowCount = dao.totalRowCount(); //총 글갯수

        // 페이징
        int numPerpage = 5; //한 페이지당 레코드 갯수
        int pagePerBlock = 5; //보여질 페이지 리스트 갯수

        String pageNum = request.getParameter("pageNum"); //현재 페이지 넘버
        if (pageNum == null) {
            pageNum = "1";
        }
        int currentPage = Integer.parseInt(pageNum); //현재 페이지 넘버 int 형변환
        int startRow = totalRowCount - currentPage * numPerpage + 1; //DB에서 불러올 시작 글 rownum
        int endRow = totalRowCount - (currentPage - 1) * numPerpage; //DB에서 불러올 시작 글 rownum

        //전체 페이지 수 = 총 글갯수/한 페이지당 레코드 갯수
        double totcnt = (double) totalRowCount / numPerpage;
        int totalPage = (int) Math.ceil(totcnt); // 올림 함수 이용

        // 보여질 페이지 리스트 페이징
        double d_page = (double) currentPage / pagePerBlock; //현재페이지번호/보여질 페이지 리스트 갯수
        int pages = (int) Math.ceil(d_page) - 1; // 1~5 => 0 / 6~10 =>1
        int startPage = pages * pagePerBlock; // 시작페이지 0 / 5
        int endPage = startPage + pagePerBlock + 1; // 끝페이지 6 / 11


        List<MediaGroupDTO> list = null;
        if (totalRowCount > 0) {
            list = dao.list2(startRow, endRow);
        } else {
            list = Collections.EMPTY_LIST;
        }

        mav.addObject("pageNum", currentPage);
        mav.addObject("count", totalRowCount);
        mav.addObject("totalPage", totalPage);
        mav.addObject("startPage", startPage);
        mav.addObject("endPage", endPage);
        mav.addObject("pagePerBlock", pagePerBlock);
        mav.addObject("list", list);

        return mav;
    }


    //글 삭제 폼
    @RequestMapping(value = "mediagroup/delete.do", method = RequestMethod.GET)
    public ModelAndView deleteForm(int mediagroupno) { //dto, request, @RequestParam, mediagroupno
        ModelAndView mav = new ModelAndView();
        mav.setViewName("mediagroup/deleteForm");
        mav.addObject("mediagroupno", mediagroupno);
        return mav;
    }

    //글 삭제 프로세스
    @RequestMapping(value = "mediagroup/delete.do", method = RequestMethod.POST)
    public ModelAndView deleteProc(int mediagroupno) { //dto, request, @RequestParam, mediagroupno
        ModelAndView mav = new ModelAndView();

        int cnt = dao.delete(mediagroupno);

        if (cnt == 0) {
            mav.setViewName("mediagroup/msgView");
            String msg1 = "<p>미디어 그룹 삭제 실패</p>";
            String img = "<img src='../images/fail.png'>";
            String link1 = "<input type='button' value='다시시도' onclick='javascript:history.back()'>";
            String link2 = "<input type='button' value='그룹목록' onclick='location.href=\"list.do\"'>";

            mav.addObject("msg1", msg1);
            mav.addObject("img", img);
            mav.addObject("link1", link1);
            mav.addObject("link2", link2);
        } else {
            mav.setViewName("redirect:/mediagroup/list.do");
        }
        return mav;
    }

    // 글 수정 폼
    @RequestMapping(value = "mediagroup/update.do", method = RequestMethod.GET)
    public ModelAndView updateForm(int mediagroupno) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("mediagroup/updateForm");
        mav.addObject("dto", dao.read(mediagroupno));
        return mav;
    }

    // 글 수정 프로세스
    @RequestMapping(value = "mediagroup/update.do", method = RequestMethod.POST)
    public ModelAndView updateProc(MediaGroupDTO dto) {
        ModelAndView mav = new ModelAndView();

        int cnt = dao.update(dto);

        if (cnt == 0) {
            mav.setViewName("mediagroup/msgView");
            String msg1 = "<p>미디어 그룹 수정 실패</p>";
            String img = "<img src='../images/fail.png'>";
            String link1 = "<input type='button' value='다시시도' onclick='javascript:history.back()'>";
            String link2 = "<input type='button' value='그룹목록' onclick='location.href=\"list.do\"'>";

            mav.addObject("msg1", msg1);
            mav.addObject("img", img);
            mav.addObject("link1", link1);
            mav.addObject("link2", link2);
        } else {
            mav.setViewName("redirect:/mediagroup/list.do");
        }
        return mav;
    }
}