package controller;

import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Customer;
import model.CustomerDaoImpl;

public class IdCheckController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		try {
			boolean flag = CustomerDaoImpl.getInstance().idCheck(id);
			out.print(flag); // 넘어갈땐 String으로 넘어감
			
		} catch (SQLException e) {
		}
		
		return null;
	}

}
