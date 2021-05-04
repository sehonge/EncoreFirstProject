package controller;

import java.io.PrintWriter;
import java.sql.SQLException;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.AddressDaoImpl;

public class DeleteAddressController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String address = request.getParameter("address");
		String custId = request.getParameter("custId"); 
		System.out.println(address + " " + custId);
		
		try {
		boolean del = AddressDaoImpl.getInstance().deleteAddress(address, custId);
		
		ArrayList<String> list = AddressDaoImpl.getInstance().showAllAddress(custId);
		request.setAttribute("list", list);
		
	} catch (SQLException e) {
	}
	return new ModelAndView("delivery.jsp"); 
	}
}
