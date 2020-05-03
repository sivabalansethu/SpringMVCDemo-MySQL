# SpringMVCDemo-MySQL
Spring MVC Demo with MySQL DB Connectivity

Step #1: Create Maven Project, copy folders. Build Maven. 
Stap #2: Create Tomcat server, change the server timeout, select option 'Use Tomcat installation (takes control of Tomcat installation) under Server Location, Add in tomcat-users.xml - <role rolename="manager-gui"/>
<user username="tomcat" password="tomcat" roles="manager-gui"/>.

Step #3: Start the Tomcat Server, http://localhost:8080/manager-gui , Remove or Add the 'Demo-App' Project. 
Step #4: Hit the page, http://localhost:8080/Demo-App/person.jsp
        Here we can Add the products and view the products.
