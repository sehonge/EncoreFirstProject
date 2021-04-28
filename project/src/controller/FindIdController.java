package controller;

import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Customer;
import model.CustomerDaoImpl;

public class FindIdController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		String email = request.getParameter("email");

		try {
			String custId = CustomerDaoImpl.getInstance().findId(email);
			out.print(custId);
		} catch (SQLException e) {
		}

		return null;
	}

}
