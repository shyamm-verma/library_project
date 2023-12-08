/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.db.DBConnect;
import com.entity.AddBookEntity;
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

/**
 *
 * @author iamsh
 */
public class BookDetail extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int bid = Integer.parseInt(request.getParameter("bid"));
        HttpSession session=request.getSession();
        System.out.println(bid);
        AddBookEntity abe = new AddBookEntity();
        try {
            if (bid != 0) {
                
                session.setAttribute("bid", bid);
                Connection conn = DBConnect.getConnection();
                String sql = "SELECT * FROM book where id =?";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setInt(1, bid);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    abe.setBname(rs.getString(3));
                    abe.setBdetails(rs.getString(4));
                    abe.setBauthor(rs.getString(5));
                    abe.setBranch(rs.getString(7));
                    abe.setBprice(rs.getString(8));
                    abe.setBqty(rs.getString(9));
                    abe.setBimg(rs.getString(2));
                    abe.setBavailabel(rs.getInt(10));
                    abe.setBrent(rs.getInt(11));
                }

                System.out.println(abe);
                
                response.sendRedirect("BookDetail.jsp");
            }

        } catch (Exception e) {
        }

    }

}
