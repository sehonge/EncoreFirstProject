package controller;

import java.io.PrintWriter;


import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.AddressDaoImpl;
import model.CustomerDaoImpl;
import model.Shop;
import model.ShopDaoImpl;

public class DeliveryController implements Controller{

		@Override
		public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			ArrayList<String> list = AddressDaoImpl.getInstance().showAllAddress(null);
			request.setAttribute("list", list);
			
			return new ModelAndView("delivery.jsp"); 
			
		}
}