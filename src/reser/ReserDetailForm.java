package reser;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.EngineerVO;
import DB.ReserDAO;
import DB.ReserVO;
import DB.UserVO;
import model.Action;
import model.ActionData;

public class ReserDetailForm implements Action {

	@Override
	public ActionData exec(HttpServletRequest request, HttpServletResponse responce) {
		
		ReserDAO dao = new ReserDAO();
		int rid = Integer.parseInt(request.getParameter("rid"));
		
		ReserVO rvo = dao.findReser(rid);
		UserVO uvo = dao.findUser(rvo.getUserId());
		EngineerVO evo = dao.findEngi(rvo.getGid());
		
		request.setAttribute("reser", rvo);
		request.setAttribute("user", uvo);
		request.setAttribute("engi", evo);
		
		request.setAttribute("main", "reserDetailForm.jsp");
		
		dao.close();
		return new ActionData();
	}
}