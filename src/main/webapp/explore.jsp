<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>

<%@ page import="java.io.FileReader" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.parser.JSONParser" %>

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
    
    
    <%!
    
    	public int[] calcOutput (ArrayList<String> interests) {
		
		
			int[] output = {0,0,0,0};
		
			HashMap<String, Integer> mathValues = new HashMap<String, Integer>();
		
			mathValues.put("Math", 3);
			mathValues.put("Physics", 2);
			mathValues.put("Engineering", 2);
			mathValues.put("Economics", 2);
			mathValues.put("Chemistry", 1);
		
			HashMap<String, Integer> scienceValues = new HashMap<String, Integer>();
		
			scienceValues.put("Biology", 2);
			scienceValues.put("Science", 3);
			scienceValues.put("Engineering", 2);
			scienceValues.put("Physics", 2);
			scienceValues.put("Chemistry", 2);
			scienceValues.put("Psychology", 1);
			scienceValues.put("Space", 2);
		
			HashMap<String, Integer> humanitiesValues = new HashMap<String, Integer>();
		
			humanitiesValues.put("Economics", 1);
			humanitiesValues.put("Linguistics", 2);
			humanitiesValues.put("History", 3);
			humanitiesValues.put("Archaeology", 2);
			humanitiesValues.put("Politics", 3);
			humanitiesValues.put("Psychology", 2);
			
			HashMap<String, Integer> sportsValues = new HashMap<String, Integer>();
		
			sportsValues.put("Basketball", 3);
			sportsValues.put("Soccer", 3);
			sportsValues.put("Lacrosse", 3);
			sportsValues.put("Football", 3);
			sportsValues.put("Baseball", 3);
			sportsValues.put("Tennis", 3);
	
		
			for (String interest: interests) {
				
				output[0] += mathValues.get(interest) == null ? 0 : mathValues.get(interest);
				output[1] += scienceValues.get(interest) == null ? 0 : scienceValues.get(interest);
				output[2] += humanitiesValues.get(interest) == null ? 0 : humanitiesValues.get(interest);
				output[3] += sportsValues.get(interest) == null ? 0 : sportsValues.get(interest);
			}
		
			return output;
		}
    %>
    
    <%!JSONParser parser = new JSONParser(); %>
	<%!JSONArray database; %>
	<%
	
	try {
		database = (JSONArray) parser.parse(new FileReader("C:/Users/varun/Documents/eclipse-workspace/StudentConnector/Database/users.json"));
	} 
	catch (IOException | org.json.simple.parser.ParseException e) {database = null;}
	%>
	
    
    <%!
   		
    	public ArrayList<String> orderUsers(){
		
		
			HashMap<String, Integer> allUsers = new HashMap<String, Integer>();
		
			//loop thru all users
			for (int i = 1; i < database.size(); i++) {
			
				JSONObject user = (JSONObject) database.get(i);
				
				ArrayList<String> interests = new ArrayList<String>();
    			JSONArray interestsJSON = (JSONArray) user.get("interests");
    			for (int i1 = 0; i1 < interestsJSON.size(); i1++) {
    				interests.add((String) interestsJSON.get(i1));
    			}
			
    			int[] output = calcOutput(interests);
    		
    			allUsers.put((String) user.get("userID"), output[0] + output[1]);
			}
		
			ArrayList<String> sortedKeys = new ArrayList<String>();
		
			int x = 0; 
			String max = "";
		
			for (String userID: allUsers.keySet()) {
			
				sortedKeys.add(userID);
			
				if (allUsers.get(userID) >= x) {
					max = userID;
					x = allUsers.get(userID);
				}
			}
			sortedKeys.remove(max);
		
			String min = "";
			for (String userID: allUsers.keySet()) {
				
				if (allUsers.get(userID) <= x) {
					min = userID;
					x = allUsers.get(userID);
				}	
			}
			sortedKeys.remove(min);
			
			sortedKeys.add(0, max);
			sortedKeys.add(min);
		
			return sortedKeys;
   		}
    %>
    
    <%!
    
    	public JSONObject getMatchJSON(String userID){
    	
    		for (int i = 0; i < database.size(); i ++) {
    			if (((String)(((JSONObject)(database.get(i))).get("userID"))).equals(userID)){
    				return (JSONObject)(database.get(i));
    			}
    		}
    		return new JSONObject();
    	}
    
    %>
    <%! int m = 0; %>
    
    <script> var pic = 0; </script>
    	
    
        <ul id="navigation-bar">
            <li class="nav-item"><a class="nav-link" id="item1" href="index.html">Student Connect</a></li>
            <li class="nav-item"><a class="nav-link" id="item2" href="you.html">You</a></li>
            <li class="nav-item"><a class="nav-link" id="item3" href="people.jsp">People</a></li>
            <li class="nav-item"><a class="nav-link" id="item4" href="explore.jsp">Explore</a></li>
        </ul>
        
        <div id="ignoreButton">
            <button type="button" onclick="changeMatch(pic)"><img src="arrow_backward.png" title="Ignore" alt="Ignore Contact Button"></button>
        </div>
        <p id="ignoreButtonText">Ignore Contact</p>

        <div id="addContactButton">
            <button type="button" onclick="changeMatch(pic)"><img src="arrow_forward.png" title="Add Contact" alt="Add Contact Button"></button>
        </div>
        <p id="addContactButtonText">Add Contact</p>


		<%!
			public ArrayList<String> interestsList(int user){
				JSONArray interestsJSON = (JSONArray) getMatchJSON(orderUsers().get(user)).get("interests");
				ArrayList<String> interests = new ArrayList<String>();
				for (int i = 0; i < interestsJSON.size(); i++) {
					interests.add((String) interestsJSON.get(i));
				}
			System.out.println(interests);
			return interests;		
		}
		%>

        <div id="profileBackground">
            <p id="profileTitle"><%=getMatchJSON(orderUsers().get(0)).get("name") %></p>
            <p id="profileAge"><%=getMatchJSON(orderUsers().get(0)).get("age") %></p>
            <p id="profileEducation"><%=getMatchJSON(orderUsers().get(m)).get("education") %></p>
            <p id="profileJob"><%=getMatchJSON(orderUsers().get(0)).get("workplace") %></p>
            <img id="profileImage" src=<%="C:/Users/varun/Documents/eclipse-workspace/StudentConnector/Database/Profiles/" + (String)(getMatchJSON(orderUsers().get(0)).get("image"))%> alt="Contact Profile Picture">
            <p id="bioTitle">Bio</p>
            <p id="bioText"><%=getMatchJSON(orderUsers().get(0)).get("bio") %></p>
            <p id="skillsTitle">Skills</p>
            <p id="skillsText"><%=getMatchJSON(orderUsers().get(0)).get("skills") %></p>
            <p id="intrestsTitle">Intrests</p>
            <div id="intrest1">
                <p id="intrestText1"><%=interestsList(0).get(0) %></p>
            </div>
            <div id="intrest2">
                <p id="intrestText2"><%=interestsList(0).get(1) %></p>
            </div>
            <div id="intrest3">
                <p id="intrestText3"><%=interestsList(0).get(2) %></p>
            </div>
            <p id="moreInfoTitle">More Info</p>
            <p id="moreInfoText"><%=getMatchJSON(orderUsers().get(0)).get("more info") %></p>   
        </div>

            
          
		<script>
    	function changeMatch(userNumber){
    		
    		if (pic == 0){
    		
    			document.getElementById("profileTitle").innerHTML = "<%=getMatchJSON(orderUsers().get(1)).get("name") %>";
    			document.getElementById("profileAge").innerHTML = "<%=getMatchJSON(orderUsers().get(1)).get("age") %>";
    			document.getElementById("profileEducation").innerHTML = "<%=getMatchJSON(orderUsers().get(1)).get("education") %>";
    			document.getElementById("profileJob").innerHTML = "<%=getMatchJSON(orderUsers().get(1)).get("workplace") %>";
    			document.getElementById("profileImage").src = "<%="C:/Users/varun/Documents/eclipse-workspace/StudentConnector/Database/Profiles/" + (String)(getMatchJSON(orderUsers().get(1)).get("image"))%>";
    			document.getElementById("bioText").innerHTML = "<%=getMatchJSON(orderUsers().get(1)).get("bio") %>";
    			document.getElementById("skillsText").innerHTML = "<%=getMatchJSON(orderUsers().get(1)).get("skills") %>";
    			document.getElementById("moreInfoText").innerHTML = "<%=getMatchJSON(orderUsers().get(1)).get("more info") %>";
    		
    			document.getElementById("intrestText1").innerHTML = "<%=interestsList(1).get(0) %>";
    			document.getElementById("intrestText2").innerHTML = "<%=interestsList(1).get(1) %>";
    			document.getElementById("intrestText3").innerHTML = "<%=interestsList(1).get(2) %>";

    		}
    		
    		if (pic == 1){
        		
    			document.getElementById("profileTitle").innerHTML = "<%=getMatchJSON(orderUsers().get(2)).get("name") %>";
    			document.getElementById("profileAge").innerHTML = "<%=getMatchJSON(orderUsers().get(2)).get("age") %>";
    			document.getElementById("profileEducation").innerHTML = "<%=getMatchJSON(orderUsers().get(2)).get("education") %>";
    			document.getElementById("profileJob").innerHTML = "<%=getMatchJSON(orderUsers().get(2)).get("workplace") %>";
    			document.getElementById("profileImage").src = "<%="C:/Users/varun/Documents/eclipse-workspace/StudentConnector/Database/Profiles/" + (String)(getMatchJSON(orderUsers().get(2)).get("image"))%>";
    			document.getElementById("bioText").innerHTML = "<%=getMatchJSON(orderUsers().get(2)).get("bio") %>";
    			document.getElementById("skillsText").innerHTML = "<%=getMatchJSON(orderUsers().get(2)).get("skills") %>";
    			document.getElementById("moreInfoText").innerHTML = "<%=getMatchJSON(orderUsers().get(2)).get("more info") %>";
    		
    			document.getElementById("intrestText1").innerHTML = "<%=interestsList(2).get(0) %>";
    			document.getElementById("intrestText2").innerHTML = "<%=interestsList(2).get(1) %>";
    			document.getElementById("intrestText3").innerHTML = "<%=interestsList(2).get(2) %>";
    		
    		}
    		
    		pic = pic + 1;
    		
    		
  		}
    
   		</script> 



    </body>
</html>