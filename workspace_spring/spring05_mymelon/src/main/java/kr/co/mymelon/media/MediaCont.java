package kr.co.mymelon.media;

import kr.co.mymelon.mediagroup.MediaGroupDAO;
import net.utility.UploadSaveManager;
import net.utility.Utility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

@Controller
public class MediaCont {

    @Autowired
    private MediaDAO dao;
    @Autowired
    private MediaGroupDAO dao1;

    public MediaCont() {
        System.out.println("***** Mediacont() 객체 생성");
    }

    // 음원 리스트 조회
    // http://localhost:9095/media/list.do?mediagroupno=106
    @RequestMapping("media/list.do")
    public ModelAndView list(int mediagroupno) {
        ModelAndView mav = new ModelAndView();

        mav.setViewName("media/list");
        mav.addObject("dto1", dao1.read(mediagroupno));
        mav.addObject("list", dao.list(mediagroupno));
        mav.addObject("mediagroupno", mediagroupno); //부모 글번호
        return mav;
    }

    // 음원 등록
    @RequestMapping(value = "media/create.do", method = RequestMethod.GET)
    public ModelAndView createForm(int mediagroupno) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("media/createForm");
        mav.addObject("mediagroupno", mediagroupno); //부모 글번호
        return mav;
    }

    // 음원 등록 프로세스
    @RequestMapping(value = "media/create.do", method = RequestMethod.POST)
    public ModelAndView createProc(@ModelAttribute MediaDTO dto, HttpServletRequest request) {
        //매개변수 String title, MultipartFile posterMF, MultipartFile filenameMF 로 받아도 됨
        String mediagroupno = request.getParameter("mediagroupno");

        ModelAndView mav = new ModelAndView();
        // 첨부된 파일 처리
        // 실제 파일은 storage폴더에 저장
        // 저장된 파일 관련 정보는 media테이블에 저장
        // 파일 저장 폴더의 실제 물리적인 경로 가져오기
        ServletContext application = request.getServletContext();
        String basePath = application.getRealPath("/storage");

        // 파일 가져오기
        MultipartFile posterMF = dto.getPosterMF();
        MultipartFile filenameMF = dto.getFilenameMF();

        // /storage폴더에 파일 저장하고, 리네임 된 파일명 반환
        String poster = UploadSaveManager.saveFileSpring30(posterMF, basePath);
        String filename = UploadSaveManager.saveFileSpring30(filenameMF, basePath);

        // 리네임된 파일명을 dto 객체 담기
        dto.setPoster(poster);
        dto.setFilename(filename);
        dto.setFilesize(filenameMF.getSize());

        int cnt = dao.create(dto);

        if (cnt == 0) {
            mav.setViewName("mediagroup/msgView");
            String msg1 = "<p>음원 등록 실패</p>";
            String img = "<img src='../images/fail.png'>";
            String link1 = "<input type='button' value='다시시도' onclick='javascript:history.back()'>";
            String link2 = "<input type='button' value='음원목록' onclick='location.href=\"list.do?mediagroupno=" + mediagroupno + "\"'>";

            mav.addObject("msg1", msg1);
            mav.addObject("img", img);
            mav.addObject("link1", link1);
            mav.addObject("link2", link2);
        } else {
            mav.setViewName("redirect:/media/list.do?mediagroupno=" + mediagroupno);
        }
        return mav;
    }

    // 음원 삭제 프로세스
    @RequestMapping(value = "media/delete.do", method = RequestMethod.GET)
    public ModelAndView deleteProc(int mediano, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        ServletContext application = request.getServletContext();
        MediaDTO dto = dao.read(mediano);

        int cnt = 0;
        if (dto != null) {
            cnt = dao.delete(mediano);
        }

        if (cnt == 0) {
            mav.setViewName("mediagroup/msgView");
            String msg1 = "<p>음원 삭제 실패</p>";
            String img = "<img src='../images/fail.png'>";
            String link1 = "<input type='button' value='다시시도' onclick='javascript:history.back()'>";
            String link2 = "<input type='button' value='음원목록' onclick='location.href=\"list.do?mediagroupno=" + dto.getMediagroupno() + "\"'>";

            mav.addObject("msg1", msg1);
            mav.addObject("img", img);
            mav.addObject("link1", link1);
            mav.addObject("link2", link2);
        } else {
            String poster = dto.getPoster();
            String filename = dto.getFilename();
            String path = application.getRealPath("/storage");
            Utility.deleteFile(path, poster);
            Utility.deleteFile(path, filename);

            String message = "alert('음원이 삭제되었습니다')";
            mav.addObject("message", message);
            mav.setViewName("redirect:/media/list.do?mediagroupno=" + dto.getMediagroupno());
        }
        return mav;
    }

    // 음원 상세
    @RequestMapping("media/read.do")
    public ModelAndView read(int mediano) {
        ModelAndView mav = new ModelAndView();
        MediaDTO dto = dao.read(mediano);
        if (dto != null) {
            String filename = dto.getFilename().trim(); //파일명 가져오기
            filename = filename.toLowerCase(); //파일명 전부 소문자로 바꾸기

            if (filename.endsWith(".mp3")) { //마지막 문자열이 .mp3인지 확인
                mav.setViewName("media/readMP3");
            } else if (filename.endsWith(".mp4")) { //마지막 문자열이 .mp4인지 확인
                mav.setViewName("media/readMP4");
            }
        }
        mav.addObject("dto", dto);
        return mav;
    }

    // 음원 수정 폼
    @RequestMapping(value = "media/update.do", method = RequestMethod.GET)
    public ModelAndView updateForm(int mediano) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("media/updateForm");
        MediaDTO dto = dao.read(mediano);
        mav.addObject("dto", dto);
        return mav;
    }

    // 음원 수정 프로세스
    @RequestMapping(value = "media/update.do", method = RequestMethod.POST)
    public ModelAndView updateProc(@ModelAttribute MediaDTO dto, HttpServletRequest request) {

        int cnt = 0;
        ModelAndView mav = new ModelAndView();
        MediaDTO oldDTO = dao.read(dto.getMediano());
        ServletContext application = request.getServletContext();
        String basePath = application.getRealPath("/storage");

        if(oldDTO != null) {

            // 파일 가져오기
            MultipartFile posterMF = dto.getPosterMF();
            MultipartFile filenameMF = dto.getFilenameMF();

            if (posterMF.getSize() > 0) {

                // /storage폴더에 파일 저장하고, 리네임 된 파일명 반환
                String poster = UploadSaveManager.saveFileSpring30(posterMF, basePath);
                String filename = UploadSaveManager.saveFileSpring30(filenameMF, basePath);

                // 리네임된 파일명을 dto 객체 담기
                dto.setPoster(poster);
                dto.setFilename(filename);
                dto.setFilesize(filenameMF.getSize());

                cnt = dao.update(dto);
            }
        }

        if (cnt == 0) {
            mav.setViewName("mediagroup/msgView");
            String msg1 = "<p>음원 수정 실패</p>";
            String img = "<img src='../images/fail.png'>";
            String link1 = "<input type='button' value='다시시도' onclick='javascript:history.back()'>";
            String link2 = "<input type='button' value='음원목록' onclick='location.href=\"list.do?mediagroupno=" + dto.getMediagroupno() + "\"'>";

            mav.addObject("msg1", msg1);
            mav.addObject("img", img);
            mav.addObject("link1", link1);
            mav.addObject("link2", link2);
        } else {
            UploadSaveManager.deleteFile(basePath, oldDTO.getPoster());
            UploadSaveManager.deleteFile(basePath, oldDTO.getFilename());
            mav.setViewName("redirect:/media/list.do?mediagroupno=" + oldDTO.getMediagroupno());
        }
        return mav;
    }

}
