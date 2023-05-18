package crawling0328;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.FileWriter;
import java.io.PrintWriter;

public class Test07_itwill {
    public static void main(String[] args) {
        // 아이티윌 웹페이지의 공지사항 제목만 크롤링
        // 공지사항의 각 페이지 URL 경로가 나오지 않는경우
        String URL = "https://www.itwilledu.net/cmn/board/BBSMSTR_000000000071/bbsList.do";
        String file = "D:/java202301/itwill.txt";

        try (
                FileWriter fw = new FileWriter(file, false);
                PrintWriter out = new PrintWriter(fw, true)
        ) {

            for (int i=1; i<=4; i++) {

                String params = "?pageIndex=" + i;

                Document doc = Jsoup.connect(URL + params).get();

                //방법1
                Elements elements = doc.select(".bgcol01>td:nth-child(2)");
                //방법2 .bgcol01>td>a
                //방법3 .bgcol01 a
                /* 방법4
                Elements elements = doc.select(".bgcol01");
                elements.select(".ac").remove();
                */

                for (Element element : elements) {
                    out.println(element.text());
                }

            }

        } catch (Exception e) {
            System.out.println("크롤링 실패");
            e.printStackTrace();
        }
    }
}
