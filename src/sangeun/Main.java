
package sangeun;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import model.Action;

import model.ActionData;

public class Main implements Action {

	@Override

	public ActionData exec(HttpServletRequest request, HttpServletResponse responce) {

		// TODO Auto-generated method stub
		ActionData res = new ActionData();
		request.setAttribute("main", "bb/main.jsp");
		return res;

	}

}