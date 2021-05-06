package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CustomerDaoImpl;

public class ShowCustomerController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();

		if (session.getAttribute("rvo") == null)
			return new ModelAndView("Main/login.jsp", true);
		else {
			System.out.println(session.getAttribute("rvo"));
			String id = request.getParameter("id");
			String path = "Main/index.jsp"; // �⺻ path

			try {
				request.setAttribute("info", CustomerDaoImpl.getInstance().showCustomer(id));
				path = "Main/Mypage.jsp"; // 이동할 path
			} catch (Exception e) {

			}
			return new ModelAndView(path, true);
		}
	}

}
