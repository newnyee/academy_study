package kr.co.mymelon.mediagroup;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository //모델 클래스로 지정, 스프링 컨테이너가 컴포넌트 스캔시 자동으로 자바빈으로 등록한다
public class MediaGroupDAO {

    // DBOpen()과 동일한 형태
    @Autowired //스프링 컨테이너에 등록한 빈에게 의존관계주입이 필요할 때, DI을 도와주는 어노테이션이다.
    private JdbcTemplate jt;
    StringBuilder sql;

    public MediaGroupDAO() {
        System.out.println("***** MediaGroupDAO() 객체 생성");
    }

    // 비지니스 로직 구현
    // 글 생성
    public int create(MediaGroupDTO dto) {
        int cnt = 0;
        try {
            sql = new StringBuilder()
                    .append("INSERT INTO mediagroup (mediagroupno, title) ")
                    .append("VALUES (mediagroup_seq.nextval, ?) ");
            cnt = jt.update(sql.toString(), dto.getTitle());
        } catch (Exception e) {
            System.out.println("미디어 그룹 등록 실패: " + e);
        }
        return cnt;
    }

/*    // 글 조회 메소드(페이징X)
    public List<MediaGroupDTO> list() {
        List<MediaGroupDTO> list = null;
        try {
            sql = new StringBuilder()
                    .append("SELECT mediagroupno, title ")
                    .append("FROM mediagroup ")
                    .append("ORDER BY mediagroupno DESC ");

            list = jt.query(sql.toString(), memberRowMapper());
        } catch (Exception e) {
            System.out.println("미디어 그룹 목록 조회 실패: " + e);
        }
        return list;
    }*/

    // 글 조회 메소드
    public List<MediaGroupDTO> list2(int start, int end) {
        List<MediaGroupDTO> list = null;
        try {
            sql = new StringBuilder()
                    .append("SELECT * ")
                    .append("FROM (SELECT a.*, ROWNUM AS rnum ")
                    .append("      FROM (SELECT mediagroupno, title ")
                    .append("            FROM mediagroup ")
                    .append("            ORDER BY mediagroupno) a) ")
                    .append("WHERE rnum>= ? AND rnum<= ? ")
                    .append("ORDER BY rnum DESC ");

            RowMapper<MediaGroupDTO> memberRowMapper = (rs, rowNum) -> {
                MediaGroupDTO dto = new MediaGroupDTO();
                dto.setMediagroupno(rs.getInt("mediagroupno"));
                dto.setTitle(rs.getString("title"));
                dto.setRnum(rs.getInt("rnum"));
                return dto;
            };

            list = jt.query(sql.toString(), memberRowMapper, start, end); //입력되는 start값과 end 값에의해 5개씩 보여짐
        } catch (Exception e) {
            System.out.println("미디어 그룹 목록 조회 실패: " + e);
        }
        return list;
    }

    // 글 갯수 조회
    public int totalRowCount() {
        int cnt = 0;
        try {
            sql = new StringBuilder()
                    .append("SELECT COUNT(*) FROM mediagroup");
            cnt = jt.queryForObject(sql.toString(), Integer.class);

        } catch (Exception e) {
            System.out.println("전체 행 갯수 조회 실패: " + e);
        }
        return cnt;
    }

    // 글 삭제
    public int delete(int mediagroupno) {
        int cnt = 0;
        try {
            sql = new StringBuilder()
                    .append("DELETE FROM mediagroup ")
                    .append("WHERE mediagroupno = ? ");
            cnt = jt.update(sql.toString(), mediagroupno);
        } catch (Exception e) {
            System.out.println("미디어 그룹 삭제 실패: " + e);
        }
        return cnt;
    }

    // 글 상세 조회 메소드
    public MediaGroupDTO read(int mediagroupno) {
        MediaGroupDTO dto = null;
        try {
            sql = new StringBuilder()
                    .append("SELECT mediagroupno, title FROM mediagroup WHERE mediagroupno = ?");

            RowMapper<MediaGroupDTO> memberRowMapper = (rs, rowNum) -> {
                MediaGroupDTO dto1 = new MediaGroupDTO();
                dto1.setMediagroupno(rs.getInt("mediagroupno"));
                dto1.setTitle(rs.getString("title"));
                return dto1;
            };

            dto = jt.queryForObject(sql.toString(), memberRowMapper, mediagroupno);

        } catch (Exception e) {
            System.out.println("글 상세 조회 실패: " + e);
        }
        return dto;
    }

    // 글 수정 메소드
    public int update(MediaGroupDTO dto) {
        int cnt = 0;
        try {
            sql = new StringBuilder()
                    .append("UPDATE mediagroup SET title = ? WHERE mediagroupno = ?");
            cnt = jt.update(sql.toString(), dto.getTitle(), dto.getMediagroupno());
        } catch (Exception e) {
            System.out.println("글 수정 실패" + e);
        }
        return cnt;
    }

}