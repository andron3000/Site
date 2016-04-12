package com.chekhovych;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/s")
public class Validation extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String name = req.getParameter("name");
        String password = req.getParameter("password");

        //=====================================================================================

        try {

            Class.forName("com.mysql.jdbc.Driver");

            Connection con = null;

            con = DriverManager.getConnection(Add_User.url, Add_User.user, Add_User.password);

            Statement stmt = con.createStatement();

            String chk = "SELECT Name,Password FROM USERS";
            ResultSet rs = stmt.executeQuery(chk);

            while(rs.next()){

                String nm = rs.getString("Name");

                String psw = rs.getString("Password");

                if( ( nm.equals(name) ) && ( psw.equals(password)) ){

                    rs.close();
                    stmt.close();
                    con.close();

                    req.setAttribute("NAME",name);
                    req.setAttribute("PASSWORD",password);

                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/welcome.jsp");

                    rd.forward(req, resp);
                }

            }

            rs.close();
            stmt.close();
            con.close();

//            req.setAttribute("error","Invalid User Name or Password !!!");
//            req.getRequestDispatcher("/login.jsp").forward(req, resp);

        }
        catch (ClassNotFoundException e){
            System.out.println("error !!!");
        }
        catch (SQLException e){
            System.out.println("error sql !!!");
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
