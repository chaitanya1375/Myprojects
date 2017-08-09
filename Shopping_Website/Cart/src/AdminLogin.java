

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminLogin
 */
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLogin() {
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
		HttpSession session = request.getSession(true);
		PrintWriter out=response.getWriter();
		String user = request.getParameter("aname");
		session.setAttribute("adminid", user);
	    String pwd = request.getParameter("apass");
	    if(user.equals("admin") && pwd.equals("admin@klozet")){
	    	
			session.setAttribute("userid", "Admin");
			response.setContentType("text/html");
	        out.println("<html>");  
	        out.println("<head><title>User Login Success</title></head>");
	        out.println("<body>");
	        out.println("<h4>Welcome " + "ADMIN"+"</h4>");
	        out.println("<a href='logout.jsp'>Log out</a>");
	    	response.sendRedirect("Hello1.jsp");
	    }
	    else{
	    	response.sendRedirect("Hello.html");
	    }
	}

}
