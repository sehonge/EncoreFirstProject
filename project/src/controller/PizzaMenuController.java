package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Menu;
import model.MenuDaoImpl;

public class PizzaMenuController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ArrayList<Menu> list = MenuDaoImpl.getInstance().getAllPizza();
		
		for(Menu menu : list)
			System.out.println(menu);
		
		request.setAttribute("list", list);
		
		return new ModelAndView("Menu/PizzaMenu.jsp");
	}

	
}
