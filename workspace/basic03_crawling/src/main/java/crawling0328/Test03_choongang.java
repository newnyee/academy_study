package crawling0328;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Test03_choongang {
    public static void main(String[] args) {
        // 중앙정보처리학원 웹페이지의 공지사항 소스 중 제목만 전부 크롤링 하기 (1~12페이지 전부)

        try {
            String URL = "http://www.choongang.co.kr/html/sub07_01_n.php";

            for (int i = 1; i <= 12; i++) {
                String params = "?page=" + i + "&mod=&idx=";
                Document doc = Jsoup.connect(URL+params).get();
                Elements elements = doc.select(".default_title");
                for (Element element : elements) {
                    System.out.println(element.text());
                }

                /*
                Elements elements = doc.getElementsByClass("default_title");
                System.out.println(elements.toString());
                 */
            }

        } catch (Exception e) {
            System.out.println("크롤링 실패");
            e.printStackTrace();
        }
    }
}
