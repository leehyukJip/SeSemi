package reser;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.ReserDAO;
import model.Action;
import model.ActionData;

public class ReserDelete implements Action{

	@Override
	public ActionData exec(HttpServletRequest request, HttpServletResponse responce) {
		
		ReserDAO dao = new ReserDAO();
		
//		int rid = (int)request.getAttribute("delrid");
		int rid = Integer.parseInt(request.getParameter("rid"));
		
		
		request.setAttribute("msg", "취소실패");
		request.setAttribute("url", "MyReserList");
		request.setAttribute("main", "alert.jsp");
		
		if(dao.reserDelete(rid)) {
			request.setAttribute("msg", "취소되었습니다");
		}
		
		
		return new ActionData();
	}
	

}
