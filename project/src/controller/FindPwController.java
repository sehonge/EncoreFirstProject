package controller;

import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CustomerDaoImpl;

public class FindPwController implements Controller{

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");

		try {
			String custPw = CustomerDaoImpl.getInstance().findPw(id);
			out.print(custPw);
		} catch (SQLException e) {
		}

		return null;
	}

}
