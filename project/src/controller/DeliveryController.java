package controller;

import java.io.PrintWriter;


import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.AddressDaoImpl;
import model.Customer;
import model.CustomerDaoImpl;
import model.Shop;
import model.ShopDaoImpl;

public class DeliveryController implements Controller{

		@Override
		public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			HttpSession session =request.getSession();
			Customer c = (Customer) session.getAttribute("rvo");
			String custId = c.getCustId();
			System.out.println(custId);
			
			ArrayList<String> list = AddressDaoImpl.getInstance().showAllAddress(custId);
			request.setAttribute("DAList", list);
			
			return new ModelAndView("Order/delivery.jsp");
			
		}
}