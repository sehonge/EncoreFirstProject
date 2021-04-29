package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CustomerDaoImpl;

public class ShowCustomerController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");

		String path = "index.jsp"; // �⺻ path
		try {
			
			request.setAttribute("info", CustomerDaoImpl.getInstance().showCustomer(id));

			path = "Mypage.jsp"; // 이동할 path

		} catch (Exception e) {

		}
		return new ModelAndView(path);
	}

}
