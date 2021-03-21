<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%@ page import="org.json.simple.*" %>
<%@ page import="org.json.simple.parser.*" %>
<%@ page import="java.io.FileReader" %>
<%@ page import="org.json.simple.parser.ParseException" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.ArrayList" %>

<html>
    <head>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width">
        <link rel="stylesheet" href="styles2.css">
        <title>LinkedOut</title>
    </head>
    <body id="home-background">
        <ul id="navigation-bar">
            <li class="nav-item"><a class="nav-link" id="item1" href="index.html">Student Connect</a></li>
            <li class="nav-item"><a class="nav-link" id="item2" href="you.html">You</a></li>
            <li class="nav-item"><a class="nav-link" id="item3" href="people.jsp">People</a></li>
            <li class="nav-item"><a class="nav-link" id="item4" href="explore.jsp">Explore</a></li>
        </ul>
            

        <input type="text" id="contacts-input" onkeyup="findName()" placeholder="Search for names..">
           
        <%!JSONParser parser = new JSONParser(); %>
        	
      	<% JSONArray database; 

      		try {
      			database = (JSONArray) parser.parse(new FileReader("C:/Users/varun/Documents/eclipse-workspace/StudentConnector/Database/users.json"));
      		} 
      		catch (IOException | ParseException e) {database = null;}
      		
      		JSONObject thisUser = (JSONObject) database.get(0);
      		
      		ArrayList<String> friends = new ArrayList<String>();
    		JSONArray friendsJSON = (JSONArray) thisUser.get("friends");
    		for (int w = 0; w < friendsJSON.size(); w++) {
    			friends.add((String) friendsJSON.get(w));
    		}
        		
		%>
           
        <table id="contacts">
            <tr id="contacts-header">
                <th style="width:36%;">Name</th>
                <th style="width:64%;">Communication</th>
            </tr>
            <tr>
                <td> <% out.println(friends.get(0)); %> </td>
                <td><a href="https://hangouts.google.com/" target="_blank"><img class = "chatImg" alt="Hangouts Image" src ="chat.png"></a><a href="https://mail.google.com/mail/u/0/#inbox" target="_blank"><img class = "mailImg" alt="Gmail Image" src ="email.png"></a><a href="https://meet.google.com/new" target="_blank"><img class = "duoImg" alt="Gmail Image" src ="duo.png"></a></td>
            </tr>
            <tr>
                <td><% out.println(friends.get(1)); %></td>
                <td><a href="https://hangouts.google.com/" target="_blank"><img class = "chatImg" alt="Hangouts Image" src ="chat.png"></a><a href="https://mail.google.com/mail/u/0/#inbox" target="_blank"><img class = "mailImg" alt="Gmail Image" src ="email.png"></a><a href="https://meet.google.com/new" target="_blank"><img class = "duoImg" alt="Gmail Image" src ="duo.png"></a></td>
            </tr>
            <tr>
                <td><% out.println(friends.get(2)); %></td>
                <td><a href="https://hangouts.google.com/" target="_blank"><img class = "chatImg" alt="Hangouts Image" src ="chat.png"></a><a href="https://mail.google.com/mail/u/0/#inbox" target="_blank"><img class = "mailImg" alt="Gmail Image" src ="email.png"></a><a href="https://meet.google.com/new" target="_blank"><img class = "duoImg" alt="Gmail Image" src ="duo.png"></a></td>
            </tr>
            <tr>
                <td><% out.println(friends.get(3)); %></td>
                <td><a href="https://hangouts.google.com/" target="_blank"><img class = "chatImg" alt="Hangouts Image" src ="chat.png"></a><a href="https://mail.google.com/mail/u/0/#inbox" target="_blank"><img class = "mailImg" alt="Gmail Image" src ="email.png"></a><a href="https://meet.google.com/new" target="_blank"><img class = "duoImg" alt="Gmail Image" src ="duo.png"></a></td>
            </tr>
            <tr>
                <td><% out.println(friends.get(4)); %></td>
                <td><a href="https://hangouts.google.com/" target="_blank"><img class = "chatImg" alt="Hangouts Image" src ="chat.png"></a><a href="https://mail.google.com/mail/u/0/#inbox" target="_blank"><img class = "mailImg" alt="Gmail Image" src ="email.png"></a><a href="https://meet.google.com/new" target="_blank"><img class = "duoImg" alt="Gmail Image" src ="duo.png"></a></td>
            </tr>
            <tr>
                <td><% out.println(friends.get(5)); %></td>
                <td><a href="https://hangouts.google.com/" target="_blank"><img class = "chatImg" alt="Hangouts Image" src ="chat.png"></a><a href="https://mail.google.com/mail/u/0/#inbox" target="_blank"><img class = "mailImg" alt="Gmail Image" src ="email.png"></a><a href="https://meet.google.com/new" target="_blank"><img class = "duoImg" alt="Gmail Image" src ="duo.png"></a></td>
            </tr>
            
        </table>

        <script>
            function findName() {
              var input, filter, table, tr, td, txtValue;
              input = document.getElementById("contacts-input");
              filter = input.value.toUpperCase();
              table = document.getElementById("contacts");
              tr = table.getElementsByTagName("tr");
            
              for (var i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[0];
                if (td) {
                  txtValue = td.textContent || td.innerText;
                  if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                  } else {
                    tr[i].style.display = "none";
                  }
                }
              }
            }
        </script>

  	</body>

</html>