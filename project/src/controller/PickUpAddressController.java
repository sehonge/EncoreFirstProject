package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Customer;
import model.MenuDaoImpl;
import model.Shop;
import model.ShopDaoImpl;

public class PickUpAddressController implements Controller{

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ArrayList<Shop> list = ShopDaoImpl.getInstance().getAllShop();
		request.setAttribute("list", list);
		
		return new ModelAndView("delivery.jsp");
	}

}
