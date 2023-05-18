package kr.co.itwill.product;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/product")
public class ProductCont {

    private final ProductDAO productDAO;

    // http://localhost:9095/product/list
    @RequestMapping("/write") //클래스에 어노테이션 지정으로 product 생략가능
    public String write() {
        return "product/write";
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public String insert(
            @RequestParam Map<String, Object> map,
            @RequestParam MultipartFile img,
            HttpServletRequest request
    ) {
        //주의사항 : MultipartFile -> 리네임 되지 않음 (원본 그대로 저장)
        //업로드된 파일은 /storage 폴더에 저장
        String filename = "-";
        long filesize = 0;
        if (img != null && !img.isEmpty()) { //파일이 존재한다면
            filename = img.getOriginalFilename();
            filesize = img.getSize();
            try {
                ServletContext application = request.getSession().getServletContext();
                String path = application.getRealPath("/storage"); //실제 물리적인 경로
                img.transferTo(new File(path + "\\" + filename)); //파일저장

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        map.put("filename", filename);
        map.put("filesize", filesize);

        int cnt = productDAO.insert(map);
        return "redirect:/product/list";
    }

    @RequestMapping("/list")
    public ModelAndView list() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("product/list");
        mav.addObject("list", productDAO.list());
        return mav;
    }

    @RequestMapping("/search")
    public ModelAndView search(@RequestParam(defaultValue = "") String product_name) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("product/list");
        mav.addObject("list", productDAO.search(product_name));
        mav.addObject("product_name", product_name);
        return mav;
    }

/*  @RequestParam
    http://localhost:9095?aaa=bbb&ccc=ddd
    @PathVariable
    http://localhost:9095/bbb/ddd*/

    @RequestMapping("/detail/{product_code}")
    public ModelAndView detail(@PathVariable int product_code) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("product/detail");
        mav.addObject("product_code", product_code);
        mav.addObject("product", productDAO.detail(product_code));
        return mav;
    }

    @RequestMapping("/delete")
    public String delete(int product_code, HttpServletRequest request) {

        // 삭제하고자 하는 파일명 가져오기
        String filename = (String) productDAO.detail(product_code).get("FILENAME");

        // 첨부된 파일 삭제하기
        if (!filename.equals("-") || filename != null) {
            ServletContext application = request.getSession().getServletContext();
            String path = application.getRealPath("/storage");
            File file = new File(path + "\\" + filename);
            if (file.exists()) {
                file.delete();
            }
        }

        // 테이블 행 삭제
        productDAO.delete(product_code);

        return "redirect:/product/list";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(
            @RequestParam Map<String, Object> map,
            @RequestParam MultipartFile img,
            HttpServletRequest request
    ) {
        int product_code = Integer.parseInt((String) map.get("product_code"));
        Map oldMap = productDAO.detail(product_code);

        String filename = "-";
        long filesize = 0;
        if (img != null && !img.isEmpty()) { //파일이 존재한다면
            filename = img.getOriginalFilename();
            filesize = img.getSize();
            try {
                ServletContext application = request.getSession().getServletContext();
                String path = application.getRealPath("/storage"); //실제 물리적인 경로
                img.transferTo(new File(path + "\\" + filename)); //파일저장

            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            filename = oldMap.get("FILENAME").toString();
            filesize = Long.parseLong(oldMap.get("FILESIZE").toString());
        }
        map.put("filename", filename);
        map.put("filesize", filesize);

        int cnt = productDAO.update(map);

        if(cnt>0) {
            // 삭제하고자 하는 파일명 가져오기
            String oldFilename = (String) oldMap.get("FILENAME");

            // 첨부된 파일 삭제하기
            if (!oldFilename.equals("-") || oldFilename != null) {
                ServletContext application = request.getSession().getServletContext();
                String path = application.getRealPath("/storage");
                File file = new File(path + "\\" + oldFilename);
                if (file.exists()) {
                    file.delete();
                }
            }
        }
        return "redirect:/product/list";
    }
}