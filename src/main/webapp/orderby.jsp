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
	String i = request.getParameter("id");
%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="admin.css">
    <title>Orders</title>
    <link rel="stylesheet" href="./Font-Awesome-master/css/all.min.css">
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./select2/css/select2.min.css">
    <script src="./Font-Awesome-master/js/all.min.js"></script>
    <style>
        :root{
            --bs-success-rgb:71, 222, 152 !important;
        }
        html,body{
            height:100%;
            width:100%;
        }
        @media screen{
            body{
                background-size:cover;
                background-repeat:no-repeat;
                background-position:center center;
                backdrop-filter: brightness(0.7);
            }
        }
        main{
            height:100%;
            display:flex;
            flex-flow:column;
        }
        #page-container{
            flex: 1 1 auto; 
            overflow:auto;
        }
        #topNavBar{
            flex: 0 1 auto; 
        }
        .thumbnail-img{
            width:50px;
            height:50px;
            margin:2px
        }
        .truncate-1 {
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 1;
            -webkit-box-orient: vertical;
        }
        .truncate-3 {
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
        }
        .modal-dialog.large {
            width: 80% !important;
            max-width: unset;
        }
        .modal-dialog.mid-large {
            width: 50% !important;
            max-width: unset;
        }
        @media (max-width:720px){
            
            .modal-dialog.large {
                width: 100% !important;
                max-width: unset;
            }
            .modal-dialog.mid-large {
                width: 100% !important;
                max-width: unset;
            }  
        
        }
        .display-select-image{
            width:60px;
            height:60px;
            margin:2px
        }
        img.display-image {
            width: 100%;
            height: 45vh;
            object-fit: cover;
            background: black;
        }
        /* width */
        ::-webkit-scrollbar {
        width: 5px;
        }

        /* Track */
        ::-webkit-scrollbar-track {
        background: #f1f1f1; 
        }
        
        /* Handle */
        ::-webkit-scrollbar-thumb {
        background: #888; 
        }

        /* Handle on hover */
        ::-webkit-scrollbar-thumb:hover {
        background: #555; 
        }
        .img-del-btn{
            right: 2px;
            top: -3px;
        }
        .img-del-btn>.btn{
            font-size: 10px;
            padding: 0px 2px !important;
        }
    </style>
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
                <a class="nav-link" href="customer.jsp">Customer</a>
              </li>
            </ul>
            <a href="logout.jsp"><button class="btn btn-outline-warning" type="submit">Logout</button></a>
        </div>
        </div>
</nav>
<div class="card rounded-0 shadow">
    <div class="card-header d-flex justify-content-between">
        <h3 class="card-title">Placed Orders by user <%=i%></h3>
        <div class="card-tools align-middle">
            <a href="orders.jsp"><button class="btn btn-dark btn-sm py-1 rounded-0" type="button" id="create_new">Back to Dashboard</button></a>
        </div>
    </div>
    <div class="card-body">
        <table class="table table-striped table-hover table-bordered" id="inventory">
                            <colgroup>
                                <col width="10%">
                                <col width="20%">
                                <col width="20%">
                                <col width="20%">
                                <col width="20%">
                                <col width="10%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th class="py-0 px-1">User ID</th>
                                    <th class="py-0 px-1">Product Name</th>
                                    <th class="py-0 px-1">Product Image</th>
                                    <th class="py-0 px-1">Product Price</th>
                                    <th class="py-0 px-1">Product Quantity</th>
                                    <th class="py-0 px-1">Total</th>
                                </tr>
                            </thead>
                            <tbody>
                            <%@page import="java.sql.*, java.io.*" %>
                            <%
							try
							{
								Class.forName("com.mysql.cj.jdbc.Driver");
								Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/bakery","root","");
								Statement statement = connection.createStatement();
								String query = "select * from tblord where u_id = '"+i+"'";
								ResultSet set = statement.executeQuery(query);
								while(set.next())
								{%>
		                            <tr>
                                        <td class="td py-0 px-1"><%out.print(set.getString("u_id"));%></td>
                                        <td class="td py-0 px-1"><%out.print(set.getString("ord_name"));%></td>
                                        <td class="td py-0 px-1"><center><img src="<%out.print(set.getString("ord_image"));%>" style="width: 200px; height: 200px;"></center></td>
                                        <td class="td py-0 px-1"><%out.print(set.getString("ord_price"));%></td>
                                        <td class="td py-0 px-1"><%out.print(set.getString("ord_qty"));%></td>
                                        <%
                                        	int q = set.getInt("ord_qty");
                                        	int p = set.getInt("ord_price");
                                        	int t = q*p;
                                        %>
                                        <td class="td py-0 px-1 text-end"><%=t%></td>
                                    </tr>
                                    <%}
							     }
							     catch(Exception e)
							     {
							        System.out.print(e);
							     }
							%>
                            </tbody>
        </table>
    </div>
</div>
    <script src="https://kit.fontawesome.com/96531cd29f.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>
    </body>
</html>