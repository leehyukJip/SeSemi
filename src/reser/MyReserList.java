package reser;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.ReserDAO;
import DB.UserVO;
import model.Action;
import model.ActionData;

public class MyReserList implements Action {

	@Override
	public ActionData exec(HttpServletRequest request, HttpServletResponse responce) {
		
		ReserDAO dao = new ReserDAO();
		
		UserVO user = (UserVO)request.getAttribute("user");
		
		request.setAttribute("mylist", dao.userReser(user.getUserId()));
		
		dao.close();
		return new ActionData();
	}
}
