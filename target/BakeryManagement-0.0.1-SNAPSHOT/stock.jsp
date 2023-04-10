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
    <title>Stock</title>
    <link rel="stylesheet" href="./Font-Awesome-master/css/all.min.css">
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./select2/css/select2.min.css">
    <script src="./js/jquery-3.6.0.min.js"></script>
    <script src="./js/popper.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="./DataTables/datatables.min.css">
    <script src="./DataTables/datatables.min.js"></script>
    <script src="./select2/js/select2.full.min.js"></script>
    <script src="./Font-Awesome-master/js/all.min.js"></script>
    <script src="./js/script.js"></script>
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
                <a class="nav-link active" aria-current="page" href="#"> Update Stock</a>
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
        <h3 class="card-title">Stock List</h3>
    </div>
    <div class="card-body">
        <table class="table table-hover table-striped table-bordered">
            <colgroup>
                <col width="20%">
                <col width="15%">
                <col width="25%">
                <col width="10%">
                <col width="10%">
                <col width="10%">
            </colgroup>
            <thead>
                <tr>
                    <th class="text-center p-0">Product</th>
                    <th class="text-center p-0">Image</th>
                    <th class="text-center p-0">Category ID</th>
                    <th class="text-center p-0">Price</th>
                    <th class="text-center p-0">Available Stock</th>
                    <th class="text-center p-0">Action</th>
                </tr>
            </thead>
            <tbody>
            		<%@ page import="java.sql.*, java.io.PrintWriter" %>
					<%
						ResultSet set = null;
						Statement statement = null;
						Connection connection = null;
						try
						{
							Class.forName("com.mysql.cj.jdbc.Driver");
							connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/bakery","root","");
							statement = connection.createStatement();
							String query = "select * from tblproduct";
							set = statement.executeQuery(query);
							while(set.next())
							{
								String pid = set.getString("p_id");
							%>
                <tr>
                    <td class="p-0"><%out.print(set.getString("p_name")); %></td>
                    <td class="text-center py-0 px-1"><img src="<%out.print(set.getString("p_image")); %>"  style="width: 100px; height: 100px;"></td>
                    <td class="py-0 px-1"><%out.print(set.getString("category")); %></td>
                    <td class="py-0 px-1"><%out.print(set.getString("p_price")); %></td>    
		                    <%
		                    	Statement statement1 = connection.createStatement();
		                    	String query1 = "select * from tblstock where p_id = '"+pid+"'";
								ResultSet set1 = statement1.executeQuery(query1);
								if(set1.next())
								{
		                    %>  
                    <td class="py-0 px-1 text-end"><%out.print(set1.getString(3));%></td>
                    		<%	
                    			} 
								else
								{
									%>
									<td class="py-0 px-1 text-end">N/A</td>
									<%
								}
                    		%>
                    <td class="text-center py-0 px-1">
                        <div class="btn-group" role="group">
                            <a href="restock.jsp?pid=<%out.print(pid);%>"><input id="btnGroupDrop1" type="submit" value="Restock" class="btn btn-primary dropdown-toggle btn-sm rounded-0 py-0"></a>
                        </div>
                    </td>
                </tr>
		                <%
							}
						}		
						catch(Exception e)
						{
							System.out.print(e);
						}
						finally 
						{
						    try 
						    {
						      set.close();
						      statement.close();
						      connection.close();
						    } 
						    catch(Exception e)
						    {
						    	System.out.print(e);
						    }
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