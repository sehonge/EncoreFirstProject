package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.CustomerDaoImpl;

public class LoginCheckController implements Controller{

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		PrintWriter out = response.getWriter();
		String id = request.getParameter("custId");
	
		
		try {
			boolean flag = CustomerDaoImpl.getInstance().isExist(id);
			out.print(flag); // true or false --> callback 에선 String 으로 넘어온다.
			
			
		}catch (Exception e) {
			
		}
		
		return null;
	}
	

}
