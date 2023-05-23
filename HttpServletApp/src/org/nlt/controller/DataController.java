package org.nlt.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DataController  extends HttpServlet implements ParentInterface
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		service(req, resp);
	}
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		service(req, resp);
	}
	
	
	public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		HttpSession ses= req.getSession();
		resp.setContentType("text/html");
		
		PrintWriter out= resp.getWriter();
		try 
		{
			String pageName=req.getParameter("page");
			
			
			if(pageName.equals("LoginPage"))
			{
				String email=req.getParameter("email");
				String password=req.getParameter("password");
				Statement smt=con.createStatement();
				ResultSet rs=smt.executeQuery("select * from users where email='"+email+"' and password='"+password+"' and status=1");
				
				
	/*		if(email.equals("hk.khu67@gmail.com")&&password.equals("1234"))
				{
					ses.setAttribute("Ip",req.getRemoteAddr());
					ses.setAttribute("LoginName","Harish Khubalkar");
					RequestDispatcher rd = req.getRequestDispatcher("index3.jsp");
					rd.include(req, resp);
				}
	*/	
				if(rs.next())
			{
					ses.setAttribute("Ip",req.getRemoteAddr());
					ses.setAttribute("LoginName",rs.getString("name"));
					RequestDispatcher rd = req.getRequestDispatcher("index3.jsp");
					rd.include(req, resp);
			}
				
				else
				{
					RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
					out.println("<h3>Invalid Login! Please Try Again.....</h3>");
					rd.include(req, resp);

				}
				rs.close();
				smt.close();
			}
			else if(pageName.equals("RegistrationPage"))
			{
				String name=req.getParameter("name");
				String username=req.getParameter("username");
				String email=req.getParameter("email");
				String phone=req.getParameter("phone");
				String password=req.getParameter("password");
				Statement smt=con.createStatement();
				  smt.execute("insert into users(name,username,email,phone,password,status) values ('"+name+"','"+username+"','"+email+"','"+phone+"','"+password+"',1)");
				  smt.close();
				  RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
				  out.println("<h4>Record Submitted Successfully</h4>");
				rd.include(req, resp);
				 
			}
			else if(pageName.equals("PersonPage"))
			{
				String fname=req.getParameter("fname");
				String age=req.getParameter("age");
				String phone=req.getParameter("phone");
				String gender=req.getParameter("gender");
				Statement smt=con.createStatement();
				  smt.execute("insert into persons(name,age,phone,gender,status) values ('"+fname+"',"+age+",'"+phone+"','"+gender+"',1)");
				  smt.close();
				  RequestDispatcher rd=req.getRequestDispatcher("index3.jsp");
				  out.println("<h4>Record Submitted Successfully</h4>");
				rd.include(req, resp);
				 
			}
			else if(pageName.equals("PersonUpdatePage"))
			{
				String id=req.getParameter("id");
				String fname=req.getParameter("fname");
				String age=req.getParameter("age");
				String phone=req.getParameter("phone");
				String gender=req.getParameter("gender");
				Statement smt=con.createStatement();
				  smt.execute("update persons set name='"+fname+"',age="+age+",phone='"+phone+"',gender='"+gender+"' where id="+id);
				  smt.close();
				  RequestDispatcher rd=req.getRequestDispatcher("index3.jsp");
				  out.println("<h4>Record Updated Successfully</h4>");
				rd.include(req, resp);
				 
			}
			else if(pageName.equals("PersonDeletePage"))
			{
				String id=req.getParameter("id");
		
				Statement smt=con.createStatement();
				  smt.execute("update persons set status=0 where id="+id);
				  smt.close();
				  RequestDispatcher rd=req.getRequestDispatcher("index3.jsp");
				  out.println("<h4>Record Deleted Successfully</h4>");
				rd.include(req, resp);
				 
			}
		} catch (Exception e)
		{
			out.println("<h2>"+e+"</h2>");
		}
	
	}

}
