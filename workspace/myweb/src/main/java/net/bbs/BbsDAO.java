package main.java.net.bbs;

import main.java.net.utility.DBClose;
import main.java.net.utility.DBOpen;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

// Data Access Object 데이터베이스 관련 작업 클래스
public class BbsDAO {
    private DBOpen dbopen = null;
    private Connection conn = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    private String sql = null;

    // DAO 객체 생성 시 DBOpen 객체 생성
    public BbsDAO () {
        dbopen = new DBOpen();
    }

    // 게시판 글쓰기 메소드
    public int create(BbsDTO dto) {
        int cnt = 0;
        try {
            conn = dbopen.getConnection();

            sql = new StringBuilder()
                .append("INSERT INTO tb_bbs (bbsno, wname, subject, content, passwd, ip, grpno) ")
                .append("VALUES (bbs_seq.nextval, ?, ?, ?, ?, ?, (SELECT NVL(MAX(bbsno), 0)+1 FROM tb_bbs)) ")
                .toString();

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getWname());
            pstmt.setString(2, dto.getSubject());
            pstmt.setString(3, dto.getContent());
            pstmt.setString(4, dto.getPasswd());
            pstmt.setString(5, dto.getIp());

            cnt = pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        } finally {
            DBClose.close(conn, pstmt);
        }
        return cnt;
    }

    /*
    public ArrayList<BbsDTO> list() {
        ArrayList<BbsDTO> list = null;
        try {
            conn = dbopen.getConnection();

            sql = new StringBuilder()
                    .append("SELECT * ")
                    .append("FROM (SELECT a.*, ROWNUM AS rnum ")
                    .append("      FROM (SELECT bbsno, wname, subject, readcnt, regdt, grpno, indent ")
                    .append("            FROM tb_bbs ")
                    .append("            ORDER BY grpno ASC, ansnum DESC) a) b ")
                    .append("ORDER BY rnum DESC ")
                    .toString();

            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            if(rs.next()) {
                list = new ArrayList(); //dto 객체 저장 배열
                do {
                    BbsDTO dto = new BbsDTO();
                    dto.setBbsno(rs.getInt("bbsno"));
                    dto.setWname(rs.getString("Wname"));
                    dto.setSubject(rs.getString("subject"));
                    dto.setReadcnt(rs.getInt("readcnt"));
                    dto.setRegdt(rs.getString("Regdt"));
                    dto.setGrpno(rs.getInt("grpno"));
                    dto.setIndent(rs.getInt("indent"));
                    dto.setRnum(rs.getInt("rnum"));
                    list.add(dto);
                } while (rs.next());
            }

        } catch (Exception e) {
            System.out.println("조회 실패 : " + e);
        } finally {
            DBClose.close(conn, pstmt, rs);
        }
        return list;
    }
     */

    /*
    public int count() {
        int cnt = 0;
        try {
            conn = dbopen.getConnection();

            sql = new StringBuilder()
                    .append("SELECT COUNT(*) AS cnt FROM tb_bbs")
                    .toString();

            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            if (rs.next()) {
               cnt = rs.getInt("cnt");
            }

        } catch (Exception e) {
            System.out.println("조회 실패 : " + e);
        } finally {
            DBClose.close(conn, pstmt, rs);
        }
        return cnt;
    }
     */

    // 상세조회 메소드
    public BbsDTO read(int bbsno) {
        BbsDTO dto = null;
        try {
            conn = dbopen.getConnection();

            sql = new StringBuilder()
                    .append("SELECT bbsno, wname, subject, content, readcnt, regdt, ip, grpno, indent, ansnum ")
                    .append("FROM tb_bbs WHERE bbsno=?")
                    .toString();

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, bbsno);
            rs = pstmt.executeQuery();

            if(rs.next()) {
                dto = new BbsDTO();
                dto.setBbsno(bbsno);
                dto.setWname(rs.getString("wname"));
                dto.setSubject(rs.getString("subject"));
                dto.setContent(rs.getString("content"));
                dto.setReadcnt(rs.getInt("readcnt"));
                dto.setRegdt(rs.getString("regdt"));
                dto.setIp(rs.getString("ip"));
                dto.setGrpno(rs.getInt("grpno"));
                dto.setIndent(rs.getInt("indent"));
                dto.setAnsnum(rs.getInt("ansnum"));
            }
        } catch (Exception e) {
            System.out.println("상세보기 실패" + e);
        } finally {
            DBClose.close(conn, pstmt, rs);
        }
        return dto;
    }

    // 조회수 증가 메소드
    public void incrementCnt (int bbsno) {
        try {
            conn = dbopen.getConnection();
            sql = new StringBuilder()
                    .append("UPDATE tb_bbs SET readcnt=readcnt+1 WHERE bbsno=?")
                    .toString();

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,bbsno);
            pstmt.executeQuery();

        } catch (Exception e) {
            System.out.println("조회수 증가 실패: " + e);
        }finally {
            DBClose.close(conn, pstmt);
        }
    }

    // 글 삭제 메소드
    public int delete(BbsDTO dto) {
        int cnt = 0;
        try {
            conn = dbopen.getConnection();
            sql = new StringBuilder()
                    .append("DELETE FROM tb_bbs WHERE bbsno=? AND passwd=?")
                    .toString();

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, dto.getBbsno());
            pstmt.setString(2, dto.getPasswd());
            cnt = pstmt.executeUpdate();

        } catch (Exception e) {
            System.out.println("삭제 실패: " + e);
        } finally {
            DBClose.close(conn, pstmt);
        }
        return cnt;
    }

    // 글 수정 메소드
    public int update(BbsDTO dto) {
        int cnt = 0;
        try {
            conn = dbopen.getConnection();

            sql = new StringBuilder()
                    .append("UPDATE tb_bbs SET wname=?, subject=?, content=?, ip=?, passwd=? ")
                    .append("WHERE bbsno=?")
                    .toString();

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getWname());
            pstmt.setString(2, dto.getSubject());
            pstmt.setString(3, dto.getContent());
            pstmt.setString(4, dto.getIp());
            pstmt.setString(5, dto.getPasswd());
            pstmt.setInt(6, dto.getBbsno());
            cnt = pstmt.executeUpdate();
            System.out.println(cnt);

        } catch (Exception e) {
            System.out.println("수정 실패: " + e);
        } finally {
            DBClose.close(conn, pstmt);
        }
        return cnt;
    }

    // 글 수정시 패스워드 일치 확인 메소드
    public int updatePwCheck(BbsDTO dto) {
        int cnt = 0;
        try {
            conn = dbopen.getConnection();
            sql = new StringBuilder()
                    .append("SELECT * FROM tb_bbs WHERE bbsno=? AND passwd=?")
                    .toString();

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, dto.getBbsno());
            pstmt.setString(2, dto.getPasswd());
            cnt = pstmt.executeUpdate();

        } catch (Exception e) {
            System.out.println("조회 실패: " + e);
        } finally {
            DBClose.close(conn, pstmt);
        }
        return cnt;
    }

    // 답글 쓰기 메소드
    public int reply(BbsDTO dto) {
        int cnt = 0;
        try {
            conn = dbopen.getConnection();

            // 1) 부모글 정보 가져오기
            int grpno = 0; // 부모글 그룹 번호
            int indent = 0; // 부모글 들여 쓰기
            int ansnum = 0; // 부모글 글 순서
            sql = new StringBuilder()
                    .append("SELECT grpno, indent, ansnum FROM tb_bbs WHERE bbsno = ? ")
                    .toString();

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, dto.getBbsno());
            rs = pstmt.executeQuery();

            if(rs.next()) {
                grpno = rs.getInt("grpno");
                indent = rs.getInt("indent")+1;
                ansnum = rs.getInt("ansnum")+1;
            }


            // 2) 글순서 재조정 하기(update)
            sql = new StringBuilder()
                    .append("update tb_bbs ")
                    .append("set ansnum = ansnum + 1 ")
                    .append("where grpno = ? and ansnum >= ? ")
                    .toString();

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, grpno);
            pstmt.setInt(2, ansnum);
            pstmt.executeQuery();


            // 3) 답변글 추가하기 (insert)
            sql = new StringBuilder()
                    .append("INSERT INTO tb_bbs (bbsno, wname, subject, content, passwd, ip, grpno, indent, ansnum) ")
                    .append("VALUES (bbs_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?)")
                    .toString();

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getWname());
            pstmt.setString(2, dto.getSubject());
            pstmt.setString(3, dto.getContent());
            pstmt.setString(4, dto.getPasswd());
            pstmt.setString(5, dto.getIp());
            pstmt.setInt(6,grpno);
            pstmt.setInt(7,indent);
            pstmt.setInt(8,ansnum);
            cnt = pstmt.executeUpdate();

        } catch (Exception e) {
            System.out.println("답글 쓰기 실패: " + e);
        } finally {
            DBClose.close(conn, pstmt, rs);
        }
        return cnt;
    }

    // 자식글 갯수 count 메소드
    public int replyCount(int bbsno) {
        int cnt = 0;
        try {
            conn = dbopen.getConnection();

            sql = new StringBuilder()
                    .append("SELECT COUNT(*)-1 AS replyAll ")
                    .append("FROM tb_bbs ")
                    .append("WHERE grpno = (SELECT grpno FROM tb_bbs WHERE bbsno = " + bbsno + " AND indent=0) ")
                    .toString();

            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            if(rs.next()) {
                cnt = rs.getInt("replyAll");
            }

        } catch (Exception e) {
            System.out.println("답글 카운트 실패: " + e);
        } finally {
            DBClose.close(conn, pstmt, rs);
        }
        return cnt;
    }

    // 글 갯수 count 메소드
    public int count2(String col, String word) {
        int cnt = 0;
        try {
            conn = dbopen.getConnection();

            StringBuilder sql = new StringBuilder()
                    .append("SELECT COUNT(*) AS cnt FROM tb_bbs ");

            if(word.length()>=1) { // 검색어가 존재한다면
                if(col.equals("subject_content")) {
                    sql.append("WHERE subject LIKE '%" + word + "%' ")
                        .append("OR content LIKE '%" + word + "%' ");
                } else if (col.equals("subject")) {
                    sql.append("WHERE subject LIKE '%" + word + "%' ");
                } else if (col.equals("content")) {
                    sql.append("WHERE content LIKE '%" + word + "%' ");
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
            System.out.println("검색 결과(건수) 실패: " + e);
        } finally {
            DBClose.close(conn, pstmt, rs);
        }
        return cnt;
    }

    /*
    public ArrayList<BbsDTO> list2(String col, String word) {
        ArrayList<BbsDTO> list = null;
        try {
            conn = dbopen.getConnection();

            StringBuilder sql = new StringBuilder()
                    .append("SELECT * ")
                    .append("FROM (SELECT a.*, ROWNUM AS rnum ")
                    .append("      FROM (SELECT bbsno, wname, subject, readcnt, regdt, grpno, indent ")
                    .append("            FROM tb_bbs ");

            if(word.length()>=1) { // 검색어가 존재한다면
                if(col.equals("subject_content")) {
                    sql.append("WHERE subject LIKE '%" + word + "%' ")
                            .append("OR content LIKE '%" + word + "%' ");
                } else if (col.equals("subject")) {
                    sql.append("WHERE subject LIKE '%" + word + "%' ");
                } else if (col.equals("content")) {
                    sql.append("WHERE content LIKE '%" + word + "%' ");
                } else if (col.equals("wname")) {
                    sql.append("WHERE wname LIKE '%" + word + "%' ");
                }
            }
                    sql.append("            ORDER BY grpno ASC, ansnum DESC) a) b ")
                    .append("ORDER BY rnum DESC ");

            pstmt = conn.prepareStatement(sql.toString());
            rs = pstmt.executeQuery();

            if(rs.next()) {
                list = new ArrayList(); //dto 객체 저장 배열
                do {
                    BbsDTO dto = new BbsDTO();
                    dto.setBbsno(rs.getInt("bbsno"));
                    dto.setWname(rs.getString("Wname"));
                    dto.setSubject(rs.getString("subject"));
                    dto.setReadcnt(rs.getInt("readcnt"));
                    dto.setRegdt(rs.getString("Regdt"));
                    dto.setIndent(rs.getInt("indent"));
                    dto.setRnum(rs.getInt("rnum"));
                    list.add(dto);
                } while (rs.next());
            }

        } catch (Exception e) {
            System.out.println("검색어 조회 실패 : " + e);
        } finally {
            DBClose.close(conn, pstmt, rs);
        }
        return list;
    }
     */

    // 전체리스트, 검색리스트 조회 메소드
    public ArrayList<BbsDTO> list3(String col, String word, int nowPage, int recordPerPage, int totalRecord) {
        ArrayList<BbsDTO> list = null;
        // recordPerPage : 페이지당 출력할 행의 갯수(8개 기준)
        // 1페이지 : WHERE r>=17 AND r<=24;
        // 2페이지 : WHERE r>=9 AND r<=16;
        // 3페이지 : WHERE r>=1 AND r<=8;
        int startRow = totalRecord - (nowPage * recordPerPage)+1; //페이지 번호의 시작 rownum -5
        int endRow = totalRecord - (nowPage-1)*recordPerPage; //페이지 번호의 끝 rownum 3

        try {
            conn = dbopen.getConnection();
            StringBuilder sql = new StringBuilder()
                    .append("SELECT * ")
                    .append("FROM (SELECT a.*, ROWNUM AS rnum ")
                    .append("      FROM (SELECT bbsno, wname, subject, readcnt, regdt, grpno, indent ")
                    .append("            FROM tb_bbs ");


            word = word.trim(); //검색어 공백 제거

            // 검색어 존재여부 확인
            if(word.length()==0) { //검색어가 없을 경우

                sql.append("            ORDER BY grpno ASC, ansnum DESC) a) ")
                    .append("WHERE rnum>=" + startRow + " AND rnum<=" + endRow)
                    .append(" ORDER BY rnum DESC ");

            } else { //검색어가 있을 경우

                if(col.equals("subject_content")) {
                    sql.append("WHERE subject LIKE '%" + word + "%' ")
                            .append("OR content LIKE '%" + word + "%' ");
                } else if (col.equals("subject")) {
                    sql.append("WHERE subject LIKE '%" + word + "%' ");
                } else if (col.equals("content")) {
                    sql.append("WHERE content LIKE '%" + word + "%' ");
                } else if (col.equals("wname")) {
                    sql.append("WHERE wname LIKE '%" + word + "%' ");
                }

                sql.append("            ORDER BY grpno ASC, ansnum DESC) a) ")
                    .append("WHERE rnum>=" + startRow + " AND rnum<=" + endRow)
                    .append(" ORDER BY rnum DESC ");
            }

            pstmt = conn.prepareStatement(sql.toString());
            rs = pstmt.executeQuery();

            if(rs.next()) {
                list = new ArrayList(); //dto 객체 저장 배열
                do {
                    BbsDTO dto = new BbsDTO();
                    dto.setBbsno(rs.getInt("bbsno"));
                    dto.setWname(rs.getString("Wname"));
                    dto.setSubject(rs.getString("subject"));
                    dto.setReadcnt(rs.getInt("readcnt"));
                    dto.setRegdt(rs.getString("Regdt"));
                    dto.setIndent(rs.getInt("indent"));
                    dto.setRnum(rs.getInt("rnum"));
                    list.add(dto);
                } while (rs.next());
            }

        } catch (Exception e) {
            System.out.println("검색어 조회 실패 : " + e);
        } finally {
            DBClose.close(conn, pstmt, rs);
        }
        return list;
    }
}
