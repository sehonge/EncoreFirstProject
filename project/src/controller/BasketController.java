package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BasketController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("rvo") != null) {
			return new ModelAndView("Order/CartView.jsp");
		} else {
			return new ModelAndView("Main/login.jsp", true);
		}
	}

}
