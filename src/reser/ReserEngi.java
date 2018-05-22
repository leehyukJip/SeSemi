package reser;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.ReserDAO;
import DB.ScheduleVO;
import model.Action;
import model.ActionData;

public class ReserEngi implements Action {

	@Override
	public ActionData exec(HttpServletRequest request, HttpServletResponse responce) {

		ReserDAO dao = new ReserDAO();
//		Date date = (Date)request.getAttrubute("day");
		int ddd = Integer.parseInt(request.getParameter("day"));
		Date date = new Date(2018-1900,5-1,ddd);
		String uid = request.getParameter("uid");
		
		ArrayList<ScheduleVO> slist = dao.dayPart(date);

		System.out.println("slist:"+slist);

		request.setAttribute("user", dao.findUser(uid));
		request.setAttribute("schevo", new ScheduleVO());
		request.setAttribute("slist", slist);

		request.setAttribute("day", date);

		request.setAttribute("main", "reserForm.jsp");

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
