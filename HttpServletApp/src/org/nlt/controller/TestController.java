package org.nlt.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class TestController extends HttpServlet
{

@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	service(req, resp);
}
@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	 service(req, resp);
	}
 @Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Service Method");
		
		HttpSession ses=req.getSession();
		System.out.println(ses.getId());
		
		String clientIp=req.getRemoteAddr();
		System.out.println(clientIp);
		
		String browserOsDetails=req.getHeader("User-Agent");
		System.out.println(browserOsDetails);
	}

}

	

