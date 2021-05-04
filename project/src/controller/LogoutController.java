package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String path = "";

		try {
			HttpSession session = request.getSession();
			if (session.getAttribute("rvo") != null) {
				session.invalidate();
				path = "Main/logout.jsp";
			}

		} catch (Exception e) {

		}

		return new ModelAndView(path);
	}

}