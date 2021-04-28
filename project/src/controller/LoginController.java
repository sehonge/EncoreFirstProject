package controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Customer;
import model.CustomerDaoImpl;

public class LoginController implements Controller{

		@Override
		public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			String path = "";
			String login = "login.jsp";
			String err = "errmsg.jsp";
			
			try {
				Customer rvo = CustomerDaoImpl.getInstance().signIn(id, password);
				HttpSession session =request.getSession();
				if(rvo != null) {
					session.setAttribute("vo", rvo); //통신이 끊기기 전 남는 애들
					path = "Index.jsp";
				}else {
					request.setAttribute("errmsg.jsp", err); //단발성 애들
					path = "login.jsp";
	            }
	        } catch (SQLException e) {
	        	request.setAttribute("errmsg.jsp", err);
	        	path = "login.jsp";
	        }
			return new ModelAndView(path);
		}
}
