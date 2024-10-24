package com.desc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.desc.dto.DescenteVO;
import util.DBManager;

public class DescenteDAO {

	// 싱글톤 패턴
	private DescenteDAO() {
	}

	private static DescenteDAO instance = new DescenteDAO();

	public static DescenteDAO getInstance() {
		return instance;
	}

	// 최근 등록한 게시글이 먼저 나오도록 게시글 목록을 출력한다. / get
	public List<DescenteVO> selectAllBoards() {
		String sql = "select * from board order by num desc";
		List<DescenteVO> list = new ArrayList<DescenteVO>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				DescenteVO dVo = new DescenteVO();
				dVo.setNum(rs.getInt("num"));
				dVo.setUsername(rs.getString("username"));
				dVo.setEmail(rs.getString("email"));
				dVo.setPass(rs.getString("pass"));
				dVo.setTitle(rs.getString("title"));
				dVo.setContent(rs.getString("content"));
				dVo.setReadcount(rs.getInt("readcount"));
				dVo.setWritedate(rs.getTimestamp("writedate"));
				list.add(dVo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, stmt, rs);
		}
		return list;
	}

	// 전달인자로 받은 VO 객체를 board 테이블에 삽입한다. / Create
	public void insertBoard(DescenteVO dVo) {
		String sql = "insert into board(username, email, pass, title, content) values(?, ?, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dVo.getUsername());
			pstmt.setString(2, dVo.getEmail());
			pstmt.setString(3, dVo.getPass());
			pstmt.setString(4, dVo.getTitle());
			pstmt.setString(5, dVo.getContent());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace(); // 또는 로깅 프레임워크를 사용하여 로그에 기록
			throw new RuntimeException("글 작성 중에 오류가 발생했습니다.", e);
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	// 게시글 상세 보기할 때마다 글 번호를 증가시킨다.
	public void updateReadCount(String num) {
		String sql = "update board set readcount=readcount+1 where num=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	// 게시판 글 상세 내용 보기 :글번호로 찾아온다. : 실패 null,
	// 테이블에서 게시글 번호로 해당 게시글을 찾아 게시글 정보를 BoardVO객체로 얻어준다. / Read
	public DescenteVO selectOneBoardByNum(String num) {
		String sql = "select * from board where num = ?";
		DescenteVO dVo = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dVo = new DescenteVO();
				dVo.setNum(rs.getInt("num"));
				dVo.setUsername(rs.getString("username"));
				dVo.setPass(rs.getString("pass"));
				dVo.setEmail(rs.getString("email"));
				dVo.setTitle(rs.getString("title"));
				dVo.setContent(rs.getString("content"));
				dVo.setWritedate(rs.getTimestamp("writedate"));
				dVo.setReadcount(rs.getInt("readcount"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return dVo;
	}

	// 매개변수로 받은 VO 객체 내의 코드로 board테이블에서 검색해서 VO객체에
	// 저장된 정보로 게시글 정보를 수정한다. / update
	public void updateBoard(DescenteVO dVo) {
		String sql = "update board set username=?, email=?, pass=?, " + "title=?, content=? where num=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dVo.getUsername());
			pstmt.setString(2, dVo.getEmail());
			pstmt.setString(3, dVo.getPass());
			pstmt.setString(4, dVo.getTitle());
			pstmt.setString(5, dVo.getContent());
			pstmt.setInt(6, dVo.getNum());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}

	}

	// board 테이블에서 게시글 번호와 비밀번호가 일치하는 게시글을 찾아 BoardVO
	// 객체로 리턴한다
	public DescenteVO checkPassWord(String pass, String num) {
		String sql = "select * from board where pass=? and num=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DescenteVO bVo = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pass);
			pstmt.setString(2, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bVo = new DescenteVO();
				bVo.setNum(rs.getInt("num"));
				bVo.setUsername(rs.getString("username"));
				bVo.setEmail(rs.getString("email"));
				bVo.setPass(rs.getString("pass"));
				bVo.setTitle(rs.getString("title"));
				bVo.setContent(rs.getString("content"));
				bVo.setReadcount(rs.getInt("readcount"));
				bVo.setWritedate(rs.getTimestamp("writedate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return bVo;
	}

	// 게시글 번호에 해당하는 게시글 정보를 삭제한다. / delete
	public void deleteBoard(String num) {
		String sql = "delete from board where num=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

}
