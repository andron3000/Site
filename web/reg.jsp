
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Registration</title>

  <script type="text/javascript">
    function validate_input() {
      var x = document.forms["myForm"]["name"].value;
      var y = document.forms["myForm"]["password"].value;

      if ((x == null || x == "")) {
        alert("Fill field name is required.");
        return false;
      }

      if ((y == null || y == "")) {
        alert("Fill field password is required.");
        return false;
      }
    }
  </script>
</head>
<body>

<form name ="myForm" method="post" action="com.chekhovych.Add_User" onsubmit="return validate_input()">
  <center>
    <table border="1" width="30%" cellpadding="5">
      <thead>
      <tr>
        <th colspan="2">Enter Information Here</th>
      </tr>
      </thead>
      <tbody>

        <td>User Name</td>
        <td><input type="text" name="name" value="" /></td>
      </tr>
      <tr>
        <td>Password</td>
        <td><input type="password" name="password" value="" /></td>
      </tr>
      <tr>
        <td><input type="submit" value="Submit" /></td>
        <td><input type="reset" value="Reset" /></td>
      </tr>
      <tr>
        <td colspan="2">If already registered : <a href="login.jsp"> Login Here</a></td>
      </tr>
      </tbody>
    </table>
  </center>
</form>
<tr>
  <center>
    <%
      String ans=(String)request.getAttribute("flag");
      if(ans!=null) {
        out.println("<font color=red size=4px>" + ans + "</font>");
      }
    %>
  </center>
</tr>
<div>
  <center>
    <style>
      body {
        background: url("http://www.slashdiabetes.com/wp-content/uploads/Winter-Snowman-1.jpg") no-repeat;
        background-size: 100%;
      }
    </style>
    </head>
    <%--<img src = "http://images.all-free-download.com/images/graphiclarge/christmas_bauble_and_green_branches_187535.jpg">--%>
  </center>
</div>
</body>
</html>
