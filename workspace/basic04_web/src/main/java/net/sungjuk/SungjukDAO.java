package net.sungjuk;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.utility.DBClose;
import net.utility.DBOpen;

public class SungjukDAO { //Data Access Object -> 데이터베이스 관련 비지니스 로직 구현

	private DBOpen dbopen = null;
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public SungjukDAO() {
		dbopen = new DBOpen();
	}

	public int insert (SungjukDTO dto) { // 성적 입력 메소드
		int cnt = 0;
		try {
			conn = dbopen.getConnection();

			String sql = new StringBuilder()
					.append("INSERT INTO sungjuk(sno, uname, kor, eng, mat, aver, addr, wdate) ")
					.append("VALUES(sungjuk_seq.nextval, ?, ?, ?, ?, ?, ?, sysdate)")
					.toString();

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUname());
			pstmt.setInt(2, dto.getKor());
			pstmt.setInt(3, dto.getEng());
			pstmt.setInt(4, dto.getMat());
			pstmt.setInt(5, dto.getAver());
			pstmt.setString(6, dto.getAddr());

			cnt = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("행추가 실패: " + e);
		} finally {
			DBClose.close(conn, pstmt);
		}
		return cnt;
	}

	public ArrayList<SungjukDTO> list() { // 성적 전체 조회 메소드
		//데이터 베이스에서 가져온 데이터(rs)를 배열에(ArrayList) 한꺼번에 모아서 sungjukList.jsp에 전달
		ArrayList<SungjukDTO> list = null;
		try {
			conn = dbopen.getConnection();

			String sql = new StringBuilder()
					.append("SELECT a.*, rownum AS rnum ")
					.append("FROM (select sno, uname, aver FROM sungjuk order by aver desc) a")
					.toString();

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			list = new ArrayList<SungjukDTO>(); //dto 객체 저장 배열
			while (rs.next()) {
				SungjukDTO dto = new SungjukDTO();
				dto.setSno(rs.getInt("sno"));
				dto.setUname(rs.getString("uname"));
				dto.setAver(rs.getInt("aver"));
				dto.setRnum(rs.getInt("rnum"));
				list.add(dto);
			}

		} catch (Exception e) {
			System.out.println("조회 실패 : " + e);
		} finally {
			DBClose.close(conn, pstmt, rs);
		}
		return list;
	}

	public SungjukDTO read(int sno) { // 성적 상세조회, 수정전 값조회 메세지

		SungjukDTO dto = null;
		try {
			conn = dbopen.getConnection();

			String sql = new StringBuilder()
					.append("SELECT sno, uname, kor, eng, mat, aver, addr, wdate ")
					.append("FROM sungjuk ")
					.append("WHERE sno=?")
					.toString();

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sno);

			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new SungjukDTO();
				dto.setSno(sno);
				dto.setUname(rs.getString("uname"));
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
				dto.setAver(rs.getInt("aver"));
				dto.setAddr(rs.getString("addr"));
				dto.setWdate(rs.getString("wdate"));
			}

		} catch (Exception e) {
			System.out.println("상세보기 실패: " + e);
		} finally {
			DBClose.close(conn, pstmt, rs);
		}

		return dto;
	}

	public int delete (int sno) { // 성적 한줄 삭제 메소드
		int cnt = 0;
		try {
			conn = dbopen.getConnection();

			String sql = new StringBuilder()
					.append("DELETE FROM sungjuk WHERE sno=?")
					.toString();

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sno);

			cnt = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("삭제 실패" + e);
		} finally {
			DBClose.close(conn, pstmt);
		}
		return cnt;
	}

	public int update(SungjukDTO dto) { // 성적 수정 메소드
		int cnt = 0;
		try {
			conn = dbopen.getConnection();

			String sql = new StringBuilder()
					.append("UPDATE sungjuk ")
					.append("SET uname=?, kor=?, eng=?, mat=?, aver=?, addr=?, wdate=sysdate ")
					.append("WHERE sno=?")
					.toString();

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getUname());
			pstmt.setInt(2, dto.getKor());
			pstmt.setInt(3, dto.getEng());
			pstmt.setInt(4, dto.getMat());
			pstmt.setInt(5, dto.getAver());
			pstmt.setString(6, dto.getAddr());
			pstmt.setInt(7, dto.getSno());

			cnt = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("수정 실패" + e);
		} finally {
			DBClose.close(conn, pstmt);
		}
		return cnt;
	}
}
