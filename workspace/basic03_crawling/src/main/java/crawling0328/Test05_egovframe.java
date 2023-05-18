package crawling0328;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.FileWriter;
import java.io.PrintWriter;

public class Test05_egovframe {
    public static void main(String[] args) {
        // 과제) 전자정부프레임워크 웹페이지에서 공지사항 제목만 크롤링해서 egovframe.txt파일에 저장하기
        String URL = "https://www.egovframe.go.kr/home/sub.do";
        String file = "D:/java202301/egovframe.txt";

        try (
                FileWriter fw = new FileWriter(file, false);
                PrintWriter out = new PrintWriter(fw, true)
        ){

            for (int i = 0; i < 22; i++) {

                String params = "?menuNo=74&bbsId=6&pagerOffset=" + (i*10); //공지사항 페이지의 페이지번호를 변수화

                Document doc = Jsoup.connect(URL+params).get(); //메소드 사용하여 i번째 페이지 가져오기

                Elements elements = doc.select(".lnk"); //페이지 소스 중 제목부분 뽑아와서 elements로 저장

                for (Element element : elements) { //elements 배열에 담긴 element를 하나씩 가져오기
                    out.println(element.text()); //egovframe.txt 파일에 담기
                }

            }

        } catch (Exception e) {
            System.out.println("크롤링 실패");
            e.printStackTrace();
        }
    }
}
