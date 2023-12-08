package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.Statement;
import com.db.DBConnect;
import java.sql.Connection;

public final class BookRequest_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/all_css.jsp");
    _jspx_dependants.add("/navbar.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>index page</title>\n");
      out.write("        ");
      out.write("\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css\"\n");
      out.write("        integrity=\"sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm\" crossorigin=\"anonymous\">\n");
      out.write("    <script src=\"https://code.jquery.com/jquery-3.2.1.slim.min.js\"\n");
      out.write("        integrity=\"sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN\"\n");
      out.write("        crossorigin=\"anonymous\"></script>\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js\"\n");
      out.write("        integrity=\"sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q\"\n");
      out.write("        crossorigin=\"anonymous\"></script>\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js\"\n");
      out.write("        integrity=\"sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl\"\n");
      out.write("        crossorigin=\"anonymous\"></script>\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css\"\n");
      out.write("        integrity=\"sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==\"\n");
      out.write("        crossorigin=\"anonymous\" referrerpolicy=\"no-referrer\" />\n");
      out.write("    <link rel=\"stylesheet\" href=\"style.css\">");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("    <div class=\"container\">\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div class=\"col-md-12\">\n");
      out.write("                <center><img src=\"images/logo.PNG\" alt=\"\"></center>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("    <nav class=\"navbar navbar-expand-lg navbar-light bg-custom\">\n");
      out.write("        <div class=\"collapse navbar-collapse\" id=\"navbarSupportedContent\">\n");
      out.write("            <ul class=\"navbar-nav mr-auto\">\n");
      out.write("                <li class=\"nav-item active\">\n");
      out.write("                    <a class=\"nav-link\" href=\"AddBook.jsp\"><img class=\"icons\" src=\"images/icon/book.png\" width=\"30px\" height=\"30px\" /> ADD BOOK</a>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"nav-item active\">\n");
      out.write("                    <a class=\"nav-link\" href=\"BookReport.jsp\"><img class=\"icons\" src=\"images/icon/open-book.png\" width=\"30px\" height=\"30px\" /> BOOK REPORT</a>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"nav-item active\">\n");
      out.write("                    <a class=\"nav-link\" href=\"BookRequest.jsp\"><img class=\"icons\" src=\"images/icon/interview.png\" width=\"30px\" height=\"30px\" /> BOOK REQUEST</a>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"nav-item active\">\n");
      out.write("                    <a class=\"nav-link\" href=\"AddPerson.jsp\"><img class=\"icons\" src=\"images/icon/add-user.png\" width=\"30px\" height=\"30px\" /> ADD STUDENT</a>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"nav-item active\">\n");
      out.write("                    <a class=\"nav-link\" href=\"PersonRecord.jsp\"><img class=\"icons\" src=\"images/icon/monitoring.png\" width=\"30px\" height=\"30px\" /> PERSON RECORD</a>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"nav-item active\">\n");
      out.write("                    <a class=\"nav-link\" href=\"IssueBook.jsp\"><img class=\"icons\" src=\"images/icon/test.png\" width=\"30px\" height=\"30px\" /> ISSUE BOOK</a>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"nav-item active\">\n");
      out.write("                    <a class=\"nav-link\" href=\"IssueReport.jsp\"><img class=\"icons\" src=\"images/icon/book.png\" width=\"30px\" height=\"30px\" /> ISSUE REPORT</a>\n");
      out.write("                </li>\n");
      out.write("            </ul>\n");
      out.write("        </div>\n");
      out.write("    </nav>\n");
      out.write("<div>");
      out.write("\n");
      out.write("                <div class=\"container-fluid\">\n");
      out.write("            <div class=\"row text-center mt-3\">\n");
      out.write("                <table class=\"table table-striped m-3 fw-bold\">\n");
      out.write("                    <thead class=\"thead-dark\">\n");
      out.write("                        <tr>\n");
      out.write("                            <th scope=\"col\">PERSON NAME</th>\n");
      out.write("                            <th scope=\"col\">PERSON TYPE</th>\n");
      out.write("                            <th scope=\"col\">BOOK NAME</th>\n");
      out.write("                            <th scope=\"col\">DAYS</th>\n");
      out.write("                            <th scope=\"col\">APPROVE</th>\n");
      out.write("                        </tr>\n");
      out.write("                    </thead>\n");
      out.write("                    <tbody>\n");
      out.write("                        ");

                            Connection conn = DBConnect.getConnection();
                            Statement st = conn.createStatement();
                            String sql = "SELECT * FROM requestbook ";
                            ResultSet rs = st.executeQuery(sql);
                            while (rs.next()) {
      out.write("\n");
      out.write("                        <tr>\n");
      out.write("                            <th scope=\"row\">");
      out.print(  rs.getString(4));
      out.write("</th>\n");
      out.write("                            <td>");
      out.print( rs.getString(5));
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( rs.getString(6));
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( rs.getInt(7));
      out.write("</td>\n");
      out.write("                            <td ><a href=\"BookRequest?reqid=");
      out.print( rs.getInt(1));
      out.write("&uname=");
      out.print( rs.getString(5) );
      out.write("&bname=");
      out.print( rs.getString(6));
      out.write("&idays=");
      out.print( rs.getInt(7));
      out.write("\" id=\"bookreport\" ><button type='button' class='btn btn-primary'> View BOOK");
      out.print( rs.getInt(1));
      out.write(" </button></a></td>\n");
      out.write("                        </tr>\n");
      out.write("                        ");
}
                            if(rs!=null){
                                rs.close();
                            }if(st!=null){
                                st.close();
                            }if(conn!=null){
                                conn.close();
                            }
                        
      out.write("\n");
      out.write("                    </tbody>\n");
      out.write("                </table>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
