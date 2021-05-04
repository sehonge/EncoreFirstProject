package controller;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AddressDaoImpl;

public class AddAddressController implements Controller{

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String address = request.getParameter("address");
		try {
		boolean add = AddressDaoImpl.getInstance().addAddress(null, null);
		
		ArrayList<String> list = AddressDaoImpl.getInstance().showAllAddress(null);
		request.setAttribute("list", list);
		
	} catch (SQLException e) {
	}
	return new ModelAndView("delivery.jsp"); 
	}
}

