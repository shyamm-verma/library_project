import com.db.DBConnect;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AddPerson extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            String uname = request.getParameter("uname");
            String uemail = request.getParameter("uemail");
            String upass = request.getParameter("upass");
            String utype = request.getParameter("utype");

        System.out.println(uname+" "+uemail+" "+" "+upass+" "+" "+utype);
            HttpSession session = request.getSession();

            Connection conn = DBConnect.getConnection();
            
            String insq = "INSERT INTO userdata(name, email, pass,type)VALUES(?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(insq);
            ps.setString(1, uname);
            ps.setString(2, uemail);
            ps.setString(3, upass);
            ps.setString(4, utype);
            
            int status = ps.executeUpdate();
            if (status > 0) {
                session.setAttribute("f3", "new person added successfully !");
                System.out.println("Record inserted successfully!");
                response.sendRedirect("AddPerson.jsp");
            } else {
                session.setAttribute("f4", "something went wrong on server !");
                System.out.println("Record not inserted !");
                response.sendRedirect("AddPerson.jsp");
            }
        } catch (Exception e) {
        }

    }

}