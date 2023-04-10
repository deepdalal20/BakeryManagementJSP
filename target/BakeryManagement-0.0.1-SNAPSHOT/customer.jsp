<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
String ses = (String)session.getAttribute("asesid");
	if(ses == null)
	{
		response.sendRedirect("login.jsp");
	}
%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="staff.css">
    <title>Customer</title>
    <link rel="stylesheet" href="./Font-Awesome-master/css/all.min.css">
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./select2/css/select2.min.css">
  </head>
  <body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
        <a href="admin.jsp"> <img class="btn"  src="seewans.png" alt="" width="72" height="57"> </a>
          <a class="navbar-brand" href="admin.jsp"><h2>Seewans Bakery</h2></a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link" href="admin.jsp">Admin Dashboard</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="orders.jsp">Orders Details</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="category.jsp"> Category</a>
              </li>  
              <li class="nav-item">
                <a class="nav-link" href="edproduct.jsp"> Update Products</a>
              </li>  
              <li class="nav-item">
                <a class="nav-link" href="stock.jsp"> Update Stock</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="#">Customer</a>
              </li>
            </ul>
            <a href="logout.jsp"><button class="btn btn-outline-warning" type="submit">Logout</button></a>
          </div>
        </div>
</nav>

<div class="card rounded-0 shadow">
    <div class="card-header d-flex justify-content-between">
        <h3 class="card-title">Customer Details</h3>
    </div>
    <div class="card-body">
        <table class="table table-hover table-striped table-bordered">
            <colgroup>
                <col width="10%">
                <col width="25%">
                <col width="25%">
                <col width="20%">
                <col width="10%">
                <col width="10%">
            </colgroup>
            <thead>
                <tr>
                    <th class="text-center p-0">ID</th>
                    <th class="text-center p-0">Name</th>
                    <th class="text-center p-0">Email</th>
                    <th class="text-center p-0">Contact</th>
                    <th class="text-center p-0">Status</th>
                </tr>
            </thead>
            <%@ page import="java.sql.*, java.io.PrintWriter" %>
					<%
						try
						{
							String u = "customer";
							Class.forName("com.mysql.cj.jdbc.Driver");
							Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/bakery","root","");
							Statement statement = connection.createStatement();
							String query = "select * from tbluser where user = '"+u+"'";
							ResultSet set = statement.executeQuery(query);
							while(set.next())
							{
								String s = set.getString(7);
							%>
            <tbody>
                <tr>
                    <td class="py-0 px-1"><%out.print(set.getString(1)); %></td>
                    <td class="py-0 px-1"><%out.print(set.getString(2)); %></td>
                    <td class="py-0 px-1"><%out.print(set.getString(3)); %></td>
                    <td class="py-0 px-1"><%out.print(set.getString(5)); %></td>
                    <td class="py-0 px-1"><%out.print(s); %></td>
                    <th class="text-center py-0 px-1">
                        <div class="btn-group" role="group">
                        <%
                        	String st = "inactive";
                        	if (s.equals(st))
                        	{
                        		%>
                            <a href = "activeuser.jsp?id=<%out.print(set.getString(1)); %>"><button type="button" class="btn btn-primary btn-sm rounded-0 py-0" aria-expanded="false">
                            Activate
                            </button></a>
                            <%}
                            else
                            {
                            %>
                            	<a href = "inactiveuser.jsp?id=<%out.print(set.getString(1)); %>"><button type="button" class="btn btn-primary btn-sm rounded-0 py-0" aria-expanded="false">
                                Inactive
                                </button></a>
                           <%
                           }
                           %>
                        </div>
                    </th>
                </tr>
            </tbody>
            <%
						}
					}
	               	catch(Exception e)
					{
						System.out.print(e);
					}
					%>
        </table>
    </div>
</div>
      <script src="https://kit.fontawesome.com/96531cd29f.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>
</body>
</html>