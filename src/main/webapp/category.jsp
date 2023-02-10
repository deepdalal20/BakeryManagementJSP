<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
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
    <title>Category</title>
    <link rel="stylesheet" href="./Font-Awesome-master/css/all.min.css">
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./select2/css/select2.min.css">
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
                <a class="nav-link active" aria-current="page" href="#"> Category</a>
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
<div class="card h-100 d-flex flex-column rounded-0 shadow">
    <div class="card-body flex-grow-1">
        <div class="col-12 h-90">
            <div class="row h-100">
                <div class="col-md-6 h-100 d-flex flex-column">
                    <div class="w-100 d-flex border-bottom border-dark py-1 mb-1">
                        <div class="fs-5 col-auto flex-grow-1"><b>Category List</b></div>
                        <div class="col-auto flex-grow-0 d-flex justify-content-end">
                            <a href="newcat.jsp" id="new_category" class="btn btn-dark btn-sm bg-gradient rounded-2" title="Add Category"><span class="fa fa-plus"></span></a>
                        </div>
                    </div>
                    <%@ page import="java.sql.*, java.io.PrintWriter" %>
					<%
						try
						{
							Class.forName("com.mysql.cj.jdbc.Driver");
							Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/bakery","root","");
							Statement statement = connection.createStatement();
							String query = "select * from tblcategory";
							ResultSet set = statement.executeQuery(query);
							while(set.next())
							{
							%>
                    <div class="h-100 overflow-auto border rounded-1 border-dark">
                        <ul class="list-group">
                            <li class="list-group-item d-flex">
                                <div class="col-auto flex-grow-1">
                                    <%out.print(set.getString(1)); %>
                                </div>
                                <div class="col-auto flex-grow-1">
                                    <%out.print(set.getString(2)); %>
                                </div>
                                <div class="col-auto d-flex justify-content-end">
                                    <a href="updatecat.jsp?id=<%out.print(set.getString(1)); %>" class="edit_category btn btn-sm btn-primary bg-gradient py-0 px-1 me-1" title="Edit Category Details"><span class="fa fa-edit"></span></a>
                                    <a href="deletecat.jsp?id=<%out.print(set.getString(1)); %>" class="delete_category btn btn-sm btn-danger bg-gradient py-0 px-1" title="Delete Category"><span class="fa fa-trash"></span></a>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <%
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

<script src="https://kit.fontawesome.com/96531cd29f.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>
  </body>
</html>