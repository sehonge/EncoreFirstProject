package controller;

import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.SQLException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Customer;
import model.CustomerDaoImpl;

public class LoginController implements Controller{

		@Override
		public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			PrintWriter out= response.getWriter();
			String id = request.getParameter("custId");
			String password = request.getParameter("custPw");
			String path = "";
			String err ="errmsg.jsp";
			try {
				Customer rvo = CustomerDaoImpl.getInstance().signIn(id, password);
				HttpSession session =request.getSession();
				if(rvo != null) {
					session.setAttribute("rvo", rvo); // Customer 객체를 만들어놓자.
					path = URLEncoder.encode("Index.jsp","UTF-8");
					
				}else {
					path = URLEncoder.encode("register.jsp","UTF-8");
//>>>>>>> upstream/main
	            }
	        } catch (SQLException e) {
	        	path = URLEncoder.encode("login.jsp","UTF-8");
	        }
			return new ModelAndView(path, true); // encoding ERROR post 방식으로 보내기.
		}
}
