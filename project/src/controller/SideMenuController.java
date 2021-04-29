package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Menu;
import model.MenuDaoImpl;

public class SideMenuController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ArrayList<Menu> list = MenuDaoImpl.getInstance().getAllSide();
		
		request.setAttribute("list", list);
		
		return new ModelAndView("Menu/SideMenu.jsp");
	}
	
}
