package controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Customer;
import model.CustomerDaoImpl;

public class RegisterController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String password =  request.getParameter("password");
		String name =  request.getParameter("name");
		String address =  request.getParameter("address");
		String phoneNumber =  request.getParameter("phoneNumber");
		String email =  request.getParameter("email");
		String path = "registre_fail.jsp";
		
		Customer pvo = new Customer(id, password, name, address, phoneNumber, email);
		
		try {
			CustomerDaoImpl.getInstance().signUp(pvo);
			path = "Mypage.jsp";
		}catch(SQLException e) {
			
		}
		
		return new ModelAndView(path);
	}

}
