package main.java.net.notice;

import main.java.net.bbs.BbsDTO;
import main.java.net.utility.DBClose;
import main.java.net.utility.DBOpen;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

// Data Access Object 데이터베이스 관련 작업 클래스
public class NoticeDAO {
    private DBOpen dbOpen;
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    private StringBuilder sql;

    public NoticeDAO () {
        dbOpen = new DBOpen();
    }

    // 공지사항 글쓰기 메소드
    public int create (NoticeDTO dto) {
        int cnt = 0;

        try {
            conn = dbOpen.getConnection();

            sql = new StringBuilder()
                    .append("INSERT INTO tb_notice (ntc_no, ntc_subject, ntc_content, ntc_regdt, ntc_fix) ")
                    .append("VALUES (ntc_seq.nextval, ?, ?, SYSDATE, ?) ");

            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setString(1, dto.getNtc_subject());
            pstmt.setString(2, dto.getNtc_content());
            pstmt.setInt(3, dto.getNtc_fix());

            cnt = pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("글 쓰기 실패: " + e);
        } finally {
            DBClose.close(conn, pstmt);
        }
        return cnt;
    }

    // 전체리스트, 검색리스트 조회 메소드
    public ArrayList<NoticeDTO> list (String col, String word, int nowPage, int recordPerPage, int totalRecord) {
        // recordPerPage : 페이지당 출력할 행의 갯수(8개 기준)
        // 1페이지 : WHERE r>=17 AND r<=24;
        // 2페이지 : WHERE r>=9 AND r<=16;
        // 3페이지 : WHERE r>=1 AND r<=8;
        int startRow = totalRecord - (nowPage * recordPerPage)+1; //페이지 번호의 시작 rownum
        int endRow = totalRecord - (nowPage-1)*recordPerPage; //페이지 번호의 끝 rownum

        ArrayList<NoticeDTO> list = null;
        try {
            conn = dbOpen.getConnection();

            sql = new StringBuilder()
                    .append("SELECT * ")
                    .append("FROM (SELECT a.*, ROWNUM AS rnum ")
                    .append("      FROM (SELECT ntc_no, ntc_subject, ntc_regdt, ntc_readcnt, ntc_fix ")
                    .append("            FROM tb_notice ");

            // 검색어 존재 여부 확인
            word = word.trim(); //검색어 공백제거
            if(word.length()==0) { //검색어가 없을 경우
                sql.append("            ORDER BY ntc_fix DESC, ntc_regdt) a) ")
                    .append("WHERE rnum>= " + startRow + " AND rnum<= " + endRow + " ")
                    .append("ORDER BY rnum DESC ");
            } else if (col.equals("subject_content")) { // 검색어가 있을 경우
                sql.append("             WHERE ntc_subject LIKE '%" + word + "%' ")
                    .append("            OR ntc_content LIKE '%" + word + "%' ")
                    .append("            ORDER BY ntc_fix DESC, ntc_regdt) a) ")
                    .append("WHERE rnum>= " + startRow + " AND rnum<= " + endRow + " ")
                    .append("ORDER BY rnum DESC ");

            } else { // 검색어가 있을 경우
                sql.append("             WHERE " + col + " LIKE '%" + word + "%' ")
                    .append("            ORDER BY ntc_fix DESC, ntc_regdt) a) ")
                    .append("WHERE rnum>= " + startRow + " AND rnum<= " + endRow + " ")
                    .append("ORDER BY rnum DESC ");
            }

            pstmt = conn.prepareStatement(sql.toString());
            rs = pstmt.executeQuery();

            if(rs.next()){
                list = new ArrayList<NoticeDTO>();
                do{
                    NoticeDTO dto = new NoticeDTO();
                    dto.setNtc_no(rs.getInt("ntc_no"));
                    dto.setRnum(rs.getInt("rnum"));
                    dto.setNtc_subject(rs.getString("ntc_subject"));
                    dto.setNtc_regdt(rs.getString("ntc_regdt"));
                    dto.setNtc_readcnt(rs.getInt("ntc_readcnt"));
                    dto.setNtc_fix(rs.getInt("ntc_fix"));
                    list.add(dto);
                } while (rs.next());
            }

        } catch (Exception e) {
            System.out.println("공지사항 목록 조회 실패: " + e);
        } finally {
            DBClose.close(conn, pstmt, rs);
        }
        return list;
    }

