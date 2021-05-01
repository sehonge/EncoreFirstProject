package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Menu;
import model.MenuDaoImpl;

public class SideDiscController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String menuId = request.getParameter("menuId"); 
		
		System.out.println(menuId);
		
		Menu side = MenuDaoImpl.getInstance().getMenu(menuId);
		
		request.setAttribute("side", side);
		
		return new ModelAndView("Menu/SideDisc.jsp");
	}
	
}
