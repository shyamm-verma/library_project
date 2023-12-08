
import com.db.DBConnect;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BookRequest extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int reqid=Integer.parseInt(request.getParameter("reqid"));
        int idays=Integer.parseInt(request.getParameter("idays"));
        int uid=Integer.parseInt(request.getParameter("uid"));
        int bid=Integer.parseInt(request.getParameter("bid"));
        
                // Get the current date
        LocalDate currentDate = LocalDate.now();

        // Specify the number of days to add
        int daysToAdd = idays;

        // Add the specified number of days to the current date
        LocalDate newDate = currentDate.plusDays(daysToAdd);

        // Create a DateTimeFormatter object with the desired date format
       DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");

        // Convert currentDate to a string
        String currentDateStr = currentDate.format(formatter);

        // Convert newDate to a string
        String newDateStr = newDate.format(formatter);

        // Output the string representations of the dates
       // System.out.println("Current Date: " + currentDateStr);
        //System.out.println("New Date after adding " + daysToAdd + " days: " + newDateStr);


        
        PrintWriter out=response.getWriter();
        out.println(reqid+" "+idays+" "+uid+" "+bid+" "+newDate);
        
        String utype="";
        String uname="";
        String bname="";
        int new_bavailable=0;
        int new_brent=0;
        
        try {
                Connection conn=DBConnect.getConnection();
                
                String sql = "SELECT * FROM userdata where id=?";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setInt(1,uid);
                ResultSet rs = ps.executeQuery();
                while(rs.next()){
                  utype=rs.getString(5);
                  uname=rs.getString(2);
                }
                
                
                String sql1="SELECT * FROM book where id=?";
                PreparedStatement ps1=conn.prepareStatement(sql1);
                ps1.setInt(1, bid);
                ResultSet rs1=ps1.executeQuery();
                while(rs1.next()){
                    bname=rs1.getString(3);
                    new_bavailable=rs1.getInt(10)-1;
                    new_brent=rs1.getInt(11)+1;
                }
                
                
                String sql2="UPDATE book SET bookava=?, bookrent=? where id=?";
                PreparedStatement ps2=conn.prepareStatement(sql2);
                ps2.setInt(1, new_bavailable);
                ps2.setInt(2, new_brent);
                ps2.setInt(3, bid);
                int i=ps2.executeUpdate();  
                System.out.println(i+" records updated");  
                
                
                String sql3="INSERT INTO issuebook (userid,issuename,issuebook,issuetype,issuedays,issuedate,issuereturn,fine)VALUES(?,?,?,?,?,?,?,?)";
                PreparedStatement ps3=conn.prepareStatement(sql3);
                ps3.setInt(1, uid);
                ps3.setString(2, uname);
                ps3.setString(3, bname);
                ps3.setString(4, utype);
                ps3.setInt(5, idays);
                ps3.setString(6, currentDateStr);
                ps3.setString(7, newDateStr);
                ps3.setInt(8, 0);
                int j=ps3.executeUpdate();
                System.out.println(j+"record inserted");
                
                if(i>0 && j>0){           
                    String sql4="DELETE from requestbook where id=?";
                    PreparedStatement ps4=conn.prepareStatement(sql4);
                    ps4.setInt(1, reqid);
                    int k=ps4.executeUpdate();
                    if(k>0){
                        response.sendRedirect("BookRequest.jsp");
                    }
                }else{
                    response.sendRedirect("AddBook.jsp");
                }
                
                
        } catch (Exception e) {
        }
        
         out.println(reqid+" "+idays+" "+uid+" "+bid+" "+newDate+" "+utype);
         out.println(bname+" "+new_bavailable+" "+new_brent);
    }



}
