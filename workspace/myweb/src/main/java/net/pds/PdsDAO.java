package main.java.net.pds;

import main.java.net.bbs.BbsDTO;
import main.java.net.utility.DBClose;
import main.java.net.utility.DBOpen;

import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class PdsDAO {
    private DBOpen dbOpen;
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    private StringBuilder sql;

    public PdsDAO() {
        dbOpen = new DBOpen();
    }

    public ArrayList<PdsDTO> list(String col, String word, int nowPage, int recordPerPage, int totalRecord) {
        ArrayList<PdsDTO> list = null;
        // recordPerPage : 페이지당 출력할 행의 갯수(8개 기준)
        // 1페이지 : WHERE r>=17 AND r<=24;
        // 2페이지 : WHERE r>=9 AND r<=16;
        // 3페이지 : WHERE r>=1 AND r<=8;
        int startRow = totalRecord - (nowPage * recordPerPage)+1; //페이지 번호의 시작 rownum -5
        int endRow = totalRecord - (nowPage-1)*recordPerPage; //페이지 번호의 끝 rownum 3

        try {
            conn = dbOpen.getConnection();

            sql = new StringBuilder()
                    .append("SELECT * ")
                    .append("FROM (SELECT a.*, ROWNUM AS rnum ")
                    .append("      FROM (SELECT pdsno, wname, subject, filename, regdate, readcnt ")
                    .append("            FROM tb_pds ");

            // 검색어 존재 여부 확인
            word = word.trim(); //검색어 공백제거
            if(word.length()==0) { //검색어가 없을 경우
                sql.append("            ORDER BY regdate) a) ")
                    .append("WHERE rnum>= " + startRow + " AND rnum<= " + endRow + " ")
                    .append("ORDER BY rnum DESC ");
            } else { // 검색어가 있을 경우
                sql.append("             WHERE " + col + " LIKE '%" + word + "%' ")
                    .append("            ORDER BY regdate) a) ")
                    .append("WHERE rnum>= " + startRow + " AND rnum<= " + endRow + " ")
                    .append("ORDER BY rnum DESC ");
            }

            pstmt = conn.prepareStatement(sql.toString());
            rs = pstmt.executeQuery();

            if (rs.next()) {
                list = new ArrayList<>();
                do {
                    PdsDTO dto = new PdsDTO();
                    dto.setPdsno(rs.getInt("pdsno"));
                    dto.setRnum(rs.getInt("rnum"));
                    dto.setSubject(rs.getString("subject"));
                    dto.setFilename(rs.getString("filename"));
                    dto.setWname(rs.getString("wname"));
                    dto.setRegdate(rs.getString("regdate"));
                    dto.setReadcnt(rs.getInt("readcnt"));
                    list.add(dto);
                } while (rs.next());
            }
        } catch (Exception e) {
            System.out.println("포토 갤러리 목록 조회 실패: " + e);
        } finally {
            DBClose.close(conn, pstmt, rs);
        }
        return list;
    }

    public int create(PdsDTO dto) {
        int cnt = 0;
        try {
            conn = dbOpen.getConnection();

            sql = new StringBuilder()
                    .append("INSERT INTO tb_pds (pdsno, wname, passwd, subject, filename, filesize, regdate) ")
                    .append("VALUES (pds_seq.nextval, ?, ?, ?, ?, ?, sysdate) ");
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setString(1, dto.getWname());
            pstmt.setString(2, dto.getPasswd());
            pstmt.setString(3, dto.getSubject());
            pstmt.setString(4, dto.getFilename());
            pstmt.setLong(5, dto.getFilesize());

            cnt = pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("파일 업로드 실패: " + e);
        } finally {
            DBClose.close(conn, pstmt);
        }
        return cnt;
    }

    public int count(String col, String word) {
        int cnt = 0;
        try {
            conn = dbOpen.getConnection();

            StringBuilder sql = new StringBuilder()
                    .append("SELECT COUNT(*) AS cnt FROM tb_pds ");

            if(word.length()>=1) { // 검색어가 존재한다면
                if(col.equals("subject")) {
                    sql.append("WHERE subject LIKE '%" + word + "%' ");
                } else if (col.equals("wname")) {
                    sql.append("WHERE wname LIKE '%" + word + "%' ");
                }
            }

            pstmt = conn.prepareStatement(sql.toString());
            rs = pstmt.executeQuery();

            if (rs.next()) {
                cnt = rs.getInt("cnt");
            }

        } catch (Exception e) {
            System.out.println("검색 결과(건수) 조회 실패: " + e);
        } finally {
            DBClose.close(conn, pstmt, rs);
        }
        return cnt;
    }

    // 상세조회 메소드
    public PdsDTO read(int pdsno) {
        PdsDTO dto = null;
        try {
            conn = dbOpen.getConnection();

            sql = new StringBuilder()
                    .append("SELECT wname, subject, readcnt, regdate, filename, filesize ")
                    .append("FROM tb_pds ")
                    .append("WHERE pdsno = ? ");

            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setInt(1, pdsno);
            rs = pstmt.executeQuery();

            if(rs.next()) {
                dto = new PdsDTO();
                dto.setPdsno(pdsno);
                dto.setWname(rs.getString("wname")); //작성자
                dto.setSubject(rs.getString("subject")); //제목
                dto.setReadcnt(rs.getInt("readcnt")); //조회수
                dto.setRegdate(rs.getString("regdate")); //업로드일
                dto.setFilename(rs.getString("filename")); //파일이름
                dto.setFilesize(rs.getLong("filesize")); //파일사이즈
            }
        } catch (Exception e) {
            System.out.println("상세보기 실패" + e);
        } finally {
            DBClose.close(conn, pstmt, rs);
        }
        return dto;
    }

    // 조회수 증가 메소드
    public void incrementCnt (int pdsno) {
        try {
            conn = dbOpen.getConnection();
            sql = new StringBuilder()
                    .append("UPDATE tb_pds SET readcnt=readcnt+1 WHERE pdsno=?");

            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setInt(1,pdsno);
            pstmt.executeQuery();

        } catch (Exception e) {
            System.out.println("조회수 증가 실패: " + e);
        }finally {
            DBClose.close(conn, pstmt);
        }
    }

    // 글 삭제 메소드
    public int delete(int pdsno, String passwd, String saveDir) {
        int cnt = 0;
        try {
            //테이블의 행 삭제하기 전에, 삭제하고자 하는 파일명 가져온다
            String filename = ""; //filename 저장
            PdsDTO oldDTO = read(pdsno);
            if(oldDTO != null) { //조회에 성공했다면
                filename = oldDTO.getFilename();
            }

            conn = dbOpen.getConnection();
            sql = new StringBuilder()
                    .append("DELETE FROM tb_pds WHERE pdsno=? AND passwd=?");

            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setInt(1, pdsno);
            pstmt.setString(2, passwd);

            cnt = pstmt.executeUpdate();
            if(cnt == 1) { //테이블에서 행 삭제가 성공했으므로, 첨부했던 파일도 삭제
                net.utility.Utility.deleteFile(saveDir, filename); //파일삭제 메소드
            }

        } catch (Exception e) {
            System.out.println("삭제 실패: " + e);
        } finally {
            DBClose.close(conn, pstmt);
        }
        return cnt;
    }
}
