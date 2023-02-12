<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script>
  function updateTowns(state) {
    var towns = {
      "California": ["Los Angeles", "San Francisco", "San Diego"],
      "Texas": ["Houston", "Dallas", "Austin"],
      "New York": ["New York City", "Buffalo", "Rochester"],
    };
    var townSelect = document.getElementById("town");
    townSelect.innerHTML = "";
    for (var i = 0; i < towns[state].length; i++) {
      var townOption = document.createElement("option");
      townOption.value = towns[state][i];
      townOption.text = towns[state][i];
      townSelect.appendChild(townOption);
    }
  }
</script>
</head>
<body>
<%  %>
  <p>Select a state:
    <select id="state" onchange="updateTowns(this.value)">
      <option value="">Select a state</option>
      <option value="California">California</option>
      <option value="Texas">Texas</option>
      <option value="New York">New York</option>
    </select>
  </p>
  <p>Select a town:
    <select id="town">
      <option value="">Select a town</option>
    </select>
  </p>
</body>
</html>