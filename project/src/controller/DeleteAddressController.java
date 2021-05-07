package controller;

import java.io.PrintWriter;
import java.sql.SQLException;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.AddressDaoImpl;
import model.Customer;

public class DeleteAddressController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session =request.getSession();
		Customer c = (Customer) session.getAttribute("rvo");
		String custId = c.getCustId();
		String address = request.getParameter("address");

		System.out.println(address + " " + custId);
		
		try {
		boolean del = AddressDaoImpl.getInstance().deleteAddress(address, custId);
		
		ArrayList<String> list = AddressDaoImpl.getInstance().showAllAddress(custId);
		request.setAttribute("list", list);
		
	} catch (SQLException e) {
	}
	return new ModelAndView("deliveryAddress.do"); 
	}
}