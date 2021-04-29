package controller;

import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Customer;
import model.CustomerDaoImpl;

public class EmailCheckController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		String email = request.getParameter("email");
		try {
			boolean flag = CustomerDaoImpl.getInstance().emailCheck(email);
			out.print(flag); // 넘어갈땐 String으로 넘어감

		} catch (SQLException e) {
		}

		return null;

	}
}
