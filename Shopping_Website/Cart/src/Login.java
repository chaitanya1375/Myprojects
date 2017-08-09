

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		// TODO Auto-generated method stub
		try{
			HttpSession session = request.getSession(true);
			PrintWriter out=response.getWriter();
		String userid = request.getParameter("uname");    
	    String pwd = request.getParameter("pass");
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection con =  (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/cart",
	            "root", "sree");
	    Statement st = con.createStatement();
	    ResultSet rs;
	    rs = st.executeQuery("select * from users where uname='" + userid + "' and pass='" + pwd + "'");
	    if (rs.next()) {
	        session.setAttribute("userid", userid);
	        response.setContentType("text/html");
	        out.println("<html>");  
	        out.println("<head><title>User Login Success</title></head>");
	        out.println("<body>");
	        out.println("<h4>Welcome " + userid+"</h4>");
	        out.println("<a href='logout.jsp'>Log out</a>");
	        response.sendRedirect("success.jsp");
	        
	        out.println("</body></html>");   

	        
	    } else {
	    	response.setContentType("text/html");
	    	out.println("<html>");  
	        out.println("<head><title>User Login Failed</title></head>");
	        out.println("<body>");
	        out.println("Invalid login details!!try again");
	        response.sendRedirect("userLogin.html");
	    }
	    
		}catch(Exception e){
			e.printStackTrace();
		}
	}

} 
