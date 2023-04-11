<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.PrintWriter" %>
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
    <link rel="stylesheet" href="admin.css">
    <title>Admin/Staff</title>
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
        <a href="#"> <img class="btn"  src="seewans.png" alt="" width="72" height="57"> </a>
          <a class="navbar-brand" href="#"><h2>Seewans Bakery</h2></a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link active " aria-current="page" href="#">Admin Dashboard</a>
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
        <div class="content py-3">
    <div class="card rounded-0 shadow">
        <div class="card-body">
            <h3>Seewans Bakery</h3>
            <hr>
            <div class="col-12">
                <div class="row gx-3 row-cols-4">
                <div class="col">
                        <div class="card text-dark">
                            <div class="card-body">
                                <div class="w-100 d-flex align-items-center">
                                    <div class="col-auto pe-1">
                                        <span class="fa fa-th-list fs-3 text-primary"></span>
                                    </div>
                                    <div class="col-auto flex-grow-1">
                                        <div class="fs-8"><b>Available Categories</b></div>
                                        <div class="fs-10 text-end fw-bold">
                                        	<%
												try
												{
													Class.forName("com.mysql.cj.jdbc.Driver");
													Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/bakery","root","");
													Statement statement = connection.createStatement();
													String query = "select Count(*) from tblcategory";
													ResultSet set = statement.executeQuery(query);
													String Countrow="";
													while(set.next())
													{
														Countrow = set.getString(1);
													    out.print(Countrow);													    
													}
			                					}
			                	               	catch(Exception e)
			                					{
			                						System.out.print(e);
			                					}
											%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card text-dark">
                            <div class="card-body">
                                <div class="w-100 d-flex align-items-center">
                                    <div class="col-auto pe-1">
                                        <span class="fas fa-shopping-bag fs-3 text-secondary"></span>
                                    </div>
                                    <div class="col-auto flex-grow-1">
                                        <div class="fs-8"><b>Number of Products Ordered</b></div>
                                        <div class="fs-10 text-end fw-bold">
                                        <%
												try
												{
													Class.forName("com.mysql.cj.jdbc.Driver");
													Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/bakery","root","");
													Statement statement = connection.createStatement();
													String query = "select sum(ord_qty) from tblord";
													ResultSet set1 = statement.executeQuery(query);
													String sumst="";
													while(set1.next())
													{
														sumst = set1.getString(1);
													    out.print(sumst);													    
													}
			                					}
			                	               	catch(Exception e)
			                					{
			                						System.out.print(e);
			                					}
											%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card text-dark">
                            <div class="card-body">
                                <div class="w-100 d-flex align-items-center">
                                    <div class="col-auto pe-1">
                                        <span class="fa fa-file-alt fs-3 text-info"></span>
                                    </div>
                                    <div class="col-auto flex-grow-1">
                                        <div class="fs-8"><b>Total Stocks</b></div>
                                        <div class="fs-10 text-end fw-bold">
                                        <%
												try
												{
													Class.forName("com.mysql.cj.jdbc.Driver");
													Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/bakery","root","");
													Statement statement = connection.createStatement();
													String query = "select sum(avl_stock) from tblstock";
													ResultSet set1 = statement.executeQuery(query);
													String sumst="";
													while(set1.next())
													{
														sumst = set1.getString(1);
													    out.print(sumst);													    
													}
			                					}
			                	               	catch(Exception e)
			                					{
			                						System.out.print(e);
			                					}
											%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card text-dark">
                            <div class="card-body">
                                <div class="w-100 d-flex align-items-center">
                                    <div class="col-auto pe-1">
                                        <span class="fa fa-coins fs-3 text-warning"></span>
                                    </div>
                                    <div class="col-auto flex-grow-1">
                                        <div class="fs-8"><b>Total Sales</b></div>
                                        <div class="fs-10 text-end fw-bold">
                                        <%
												try
												{
													Class.forName("com.mysql.cj.jdbc.Driver");
													Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/bakery","root","");
													Statement statement = connection.createStatement();
													String query = "select sum(od_total) from tblorderdetail";
													ResultSet set1 = statement.executeQuery(query);
													String sumst="";
													while(set1.next())
													{
														sumst = set1.getString(1);
													    out.print(sumst);													    
													}
			                					}
			                	               	catch(Exception e)
			                					{
			                						System.out.print(e);
			                					}
											%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="col-12">
                        <h3>Top 7 Orders Detail</h3>
                        <hr>
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
                            <%
												try
												{
													Class.forName("com.mysql.cj.jdbc.Driver");
													Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/bakery","root","");
													Statement statement = connection.createStatement();
													String query = "SELECT * FROM tblord ORDER BY ord_qty desc LIMIT 7";
													ResultSet set1 = statement.executeQuery(query);
													
													while(set1.next())
													{%>
														<tr>
				                                        <td class="td py-0 px-1"><%out.print(set1.getString("u_id")); %></td>
				                                        <td class="td py-0 px-1"><%out.print(set1.getString("ord_name")); %></td>
				                                        <td class="td py-0 px-1"><center><img src="<%out.print(set1.getString("ord_image")); %>" style="width: 200px; height: 200px;"></center></td>
				                                        <td class="td py-0 px-1"><%out.print(set1.getString("ord_price")); %></td>
				                                        <td class="td py-0 px-1"><%out.print(set1.getString("ord_qty")); %></td>
				                                        
				                                        <%
				                                        	int q = set1.getInt("ord_qty");
				                                        	int p = set1.getInt("ord_price");
				                                        	int t = q *p;
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
            </div>
        </div>
    </div>
</div>
    <script src="https://kit.fontawesome.com/96531cd29f.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>
  </body>
</html>