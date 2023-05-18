package kr.co.mymelon.media;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class MediaDAO {

    @Autowired
    private JdbcTemplate jt;
    private StringBuilder sql;

    //음원 리스트 조회
    public MediaDAO() {
        System.out.println("***** MediaDAO() 객체 생성");
    }

    public List<MediaDTO> list(int mediagroupno) {
        List<MediaDTO> list = null;
        try {
            sql = new StringBuilder()
                    .append("SELECT * FROM media ")
                    .append("WHERE mview = 'Y' AND mediagroupno = ? ")
                    .append("ORDER BY mediano DESC ");

            list = jt.query(sql.toString(), mediaDTORowMapper, mediagroupno);
        } catch (Exception e) {
            System.out.println("음원 목록 조회 실패" + e);
        }
        return list;
    }

    // 음원 상세 조회
    public MediaDTO read(int mediano) {
        MediaDTO dto = null;
        try {
            sql = new StringBuilder()
                    .append("SELECT * FROM media WHERE mediano = ? ");
            dto = jt.queryForObject(sql.toString(), mediaDTORowMapper, mediano);

        } catch (Exception e) {
            System.out.println("음원 상세 조회 실패: " + e);
        }
        return dto;
    }

    // 음원 등록
    public int create(MediaDTO dto) {
        int cnt = 0;
        try {
            sql = new StringBuilder()
                    .append("INSERT INTO media (mediano, title, poster, filename, filesize, rdate, mediagroupno) ")
                    .append("VALUES (media_seq.nextval, ?, ?, ?, ?, SYSDATE, ?) ");
            cnt = jt.update(sql.toString(), dto.getTitle(), dto.getPoster(), dto.getFilename(), dto.getFilesize(), dto.getMediagroupno());
        } catch (Exception e) {
            System.out.println("음원 등록 실패: " + e);
        }
        return cnt;
    }

    // 음원 삭제
    public int delete(int mediano) {
        int cnt = 0;
        try {
            sql = new StringBuilder()
                    .append(" DELETE FROM media WHERE mediano = ? ");
            cnt = jt.update(sql.toString(), mediano);
        } catch (Exception e) {
            System.out.println("음원 삭제 실패: " + e);
        }
        return cnt;
    }

    // 음원 수정
    public int update(MediaDTO dto) {
        int cnt = 0;
        try {
            sql = new StringBuilder()
                    .append("UPDATE media SET title=?, poster=?, filename=?, filesize=? ")
                    .append("WHERE mediano=? ");
            cnt = jt.update(sql.toString(), dto.getTitle(), dto.getPoster(), dto.getFilename(), dto.getFilesize(), dto.getMediano());
        } catch (Exception e) {
            System.out.println("음원 수정 실패: " + e);
        }
        return cnt;
    }

    private final RowMapper<MediaDTO> mediaDTORowMapper = (rs, rowNum) -> {
        MediaDTO dto = new MediaDTO();
        dto.setMediano(rs.getInt("mediano"));
        dto.setTitle(rs.getString("title"));
        dto.setPoster(rs.getString("poster"));
        dto.setFilename(rs.getString("filename"));
        dto.setFilesize(rs.getLong("filesize"));
        dto.setMview(rs.getString("mview"));
        dto.setRdate(rs.getString("rdate"));
        dto.setMediagroupno(rs.getInt("mediagroupno"));
        return dto;
    };
}
