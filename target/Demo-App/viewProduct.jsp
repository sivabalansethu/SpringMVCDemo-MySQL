   <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
  
<h1>Products List</h1>  
<table border="2" width="70%" cellpadding="2">  
<tr><th>Id</th><th>Name</th><th>Description</th></tr>  
   <c:forEach var="product" items="${list}">   
   <tr>  
   <td>${product.id}</td>  
   <td>${product.name}</td>  
   <td>${product.desc}</td>
<%--    <td><a href="editemp/${emp.id}">Edit</a></td> --%>  
   <td><a href="deleteProduct/${product.id}">Delete</a></td>  
   </tr>  
   </c:forEach>  
   </table>  
   <br/>  
   <a href="addProduct">Add New Employee</a>  