package oop0322;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

public class Test01_List {
    public static void main(String[] args) {
        // Java Collection Framework
        // 자료를 모아서 저장할 수 있는 클래스 및 인터페이스
        /*
            List : 순서(Index)가 있음, 인덱스는 0부터 시작 (Vector, ArrayList)
            Set : 순서가 없음 (HashSet)
            Map : 순서가 없음, key와 Value로 구성되어 있음 (HashMap, Properties)

            interface List {}
            class ArrayList {} -> List 구현 class
            class Vector {} -> List 구현 class

            interface Set {}
            class HashSet {} -> Set 구현 class

            interface Map {}
            class HashMap {} -> Map 구현 class
            class Properties {} -> Map 구현 class

            // 다형성
            List list = new Vector();
            List list = new ArrayList();
            Set set = new HashSet();
            Map map = new HashMap();
        */

        // 배열 : 자료를 모아 놓을 수 있음
        int[] num = new int[100];

        // 1. List 계열
        // <E> Element 요소
        Vector vector = new Vector();
        vector.add(3);
        vector.add(2.4);
        vector.add('R');
        vector.add("KOREA");
        vector.add(new Integer(5));
        vector.add(new Double(6.7));

//        Integer inte = new Integer(5); Old Version
//        Integer inte = 5;              New Version

        System.out.println(vector.size()); //요소의 갯수 6
        for (int i = 0; i < vector.size(); i++) {
            System.out.println(vector.get(i));
        }

        vector.remove(0); //0 인덱스 요소 제거
        System.out.println(vector.size()); //요소의 갯수 5

        vector.removeAllElements(); //요소 전부 제거
        System.out.println(vector.size()); //요소의 갯수 0

        if (vector.isEmpty()) { //리스트 객체의 요소의 유무
            System.out.println("비어 있음");
        } else {
            System.out.println("비어 있지 않음");
        }

        List list = new ArrayList();
        list.add(5);
        list.add(6.7);
        list.add('M');
        list.add("SEOUL");

        System.out.println(list.size()); //요소의 갯수 4
        for (int i = list.size() - 1; i >= 0; i--) {
            list.remove(i);
        }
        System.out.println(list.size());
    }
}
