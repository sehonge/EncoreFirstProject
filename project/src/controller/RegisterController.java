package controller;

import java.io.PrintWriter;
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
		
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("custId");
		String password =  request.getParameter("password");
		String name =  request.getParameter("name");
		String address =  request.getParameter("address");
		String phoneNumber =  request.getParameter("custNumber");
		String email =  request.getParameter("email");
		String path = "";
		PrintWriter out = response.getWriter();
		
		
		Customer pvo = new Customer(id, password, name, address, phoneNumber, email);
		System.out.println(pvo);
		try {
			if(CustomerDaoImpl.getInstance().SignUp(id, password, name, address, phoneNumber, email)) {
				AddressDaoImpl.getInstance().addAddress(address, id);
				path = "Main/login.jsp";
				System.out.println("next : " + path);
			}else {
				path = "Main/register.jsp";
            }
        } catch (SQLException e) {
        	path = "Main/register.jsp";
        }
		return new ModelAndView(path, true);
	}

}
