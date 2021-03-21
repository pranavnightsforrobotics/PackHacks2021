<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.text.*,java.util.*" %>
<%@ page import="org.json.simple.*" %>
<%@ page import="org.json.simple.parser.*" %>
<%@ page import="java.io.FileReader" %>
<%@ page import="org.json.simple.parser.ParseException" %>
<%@ page import="java.io.IOException" %>

<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <title>BRUH</title>
</head>

<body>

	<%! String text = "hello"; %>

    <button type="button" onclick="change()">Click Me!</button>
    
    <p id="hee">  </p>
    
    <script>
    	function change(){
    		
    		document.getElementById("hee").innerHTML = "<%= text%>";
  		}
    
    </script>
    
</body>


</html>



