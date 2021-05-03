package controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.AddressDaoImpl;
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
		String err = "registererrmsg.jsp";
		String success = "success.jsp";
		String path = "";
		
		Customer pvo = new Customer(id, password, name, address, phoneNumber, email);
		
		try {
			if(CustomerDaoImpl.getInstance().SignUp(id, password, name, address, phoneNumber, email)) {
				AddressDaoImpl.getInstance().addAddress(address, id);
				request.setAttribute("success.jsp", success);
				path = "login.jsp";
			}else {
				request.setAttribute("registererrmsg.jsp", err); //단발성 애들
				path = "register.jsp";
            }
        } catch (SQLException e) {
        	request.setAttribute("errmsg.jsp", err);
        	path = "register.jsp";
        }
		return new ModelAndView(path);
	}

}
