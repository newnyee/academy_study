package oop0323;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class Sungjuk {
    private String name;
    private int kor;
    private int eng;
    private int mat;

    private int aver;
    private int rankNum;

    private String result;
    private String star = "";

    private String scholar = "";

    public Sungjuk() {
    }

    public Sungjuk(String name, int kor, int eng, int mat) {
        this.name = name;
        this.kor = kor;
        this.eng = eng;
        this.mat = mat;
        this.aver = (kor+eng+mat)/3;
    }

    public List<Sungjuk> getGrades (String a) {
        FileReader fr = null;
        BufferedReader br = null;
        List<Sungjuk> list1 = new ArrayList();
        try {
            fr = new FileReader(a);
            br = new BufferedReader(fr);

            List<String[]> list = new ArrayList<>();

            while (true) {
                String line = br.readLine();
                if (line != null) {
                    String[] stu = line.split(",");
                    list.add(stu);
                } else {
                    break;
                }
            }

            for (int i = 0; i < list.size(); i++) {
                list1.add(new Sungjuk(list.get(i)[0], Integer.parseInt(list.get(i)[1]), Integer.parseInt(list.get(i)[2]), Integer.parseInt(list.get(i)[3])));
            }


        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (br != null) {br.close();}
            } catch (Exception e) {}
            try {
                if (fr != null) {fr.close();}
            } catch (Exception e) {}
        }
        return list1;
    }



    public void makeRank(List<Sungjuk> a) {


        for (int i = 0; i < a.size() - 1; i++) { //등수대로 정렬하기 : score 값으로 객체 배열 내림차순 정렬
            for (int j = i + 1; j < a.size(); j++) {
                if (a.get(i).aver < a.get(j).aver) {
                    Sungjuk b = a.get(i);
                    a.set(i, a.get(j));
                    a.set(j, b);
                }
            }
        }

        for (int i = 0; i < a.size(); i++) {
            Sungjuk stu = a.get(i);

            stu.rankNum = i + 1; //등수 적용 : 정렬된 객체 배열의 인덱스번호+1 을 해당객체 rankNum에 넣음

            if(stu.aver<60) { //합격여부
                stu.result = "불합격";
            } else if (stu.kor > 40 && stu.eng > 40 && stu.mat > 40) {
                stu.result = "    합격";
                if (stu.aver > 90) {
                    stu.scholar = "장학생";
                }
            } else {
                stu.result = "재시험";
            }

            for(int j=0; j<stu.aver/10; j++) { //별찍기
                a.get(i).star += "*";
            }

        }



    }

    public void display(List<Sungjuk> b, String c){
            FileWriter fw = null;
            PrintWriter out = null;
        try {
            fw = new FileWriter(c, false);
            out = new PrintWriter(fw, true);

            out.println("  성 / 적 / 결 / 과");
            out.println("---------------------------------------------------------");
            out.println(" 이름  국어 영어 수학 평균 등수    결과");
            out.println("---------------------------------------------------------");
            for (int i = 0; i < b.size(); i++) {
                Sungjuk a = b.get(i);
                out.printf("%3s %4d %4d %4d %4d %3d %5s %10s %3s\n", a.name, a.kor, a.eng, a.mat, a.aver, a.rankNum, a.result, a.star, a.scholar);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (out != null) {out.close();}
            } catch (Exception e) {}
            try {
                if (fw != null) {fw.close();}
            } catch (Exception e) {}
        }
    }

}
