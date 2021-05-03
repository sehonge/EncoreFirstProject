package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Menu;
import model.MenuDaoImpl;

public class PizzaDiscController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String menuId = request.getParameter("menuId"); 
		String menuIdR = menuId.substring(0, menuId.length() - 1) + 'R';
		System.out.println(menuId + " " + menuIdR);
		
		Menu pizzaL = MenuDaoImpl.getInstance().getMenu(menuId);		
		Menu pizzaR = MenuDaoImpl.getInstance().getMenu(menuIdR);
		
		request.setAttribute("pizzaL", pizzaL);
		request.setAttribute("pizzaR", pizzaR);
		
		return new ModelAndView("Menu/PizzaDisc.jsp");
	}
	
}
