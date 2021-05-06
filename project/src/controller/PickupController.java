package controller;

import java.io.PrintWriter;

import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Shop;
import model.ShopDaoImpl;

public class PickupController implements Controller{

		@Override
		public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			ArrayList<Shop> list = ShopDaoImpl.getInstance().getAllShop();
			request.setAttribute("PAlist", list);
			
			return new ModelAndView("Order/pickup.jsp"); 
		}
}