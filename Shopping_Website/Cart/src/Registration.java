

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;

/**
 * Servlet implementation class Registration
 */
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
		// TODO Auto-generated method stub
		String user = request.getParameter("uname");    
	    String pwd = request.getParameter("pass");
	    String fname = request.getParameter("fname");
	    String lname = request.getParameter("lname");
	    String email = request.getParameter("email");
	    String contact = request.getParameter("contact");
	    PrintWriter out=response.getWriter();
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/cart","root", "sree");
	    PreparedStatement pst =(PreparedStatement)con.prepareStatement("insert into users(first_name, last_name, email, contact, uname, pass) values ('"+fname+"','"+lname+"','"+email+"','"+contact+"','"+user+"','"+pwd+"')");
	    //ResultSet rs;
	    out.println("registration proceed");
	    
	    int i=pst.executeUpdate();
	    if (i > 0) {
	    	out.println("insert success");
	        //session.setAttribute("userid", user);
	        response.sendRedirect("welcome.jsp");
	       // out.print("Registration Successful!"+"<a href='index.jsp'>Go to Login</a>");
	    } else {
	    	out.println("failed");
	    	out.println("Registration unsuccessful!! Sorry!!");
	    	response.sendRedirect("userLogin.html");
	    }
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
