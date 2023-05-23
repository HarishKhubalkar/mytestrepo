<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="org.nlt.controller.ParentInterface"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="css/style.css" type="text/css" rel="stylesheet"/>

<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
 -->
 <jsp:include page="head.jsp"/>
<body>
	
<!------ Include the above in your HEAD tag ---------->
<form action="./nlt" method="post">
<!-- <input type="hidden" name="page" value="PersonUpdatePage"/>  -->
<div class="container register">
                <div class="row">
                    <div class="col-md-3 register-left">
                        <img src="https://image.ibb.co/n7oTvU/logo_white.png" alt=""/>
                        <h3>NLT Infotech Pvt Ltd</h3>
                        <p>Works Like A Dream
                        <br>
                        Login:<%=session.getAttribute("LoginName") %>
                        Your IP:<%=session.getAttribute("Ip") %>>
                        </p>
                    </div>
                    <div class="col-md-9 register-right">
                        <ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Employee</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Hirer</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <h3 class="register-heading">Person Registration : Update</h3>
                                <div class="row register-form">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                          <input type="hidden" name="page" value="PersonUpdatePage" />
                                          <input type="hidden" name="id" value="<%=request.getParameter("id")%>"/>
                                            <input type="text" class="form-control" placeholder="Full Name *" name="fname" value="<%=request.getParameter("name")%>" />
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Person Age *" name="age" value="<%=request.getParameter("age")%>"/>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Phone No *" name="phone" value="<%=request.getParameter("phone")%>"/>
                                        </div>
                                        <div class="form-group">
                                            <div class="maxl">
                                                <label class="radio inline"> 
                                                    <input type="radio" name="gender" value="male" <%=request.getParameter("gender").equals("male")?"checked":""%>>
                                                    <span> Male </span> 
                                                </label>
                                                <label class="radio inline"> 
                                                    <input type="radio" name="gender" value="female" <%=request.getParameter("gender").equals("female")?"checked":""%>>
                                                    <span>Female </span> 
                                                </label>
                                            </div>
                                        </div>
                                        <div>
                                         <a href="index3.jsp"><input type="button" class="btnRegister" value="Home" /></a>
                                            <input type="submit" class="btnRegister" value="UPDATE" />
                                        </div>
                                        
                                    </div>
                                    <div class="col-md-6">
                                        <table class="table">
                                        <thead>
                                        	<tr>                                       		
                                        		<th>NAME</th>
                                        		<th>AGE</th>
                                        		<th>PHONE</th>
                                        		<th>GENDER</th>
                                        	</tr>
                                        </thead>
                                        <tbody>	
     <%
    Statement smt=ParentInterface.con.createStatement();
	ResultSet rs=smt.executeQuery("select * from persons where status=1");	
	while(rs.next())
	{
	 %>	
	 <tr>
	       <td><a href="edit.jsp?id=<%= rs.getInt("id") %>&name=<%= rs.getString("name") %>&age=<%= rs.getInt("age") %>&phone=<%= rs.getString("phone") %>&gender=<%= rs.getString("gender") %>"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eyedropper" viewBox="0 0 16 16">
  <path d="M13.354.646a1.207 1.207 0 0 0-1.708 0L8.5 3.793l-.646-.647a.5.5 0 1 0-.708.708L8.293 5l-7.147 7.146A.5.5 0 0 0 1 12.5v1.793l-.854.853a.5.5 0 1 0 .708.707L1.707 15H3.5a.5.5 0 0 0 .354-.146L11 7.707l1.146 1.147a.5.5 0 0 0 .708-.708l-.647-.646 3.147-3.146a1.207 1.207 0 0 0 0-1.708l-2-2zM2 12.707l7-7L10.293 7l-7 7H2v-1.293z"/>
</svg></a>&nbsp;&nbsp;&nbsp;&nbsp;

<a href="delete.jsp?id=<%= rs.getInt("id") %>&name=<%= rs.getString("name") %>&age=<%= rs.getInt("age") %>&phone=<%= rs.getString("phone") %>&gender=<%= rs.getString("gender") %>"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
  <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5Zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6Z"/>
  <path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1ZM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118ZM2.5 3h11V2h-11v1Z"/>
</svg></a>&nbsp;&nbsp;&nbsp;&nbsp;<%= rs.getString("name") %></td>
        <td><%= rs.getInt("age") %></td> 
	      <td><%= rs.getString("phone") %></td>    
	       <td><%= rs.getString("gender") %></td> 
	 </tr>
	 <% 
	}
		rs.close();
		smt.close();
     %>
     </tbody> 
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade show" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                <h3  class="register-heading">Apply as a Hirer</h3>
                                <div class="row register-form">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="First Name *" value="" />
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Last Name *" value="" />
                                        </div>
                                        <div class="form-group">
                                            <input type="email" class="form-control" placeholder="Email *" value="" />
                                        </div>
                                        <div class="form-group">
                                            <input type="text" maxlength="10" minlength="10" class="form-control" placeholder="Phone *" value="" />
                                        </div>


                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="password" class="form-control" placeholder="Password *" value="" />
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control" placeholder="Confirm Password *" value="" />
                                        </div>
                                        <div class="form-group">
                                            <select class="form-control">
                                                <option class="hidden"  selected disabled>Please select your Sequrity Question</option>
                                                <option>What is your Birthdate?</option>
                                                <option>What is Your old Phone Number</option>
                                                <option>What is your Pet Name?</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="`Answer *" value="" />
                                        </div>
                                        <input type="submit" class="btnRegister"  value="Register"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            </form>
</body>
</html>