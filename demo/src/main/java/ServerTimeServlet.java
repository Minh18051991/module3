import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.TimeZone;

@WebServlet (urlPatterns = "/serverTime")
public class ServerTimeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       PrintWriter writer = response.getWriter();
       Date date = new Date();
       writer.println("<h1>Server Time and Date Information</h1>");
       writer.println("Current date: " + date);
       writer.println("Current time zone: " + TimeZone.getDefault().getDisplayName());
       writer.println("Current time zone ID: " + TimeZone.getDefault().getID());
       writer.println("Current time zone offset: " + TimeZone.getDefault().getOffset(date.getTime()));  // in milliseconds


        writer.println("");
       writer.close();
    }
}
