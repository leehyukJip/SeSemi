package reser;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.ReserDAO;
import DB.ReserVO;
import DB.ScheduleVO;
import model.Action;
import model.ActionData;

public class Reservation implements Action {

	@Override
	public ActionData exec(HttpServletRequest request, HttpServletResponse responce) {

		String msg = "예약실패 : 늦음";
		String url = "Reser";
		ReserDAO dao = new ReserDAO();
		String userid = request.getParameter("userid");
		String resdate = request.getParameter("resdate");
		System.out.println("userid:" + userid);
		System.out.println("resdate:" + resdate);
		System.out.println("yyyy:" + Integer.parseInt(resdate.substring(0, resdate.indexOf('-'))));
		System.out.println("mm:" + Integer.parseInt(resdate.substring(resdate.indexOf('-') + 1, resdate.lastIndexOf('-'))));
		System.out.println("dd:" + Integer.parseInt(resdate.substring(resdate.lastIndexOf('-') + 1)));

		Date date = new Date(Integer.parseInt(resdate.substring(0, resdate.indexOf('-'))),
				Integer.parseInt(resdate.substring(resdate.indexOf('-') + 1, resdate.lastIndexOf('-'))),
				Integer.parseInt(resdate.substring(resdate.lastIndexOf('-') + 1)));
		
		System.out.println("date:"+date);
		int gid = Integer.parseInt(request.getParameter("gid"));
		System.out.println("gid왔다:"+gid);
		int part = Integer.parseInt(request.getParameter("part"));
		System.out.println("part왔다:"+part);

		ReserVO rvo = new ReserVO(gid, part, date, userid);
		System.out.println("reservation rvo왔다" + rvo);
		ScheduleVO svo = new ScheduleVO(gid, date, part);

		System.out.println("reservation svo왔다" + svo);

		if (dao.reserInsert(rvo)) {
			msg = "예약완료";
			url = "ReserDetailForm?rid=" + rvo.getRid();
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		request.setAttribute("main", "alert.jsp");

		dao.close();
		/*
		 * 예약하기 누르고 예약완료 띄우고 그러면 알터로 가자 msg="예약완료" main="방금 한 예약 정보"
		 * 
		 * 거기서 main="내정보 예약내역" 홈으로 이런거
		 * 
		 * 예약내역에서 취소 가능하게.
		 */
		return new ActionData();
	}

}
