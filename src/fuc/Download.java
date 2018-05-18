package fuc;

import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.DwDAO;
import DB.DwVO;
import model.Action;
import model.ActionData;

public class Download implements Action{
	@Override
	public ActionData exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ActionData data = new ActionData();
		DwDAO dao = new DwDAO();
		
		List<DwVO> favo = dao.favlist(null,null);
		Map<String, List<String>> cate = dao.categori();
		
		dao.close();
		request.setAttribute("id", "admin");
		request.setAttribute("fav", favo);
		request.setAttribute("cate", cate);
		request.setAttribute("main", "downform.jsp");
		
		return data;
	}
}
