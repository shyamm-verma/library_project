

import com.db.DBConnect;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class AddBookServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
                try {

            String bname = request.getParameter("bname");
            String bdetails = request.getParameter("bdetails");
            String bauthor = request.getParameter("bauthor");
            String bpub = request.getParameter("bpub");
            String branch = request.getParameter("branch");
            String bprice = request.getParameter("bprice");
            String bqty = request.getParameter("bqty");
             
            PrintWriter out=response.getWriter();
            //out.println(bname+" "+bdetails+" "+bauthor+" "+bpub+" "+branch+" "+bprice+" "+bqty);
            Part part = request.getPart("bimg");
            String filename = part.getSubmittedFileName();

            int bavailable = Integer.parseInt(bqty);
            int brent = 0;

            HttpSession session = request.getSession();

            Connection conn = DBConnect.getConnection();
            String insq = "INSERT INTO book (bookpic,bookname, bookdetail, bookaudor, bookpub, branch, bookprice,bookquantity,bookava,bookrent) VALUES(?, ?, ?, ?, ?, ?, ?, ?,?,?)";
            PreparedStatement ps = conn.prepareStatement(insq);
            ps.setString(1, filename);
            ps.setString(2, bname);
            ps.setString(3, bdetails);
            ps.setString(4, bauthor);
            ps.setString(5, bpub);
            ps.setString(6, branch);
            ps.setString(7, bprice);
            ps.setString(8, bqty);
            ps.setInt(9, bavailable);
            ps.setInt(10, brent);

            int status = ps.executeUpdate();
            if (status > 0) {
                
                session.setAttribute("f1", "Book Added Successfully !");
                System.out.println("Record inserted successfully!");
                 InputStream is = part.getInputStream();
                byte[] data = new byte[is.available()];
                is.read(data);
                String path ="C:\\Users\\iamsh\\OneDrive\\Documents\\NetBeansProjects\\library_project\\web\\"+ "img_folder" + File.separator + filename;
                FileOutputStream fos = new FileOutputStream(path);
                fos.write(data);
                fos.close();
                response.sendRedirect("AddBook.jsp");
            } else {
                session.setAttribute("f2", "Something went wrong on server !");
                System.out.println("Record not inserted !");
                response.sendRedirect("AddBook.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        

    }


}
