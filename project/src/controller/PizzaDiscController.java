package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Menu;
import model.MenuDaoImpl;

public class PizzaDiscController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String menuId = request.getParameter("menuId"); 
		
		Menu pizza = MenuDaoImpl.getInstance().getPizza(menuId);
		
		request.setAttribute("pizza", pizza);
		
		return new ModelAndView("Menu/PizzaDisc.jsp");
	}
	
}
