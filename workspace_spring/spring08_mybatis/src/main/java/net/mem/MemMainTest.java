package net.mem;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.InputStream;
import java.util.List;

public class MemMainTest {
    public static void main(String[] args) {
        // MyBatis Framework 기반 JDBC 연습
        try {
            // factory 공장
            // 어떤 특정 정보를 주면 객체로 생성해 줌
            // 객체 생성 : new 연산자(POJO 방식), Bean

            // 1) DB 연결 환경 설정 파일 가져오기
            String resource = "config/jdbc.xml";
            InputStream is = Resources.getResourceAsStream(resource);

            // 2) DB 연결하기 위한 팩토리빈(factory bean) 생성
            // DBOpen + DAO
            SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(is);
            System.out.println("***** DB 연결 성공");

            // 3) 쿼리문 생성 및 변환
            // PreparedStatement 와 비슷한 기능
            SqlSession sql = ssf.openSession(true);

            // 4) 쿼리문 실행

            /* insert
            int cnt = sql.insert("mem.insertRow", new MemDTO("홍길동", 44));
            System.out.println("행 추가 결과: " + cnt);*/

            /* update
            int result = sql.update("mem.updateRow", new MemDTO(2, "무궁화", 25));
            System.out.println("행 수정 결과: " + result);*/

            /* delete
            int result = sql.delete("mem.deleteRow", 40);
            System.out.println("행 삭제 결과: " + result);*/

            /* select - 전체 조회
            List<MemDTO> list = sql.selectList("mem.selectAll");
            for (MemDTO dto : list) {
                System.out.print(dto.getNum() + " ");
                System.out.print(dto.getName() + " ");
                System.out.println(dto.getAge());
            }*/

            /* select - "리" 검색
            List<MemDTO> list = sql.selectList("mem.search", "리");
            for (MemDTO dto : list) {
                System.out.print(dto.getNum() + " ");
                System.out.print(dto.getName() + " ");
                System.out.println(dto.getAge());
            }*/

            /* select - 특정 num 행 상세조회
            MemDTO dto = sql.selectOne("mem.selectRead", 5);
            System.out.print(dto.getNum() + " ");
            System.out.print(dto.getName() + " ");
            System.out.println(dto.getAge());*/

            // select - 전체 행 갯수 조회
            System.out.println("전체 행 갯수: " + sql.selectOne("mem.rowCount"));

        } catch (Exception e) {
            System.out.println("실패: " + e);
        }
    }
}
