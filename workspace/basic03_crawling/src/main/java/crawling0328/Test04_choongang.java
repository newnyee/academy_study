package crawling0328;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.FileWriter;
import java.io.PrintWriter;

public class Test04_choongang {
    public static void main(String[] args) {
        // 중앙정보처리학원 웹페이지의 공지사항 소스 중 제목만 전부 크롤링 하기 (1~12페이지 전부)
        String URL = "http://www.choongang.co.kr/html/sub07_01_n.php";
        String file = "D:/java202301/choongang.txt";
        try (
                FileWriter fw = new FileWriter(file, false);
                PrintWriter out = new PrintWriter(fw, true);
        ){

            for (int i = 1; i <= 12; i++) {
                String params = "?page=" + i + "&mod=&idx="; //공지사항 페이지의 페이지번호를 변수화
                Document doc = Jsoup.connect(URL+params).get(); //메소드 사용하여 1~12페이지 가져오기
                Elements elements = doc.select(".default_title"); //페이지 소스 중 제목 부분(class=default_title)의 내용 배열로 가져오기
                for (Element element : elements) { //elements 배열에 담긴 element를 하나씩 가져오기
                    out.println(element.text()); //result2.txt 파일에 담기
                }
            }

        } catch (Exception e) {
            System.out.println("크롤링 실패");
            e.printStackTrace();
        }
    }
}
