package oop0322;

import java.util.*;

public class Test02_SetMap {
    public static void main(String[] args) {
        // 2. Set 계열 : 순서가 없다
        Set set = new HashSet();
        set.add(3);
        set.add(2.4);
        set.add('R');
        set.add("BUSAN");
        set.add(new Integer(7));

        System.out.println(set.size());

        // cursor : 가리킬 요소가 있으면 true, 없으면 false 값 반환
        Iterator iterator = set.iterator();
        while (iterator.hasNext()) { //hasNext 리턴할 값의 유무 boolean 타입으로 반환
            Object obj = iterator.next();
            System.out.println(obj);
        }

        // 3. Map 계열 : 순서가 없다
        // Key : 이름표
        // Value : 값
        // JSON, 파이썬(딕셔너리), NoSQL DB 등에서 많이 사용하는 문법

        HashMap map = new HashMap();
        map.put("one", 3);
        map.put("two", 2.4);
        map.put("three", 'R');
        map.put("four", "손흥민");

        System.out.println(map.size());
        System.out.println(map.get("four"));

        map.put("four", "박지성");
        System.out.println(map.get("four"));
        System.out.println("------------------------------");

        // Properties 클래스
        Properties db = new Properties();
        db.put("url", "http://localhost:1521");
        db.put("username", "itwill");
        db.put("password", "12341234");

        System.out.println(db.get("url"));
        System.out.println(db.get("username"));
        System.out.println(db.get("password"));
        System.out.println("------------------------------");

        // 문제) = 문자를 기준으로 문자열을 분리해서
        // = 앞의 문자열은 key, = 뒤의 문자열은 value로 구분해서 hm에 저장
        // hm의 key값들 중에서 "read.do"를 호출하면
        // value값으로 net.bbs.Read 출력하시오

        HashSet command = new HashSet();
        command.add("list.do=net.bbs.List");
        command.add("read.do=net.bbs.Read");
        command.add("write.do=net.bbs.Write");

        System.out.println(command.size());

        // 1) 커서 생성하기
        Iterator iterator1 = command.iterator();

        HashMap hm = new HashMap();

        // 2) 커서가 있을 때 까지 반복
        while (iterator1.hasNext()) {
            // 3) 커서가 가리키는 요소를 가져와서 문자열 형변환
            String obj = (String)iterator1.next();

            // 4) "="위치를 기준으로 문자열 분리하기
            // split(), substring(), StringTokenizer 클래스
            String[] str = obj.split("=");
            hm.put(str[0], str[1]);
        }
        System.out.println(hm.get("read.do"));
    }
}