
import com.db.DBConnect;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CheckUser extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        String uname = request.getParameter("username");
        String password = request.getParameter("password");
        String option = request.getParameter("option");

        String email = "";
        String pass = "";
        int id=0;
        
        
        String adminEmail="";
        String adminPassword="";
        int adminId=0;

        out.println(uname + " " + password + " " + option);
        Connection conn = DBConnect.getConnection();
        HttpSession session = request.getSession();

        try {

            if (option.equals("admin")) {

                //response.sendRedirect("index.jsp");
                String sql1 = "SELECT * FROM admin where email=? and pass=?";
                PreparedStatement ps1 = conn.prepareStatement(sql1);
                ps1.setString(1, uname);
                ps1.setString(2, password);
                ResultSet rs1 = ps1.executeQuery();
                while (rs1.next()) {
                    adminEmail = rs1.getString(2);
                    adminPassword = rs1.getString(3);
                    adminId=rs1.getInt(1);
                }
                if (adminEmail.equals(uname) && adminPassword.equals(password)) {
                     session.setAttribute("adminEmail", adminEmail);
                     session.setAttribute("adminId",Integer.toString(adminId));
                    response.sendRedirect("AddBook.jsp");
                } else {
                    response.sendRedirect("login.jsp");
                }

            } else if (option.equals("user")) {
                
                String sql2 = "SELECT * FROM userdata where email=? and pass=?";
                PreparedStatement ps2 = conn.prepareStatement(sql2);
                ps2.setString(1, uname);
                ps2.setString(2, password);
                ResultSet rs2 = ps2.executeQuery();
                while (rs2.next()) {
                    email = rs2.getString(3);
                    pass = rs2.getString(4);
                    id=rs2.getInt(1);
                }
                if (email.equals(uname) && pass.equals(password)) {
                    session.setAttribute("username", email);
                    session.setAttribute("id",Integer.toString(id));
                    response.sendRedirect("UserProfile.jsp");
                } else {
                    response.sendRedirect("login.jsp");
                }

            } else {
                response.sendRedirect("login.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