    // 글 갯수 count 메소드
    public int count(String col, String word) {
        int cnt = 0;
        try {
            conn = dbOpen.getConnection();

            StringBuilder sql = new StringBuilder()
                    .append("SELECT COUNT(*) AS cnt FROM tb_notice ");

            word = word.trim();
            if(word.length()>=1) { // 검색어가 존재한다면
                if(col.equals("subject_content")) {
                    sql.append("WHERE ntc_subject LIKE '%" + word + "%' ")
                            .append("OR ntc_content LIKE '%" + word + "%' ");
                } else {
                    sql.append("WHERE " + col + " LIKE '%" + word + "%' ");
                }
            }

            pstmt = conn.prepareStatement(sql.toString());
            rs = pstmt.executeQuery();

            if (rs.next()) {
                cnt = rs.getInt("cnt");
            }

        } catch (Exception e) {
            System.out.println("검색 결과(건수) 실패: " + e);
        } finally {
            DBClose.close(conn, pstmt, rs);
        }
        return cnt;
    }

    // 글 상세조회 메소드
    public NoticeDTO read(int ntc_no) {
        NoticeDTO dto = null;
        try {
            conn = dbOpen.getConnection();

            sql = new StringBuilder()
                    .append("SELECT ntc_subject, ntc_content, ntc_readcnt, ntc_regdt, ntc_fix ")
                    .append("FROM tb_notice ")
                    .append("WHERE ntc_no = ? ");

            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setInt(1, ntc_no);
            rs = pstmt.executeQuery();

            if(rs.next()) {
                dto = new NoticeDTO();
                dto.setNtc_no(ntc_no);
                dto.setNtc_subject(rs.getString("ntc_subject"));
                dto.setNtc_content(rs.getString("ntc_content"));
                dto.setNtc_readcnt(rs.getInt("ntc_readcnt"));
                dto.setNtc_regdt(rs.getString("ntc_regdt"));
                dto.setNtc_fix(rs.getInt("ntc_fix"));

            }

        } catch (Exception e) {
            System.out.println("상세보기 실패" + e);
        } finally {
            DBClose.close(conn, pstmt, rs);
        }
        return dto;
    }

    // 조회수 증가 메소드
    public void incrementCnt (int ntc_no) {
        try {
            conn = dbOpen.getConnection();
            sql = new StringBuilder()
                    .append("UPDATE tb_notice SET ntc_readcnt = ntc_readcnt+1 WHERE ntc_no=?");

            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setInt(1, ntc_no);
            pstmt.executeQuery();

        } catch (Exception e) {
            System.out.println("조회수 증가 실패: " + e);
        }finally {
            DBClose.close(conn, pstmt);
        }
    }

    // 글 수정 메소드
    public int update(NoticeDTO dto) { // 행 수정 메소드
        int cnt = 0;
        try {
            conn = dbOpen.getConnection();

            sql = new StringBuilder()
                    .append("UPDATE tb_notice SET ntc_subject = ?, ntc_content = ?, ntc_fix = ? ")
                    .append("WHERE ntc_no = ? ");

            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setString(1, dto.getNtc_subject());
            pstmt.setString(2, dto.getNtc_content());
            pstmt.setInt(3, dto.getNtc_fix());
            pstmt.setInt(4, dto.getNtc_no());
            cnt = pstmt.executeUpdate();

        } catch (Exception e) {
            System.out.println("수정 실패: " + e);
        } finally {
            DBClose.close(conn, pstmt);
        }
        return cnt;
    }

    // 글 삭제 메소드
    public int delete(int ntc_no) {
        int cnt = 0;
        try {
            conn = dbOpen.getConnection();
            sql = new StringBuilder()
                    .append("DELETE FROM tb_notice WHERE ntc_no=? ");

            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setInt(1, ntc_no);
            cnt = pstmt.executeUpdate();

        } catch (Exception e) {
            System.out.println("수정 실패: " + e);
        } finally {
            DBClose.close(conn, pstmt);
        }
        return cnt;
    }

}
