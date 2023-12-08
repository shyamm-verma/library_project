
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

public class ReturnServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int uiid = Integer.parseInt(request.getParameter("uiid"));
        String bname = request.getParameter("bname");
        PrintWriter out = response.getWriter();
        out.println(uiid + " " + bname);

        int uid = 0, fine = 0, bavailable = 0, brent = 0;
        HttpSession session = request.getSession();

        try {
            Connection conn = DBConnect.getConnection();

            String sql1 = "SELECT * FROM issuebook where id=?";
            PreparedStatement ps1 = conn.prepareStatement(sql1);
            ps1.setInt(1, uiid);
            ResultSet rs1 = ps1.executeQuery();
            while (rs1.next()) {
                uid = rs1.getInt(2);
                fine = rs1.getInt(9);
            }

            if (fine == 0) {

                String sql2 = "SELECT * FROM book where bookname=?";
                PreparedStatement ps2 = conn.prepareStatement(sql2);
                ps2.setString(1, bname);
                ResultSet rs2 = ps2.executeQuery();
                while (rs2.next()) {
                    bavailable = rs2.getInt(10) + 1;
                    brent = rs2.getInt(11) - 1;
                }

                String sql3 = "UPDATE book SET bookava=?, bookrent=? where bookname=?";
                PreparedStatement ps3 = conn.prepareStatement(sql3);
                ps3.setInt(1, bavailable);
                ps3.setInt(2, brent);
                ps3.setString(3, bname);
                int i = ps3.executeUpdate();

                String sql4 = "DELETE from issuebook where id=? and issuebook=? and fine=? ";
                PreparedStatement ps4 = conn.prepareStatement(sql4);
                ps4.setInt(1, uiid);
                ps4.setString(2, bname);
                ps4.setInt(3, 0);
                int j = ps4.executeUpdate();

                if (i > 0 && j > 0) {
                    session.setAttribute("msg1", "pass");
                    response.sendRedirect("UserBookRecord.jsp");

                } else {
                    session.setAttribute("msg1", "fail");
                    response.sendRedirect("UserBookRecord.jsp");
                }

            }

        } catch (Exception e) {
        }

        out.println(uid + " " + fine);
        out.println(bavailable + " " + brent);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
