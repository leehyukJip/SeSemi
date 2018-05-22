package DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReserDAO {


	Connection con;
	PreparedStatement ptmt;
	ResultSet rs;
	String sql;

	public ReserDAO() {

		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/oooo");

			con = ds.getConnection();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// dao 하나에 vo 여러개?

	//rid로 예약vo 받아옴
	public ReserVO findReser(int rid) {
		try {
			System.out.println("findReser진입");
			sql = "select * from reser where rid = ?";
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, rid);

			rs = ptmt.executeQuery();
			if (rs.next()) {
				ReserVO vo = new ReserVO();
				vo.setRid(rid);
				vo.setUserId(rs.getString("userid"));
				vo.setGid(rs.getInt("gid"));
				vo.setResDate(rs.getDate("resdate"));
				vo.setPart(rs.getInt("part"));
				System.out.println("findReser종료");
				return vo;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return null;
	}

	//uid로 유저vo 받아옴
	public UserVO findUser(String userId) {
		try {
			System.out.println("findUser진입");

			sql = "select * from uuser where userid = ?";
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, userId);

			rs = ptmt.executeQuery();
			if (rs.next()) {
				UserVO vo = new UserVO();
				vo.setUserId(userId);
				vo.setPoint(rs.getInt("point"));
				vo.setAddress(rs.getString("address"));
				vo.setPhone(rs.getString("phone"));
				vo.setName(rs.getString("name"));
				System.out.println("findUser종료");
				return vo;
			}

		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally {

		}
		return null;
	}

	
	//기사 id로 기사vo 받아옴
	public EngineerVO findEngi(int gid) {
		try {
			System.out.println("reserEngi진입");

			sql = "select * from engineer where gid = ?";
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, gid);

			rs = ptmt.executeQuery();
			if (rs.next()) {
				EngineerVO vo = new EngineerVO();
				vo.setGid(gid);
				vo.setPhone(rs.getString("phone"));
				vo.setPicture(rs.getString("picture"));
				vo.setName(rs.getString("name"));
				System.out.println("reserEngi종료");
				return vo;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}

		return null;

	}

	//uid로 유저의 예약리스트 받아옴
	public ArrayList<ReserVO> userReser(String userId) {
		ArrayList<ReserVO> list = new ArrayList<>();

		try {
			System.out.println("userReser진입");

			sql = "select * from reser where userid = ?";
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, userId);

			rs = ptmt.executeQuery();
			while (rs.next()) {
				ReserVO vo = new ReserVO();
				vo.setRid(rs.getInt("rid"));
				vo.setGid(rs.getInt("gid"));
				/*
				 * vo.setPart1(rs.getInt("part1")); vo.setPart2(rs.getInt("part2"));
				 * vo.setPart3(rs.getInt("part3"));
				 */
				vo.setPart(rs.getInt("part"));

				vo.setUserId(userId);
				vo.setResDate(rs.getDate("resDate"));
				list.add(vo);
			}

		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally {

		}

		return list;
	}

	/* 날짜넣고 예약정보리스트 불러오기 */
	public ArrayList<ScheduleVO> dayPart(java.util.Date resdate) {
		ArrayList<ScheduleVO> list = new ArrayList<>();

		try {
			System.out.println("dayPart 진입");
			System.out.println("::" + resdate);
			String dd = new SimpleDateFormat("yyyy-MM-dd").format(resdate);
			sql = "select * from schedule where resdate = '" + dd + "'";
			ptmt = con.prepareStatement(sql);
			
			System.out.println(sql);
			rs = ptmt.executeQuery();

			while (rs.next()) {
				System.out.println("DAO_dayPart rs있음");
				ScheduleVO vo = new ScheduleVO();

				vo.setGid(rs.getInt("gid"));
				vo.setResdate(rs.getDate("resdate"));
				vo.setPart1(rs.getInt("part1"));
				vo.setPart2(rs.getInt("part2"));
				vo.setPart3(rs.getInt("part3"));

				// vo.setPart(rs.getInt("part"));

				System.out.println(vo+"daypart종료");
				list.add(vo);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}

		return null;
	}

	// 디비에 예약정보 추가
	public boolean reserInsert(ReserVO vo) {
		try {
			/* 예약정보 추가 */
			sql = "insert into reser (rid, userid, gid, resdate, part) values(reser_rid.nextval, ?, ?, ?, ?)";
			System.out.println(sql);
			ptmt = con.prepareStatement(sql);

			
			ptmt.setString(1, vo.getUserId());
			ptmt.setInt(2, vo.getGid());
			ptmt.setDate(3, vo.getResDate());
			ptmt.setInt(4, vo.getPart());

			ptmt.executeUpdate();

			/* 기사 스케줄 수정 / 아무것도 없을때 part123 0으로 지정. 초기화< */

			sql = "select * from schedule where gid=? resdate=?";
			System.out.println(sql);
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, vo.getGid());
			ptmt.setDate(2, vo.getResDate());

			rs = ptmt.executeQuery();
			if (!rs.next()) { // 날짜에 데이터가 없으면 빈 스케줄 생성
				sql = "insert into schedule (gid, resdate, part1, part2, part3) values(?, ?, 0, 0, 0)";
				System.out.println(sql);
				ptmt = con.prepareStatement(sql);

				ptmt.setInt(1, vo.getGid());
				ptmt.setDate(2, vo.getResDate());

				ptmt.executeUpdate();

			}
			else if(rs.getInt("part"+vo.getPart()) == 1){
				System.out.println("reserInsert : Already exist ");
				return false;
			}
			// 해당 파트에 스케줄 생성
			sql = "update schedule set part" + vo.getPart() + "=1 where gid=? resdate=?";
			ptmt = con.prepareStatement(sql);
			System.out.println(sql);
			ptmt.setInt(1, vo.getGid());
			ptmt.setDate(2, vo.getResDate());

			ptmt.executeUpdate();
			return true;
		} catch (Exception e) {
			System.out.println("insert_error");
			e.printStackTrace();
		} finally {

		}
		return false;
	}

	/* 카테고리 리스트 불러오기 */
	public Map<String, String> cateList() {
		Map<String, String> map = new HashMap<String, String>();
		try {
			sql = "select * from categori";
			ptmt = con.prepareStatement(sql);

			rs = ptmt.executeQuery();
			while (rs.next()) {
				map.put(rs.getString("cate"), rs.getString("rang"));
			}
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally {
		}
		return null;
	}

	public boolean reserDelete(int rid) { // 예약 취소 당일이면 안된대
		ReserVO vo = new ReserVO();

		try {
			// 예약정보에서 삭제할 기사아이디, 날짜 가져오기
			sql = "select * from reser where rid=?";
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, rid);
			rs = ptmt.executeQuery();

			if (rs.next()) { // 넣기
				vo.setGid(rs.getInt("gid"));
				vo.setResDate(rs.getDate("resdate"));
			}

			// 빈 스케줄에서 삭제하는경우?
			if (rs.getInt("part" + vo.getPart()) == 0) {
				System.out.println("비었는데?");
				return false; 
			}

			// 해당 파트에 스케줄 삭제 // 가져온 기사id 날짜로 스케줄 삭제
			sql = "update schedule set part" + vo.getPart() + "=0 where gid=? resdate=?";
			ptmt = con.prepareStatement(sql);

			ptmt.setInt(1, vo.getGid());
			ptmt.setDate(2, vo.getResDate());

			ptmt.executeUpdate();

			/* 예약정보 삭제 / 아이디에 해당하는 예약정보 없을 경우가 있나? */
			sql = "delete from reser where rid=?";
			ptmt = con.prepareStatement(sql);

			ptmt.setInt(1, rid);
			ptmt.executeUpdate();

			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}
		return false;
	}

	/*
	 * try { sql=""; ptmt = con.prepareStatement(sql); ptmt.setInt(1, 1);
	 * ptmt.setString(1, ""); ptmt.executeQuery(); }catch (Exception e) { }finally {
	 * }
	 */

	public void close() {
		if (rs != null)
			try {
				rs.close();
			} catch (SQLException e) {
			}
		if (ptmt != null)
			try {
				ptmt.close();
			} catch (SQLException e) {
			}
		if (con != null)
			try {
				con.close();
			} catch (SQLException e) {
			}
	}
}

}
