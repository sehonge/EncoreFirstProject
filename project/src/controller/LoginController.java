package controller;

import model.Customer;
import model.CustomerDaoImpl;

public class LoginController implements Controller{

		@Override
		public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			String path = "";
			
			try {
				Customer rvo = CustomerDaoImpl.getInstance().matchIdPassword(id, password);
				HttpSession session =request.getSession();
				if(rvo != null) {
					
					session.setAttribute("vo",rvo);
					path = "Index.jsp"
				}
			}catch(SQLException e) {
				
			}
			return new ModelAndView(path);
		}
	}