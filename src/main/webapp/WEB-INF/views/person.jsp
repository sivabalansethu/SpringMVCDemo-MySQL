<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>

<head>
	<title>Product Page</title>
	<style type="text/css">
		.tg {
			border-collapse: collapse;
			border-spacing: 0;
			border-color: #ccc;
		}

		.tg td {
			font-family: Arial, sans-serif;
			font-size: 14px;
			padding: 10px 5px;
			border-style: solid;
			border-width: 1px;
			overflow: hidden;
			word-break: normal;
			border-color: #ccc;
			color: #333;
			background-color: #fff;
		}

		.tg th {
			font-family: Arial, sans-serif;
			font-size: 14px;
			font-weight: normal;
			padding: 10px 5px;
			border-style: solid;
			border-width: 1px;
			overflow: hidden;
			word-break: normal;
			border-color: #ccc;
			color: #333;
			background-color: #f0f0f0;
		}

		.tg .tg-4eph {
			background-color: #f9f9f9
		}
	</style>
	<!-- <link rel="stylesheet" href="bootstrap.css"> -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body>
	<div class="container-fluid">
				<!-- Navbar content -->
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
				<!-- <img src="/resources/images/home1.jpg" height="50px;" width="50px;"> -->
				<h2  style="color: yellow; margin-left: 5px;" >Smart Homes</h2>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item" style="cursor: pointer;">
						<a class="nav-link btn btn-sm" id="openjsbutton" type="button" 
						 style="background-color: rgb(219, 219, 50); color: black;" >Home</a>
					</li>
					</li>
					<li class="nav-item " style="cursor: pointer;">
						<a class="nav-link btn btn-sm"  type="button" id="Convert"  style="background-color: rgb(219, 219, 50); color: black;margin-left: 5px;">views</a>
					</li>
				</ul>
			</nav>
			<!--End of Navbar-->
	
	
		 <div class="card bg-dark text-white">
			<div class="card-body">
				<div class="row">
					<div class="col-md-12">
						<h3 >
							Add Product
						</h3>
						<div class="card text-dark">
							<div class="card-body">
								
								<c:url var="addAction" value="/person/add"></c:url>

								<form:form action="${addAction}" commandName="listPersons">
									<table>
										<tr>
											 <div class="form-group">
													<label for="ProductId">Product ID</label>
													<input type="text" class="form-control" id="ProductId" name="productId"
														placeholder="Enter ProductID">
											  </div>
										</tr>
										<tr>
											<div class="form-group">
												<label for="ProductName">Name</label>
												<input type="text" class="form-control" id="ProductName" name="name" placeholder="Enter Name">
										  </div>
										</tr>
										<tr>
											<div class="form-group">
												<label for="Description">Description</label>
												<input type="text" class="form-control" id="Description" name="description" placeholder="Enter Description">
										  </div>
										</tr>
										<tr>
											<td colspan="2">
												<c:if test="${empty person.name}">
													<input type="submit" value="Add Product" class="btn btn"  style="background-color: rgb(219, 219, 50); color: black;"/>
												</c:if>
											</td>
										</tr>
									</table>
								</form:form>
							</div>
						</div>						
						<br>
						<h3 >Products List</h3>
						
						<c:if test="${!empty listPersons}">

							<table class="table table-bordered table-light">
								<thead class="" >
								<tr>
									<th width="80">Product ID</th>
									<th width="120">Product Name</th>
									<th width="120">Product Description</th>
								</tr>
							   </thead>
							   <tbody>
								<c:forEach items="${listPersons}" var="person">
									
									<tr>
										<td>${person.productId}</td>
										<td>${person.name}</td>
										<td>${person.description}</td>
									</tr>
								</c:forEach>
							</tbody>
							</table>
						</c:if>
					</div>
				</div>
			</div>
			<div class="card-footer">
				<div class="row">
					<div class="col-sm-3">
						<div class="text-center">
							<h5>World</h5>
							<p>India<br>
							   Australia<br>
							   South Africa<br>
							   New zealand<br>
							   UK<br>
							   USA</p>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="text-center">
						<h5>Business</h5>
						<p>Tech<br>
						   Construction<br>
						   Marketing<br></p>
						   </div>
					</div>
					<div class="col-sm-3">
						<div class="text-center">
						<h5>Customer Service</h5>
						<p>Help&FAQs<br>
						   Check Order Status<br>
						   Order Cancellation<br>
						   Returns<br>
						</p>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="text-center">
						<h5>About us</h5>
						<p>Carrers<br>
						   Corporate Information<br>
						   Corporate Responsibilities<br>
						</p>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<div class="text-center">
							<p>© 2000-2020 Smart Homes Authority, LLC. All Rights Reserved. Use of this site is subject to certain Terms Of Use.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- <script type="text/javascript" src="bootstrap.js"></script> -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
     
</html>