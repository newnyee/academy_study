package crawling0328;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.FileWriter;
import java.io.PrintWriter;

public class Test08_NaverMovie {
    public static void main(String[] args) {
        // 네이버 영화 평점 후기 크롤링 하기

        String URL = "https://movie.naver.com/movie/bi/mi/pointWriteFormList.naver";
        String file = "D:/java202301/naverMovie.txt";
        String movieCode = "?code=215932";
        String params = new StringBuilder()
                .append("&type=after")
                .append("&onlyActualPointYn=N")
                .append("&onlySpoilerPointYn=N")
                .append("&order=sympathyScore")
                .append("&page=")
                .toString();

        try (
                FileWriter fw = new FileWriter(file, false);
                PrintWriter out = new PrintWriter(fw, true)
        ) {
            for (int p = 1; p <=100; p++) {
                params += p;
                Document doc = Jsoup.connect(URL + movieCode + params).get();
                Elements elements = doc.select(".score_reple>p>span:last-child");

                for (Element element : elements) {
                    out.println(element.text());
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
