package crawling0328;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

public class Test02_choongang {
    public static void main(String[] args) {
        // 중앙정보처리학원 웹페이지의 공지사항 소스 (1~12페이지) 가져오기

        try {
            String URL = "http://www.choongang.co.kr/html/sub07_01_n.php";

            //http://www.choongang.co.kr/html/sub07_01_n.php?page=1&mod=&idx=
            for (int i = 1; i <= 12; i++) {
                String params = "?page=" + i + "&mod=&idx=";
                Document doc = Jsoup.connect(URL+params).get();
                System.out.println(doc.toString());
            }

        } catch (Exception e) {
            System.out.println("크롤링 실패");
            e.printStackTrace();
        }
    }
}
