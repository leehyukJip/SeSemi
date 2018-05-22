package reser;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.ReserDAO;
import DB.ReserVO;
import model.Action;
import model.ActionData;

public class Reser implements Action {
	
	@Override
	public ActionData exec(HttpServletRequest request, HttpServletResponse responce) {
		
		
		ReserDAO dao = new ReserDAO();
		
		
		request.setAttribute("user", dao.findUser("junho"));
		request.setAttribute("today", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		request.setAttribute("main", "reserForm.jsp");
		request.setAttribute("cate", dao.cateList().keySet());
		request.setAttribute("reservo", new ReserVO());
//		dao.cateList().;
//		UserVO uu = new UserVO();
//		uu.get
		System.out.println("긁어라"+request.getAttribute("today")+"===================");
		for (String st : dao.cateList().keySet()) {
			dao.cateList().get(st);
		}
		dao.close();
		
		return new ActionData();
		
	}
}