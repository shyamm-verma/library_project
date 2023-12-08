
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


public class PersonBookRequest extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        int uid=Integer.parseInt(request.getParameter("uid"));
        int bid=Integer.parseInt(request.getParameter("bid"));
        PrintWriter out = response.getWriter();
        out.println(uid+" "+bid);
        
        Connection conn=DBConnect.getConnection();
        String uname="";
        String utype="";
        String bname="";
        int days=0;
        
        
        try {
            
            String sql1="SELECT * FROM book where id=?";
            PreparedStatement ps1=conn.prepareStatement(sql1);
            ps1.setInt(1, bid);
            ResultSet rs1=ps1.executeQuery();
            while(rs1.next()){
                    bname=rs1.getString(3);
            }
            
            String sql2="SELECT * FROM userdata where id=?";
            PreparedStatement ps2=conn.prepareStatement(sql2);
            ps2.setInt(1, uid);
            ResultSet rs2=ps2.executeQuery();
            while(rs2.next()){
                uname=rs2.getString(2);
                utype=rs2.getString(5);
            }
            
            if(utype.equals("teacher")){
                days=14;
            }
            if(utype.equals("student")){
                days=7;
            }
            
            
            
           String sql3="INSERT INTO requestbook (userid,bookid,username,usertype,bookname,issuedays)VALUES(?,?,?,?,?,?)";
           PreparedStatement ps3=conn.prepareStatement(sql3);
           ps3.setInt(1, uid);
           ps3.setInt(2, bid);
           ps3.setString(3, uname);
           ps3.setString(4, utype);
           ps3.setString(5, bname);
           ps3.setInt(6, days);
           int i=ps3.executeUpdate();
           if(i>0){
                   out.println(i+"record inserted");
                   response.sendRedirect("UserBookRecord.jsp");
           }else{
                out.println(i+"not record inserted");
                response.sendRedirect("UserRequest.jsp");
           }
           
           
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        out.println(uname+" "+utype+" "+bname);
        

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


}
