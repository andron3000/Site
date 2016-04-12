package com.chekhovych;

import com.mysql.fabric.jdbc.FabricMySQLDriver;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.SecureRandom;
import java.sql.*;

public class Add_User extends HttpServlet {

    public static final String url = "jdbc:mysql://localhost:3306/Users";

    public static final String user = "root";

    public static final String password = "root";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {

//            resp.setContentType("text/html");
//            PrintWriter out = resp.getWriter();
//            out.println("<html>\n" +
//                    "<head><title>" + "Database" + "</title></head>\n" +
//                    "<body bgcolor=\"#f0f0f0\">\n" +
//                    "<h1 align=\"center\">" + "Database" + "</h1>\n");
            //===========================================================

            Class.forName("com.mysql.jdbc.Driver");

            Connection con = null;

            con = DriverManager.getConnection(url, user, password);

            //============================================================

            String usr = req.getParameter("name");
            String pwd = req.getParameter("password");

            //============================================================

            // check

            Statement stmt3 = con.createStatement();

            String chk = "SELECT Name FROM USERS";
            ResultSet rs3 = stmt3.executeQuery(chk);

            while(rs3.next()){

                String nm = rs3.getString("Name");

                if(nm.equals(usr)){

                    req.setAttribute("flag","Such user is already exist !!!");
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/reg.jsp");
                    rd.forward(req, resp);
                }

            }

            //============================================================

            Statement stmt2 = con.createStatement();

            String  insert= "INSERT INTO USERS (Name, Password) VALUES (?,?)";

            PreparedStatement preparedStatement = null;

            con.setAutoCommit(false);

            preparedStatement = con.prepareStatement(insert);

            preparedStatement.setString(1,usr);
            preparedStatement.setString(2,pwd);

            int i = preparedStatement.executeUpdate();
            con.commit();

            if (i > 0) {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
                rd.forward(req, resp);
            } else {
                //out.println("doesn't added new user");
                resp.sendRedirect("/reg.jsp");
            }

            //============================================================

            con.setAutoCommit(true);
            Statement stmt = con.createStatement();
            String sql;
            sql = "SELECT Name , Password FROM USERS;";

            ResultSet rs = stmt.executeQuery(sql);

            rs.close();
            stmt.close();
            con.close();


//            while (rs.next()) {
//
//                String nm = rs.getString("Name");
//                String ps = rs.getString("Password");
//
//                out.println("Name: " + nm + "<br>");
//                out.println("Password: " + ps + "<br><br>");
//
//            }

            //==============================================================
//
//            out.println("</body></html>");
        }
        catch (SQLException e) {
            System.out.println("error in sql beach !!!!");
        } catch (ClassNotFoundException e) {
            System.out.println("error in class not found beach !!!");
            e.getMessage();
        }

        //===============================================================

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
