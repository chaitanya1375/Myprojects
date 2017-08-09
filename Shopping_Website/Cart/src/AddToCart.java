

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;

/**
 * Servlet implementation class AddToCart
 */
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
     List<Product> cart=new ArrayList<Product>();
     Checkout ch=new Checkout();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int costOfOrder=0;
		Random rand = new Random();
		int orderid=rand.nextInt(Integer.MAX_VALUE);
		String status="ordered";
		PrintWriter out=response.getWriter();
		try{
			HttpSession session=request.getSession(false);
			if(session.getAttribute("userid")==null){
				out.println("Sorry you have to login to add items to cart!");
				response.sendRedirect("userLogin.html");
			}
			else{
				String description="";
				String uname=(String) session.getAttribute("userid");
				costOfOrder=calculateCost(cart);
				System.out.println("cost "+costOfOrder);
				
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/cart","root", "sree");
				Statement st=con.createStatement();
				for(int i=0;i<cart.size();i++){
					
					description+=cart.get(i).getName()+" ";
				}
				System.out.println("description: "+description);
				int s=st.executeUpdate("insert into orders values('"+orderid+"','"+description+"','"+costOfOrder+"','"+status+"','"+uname+"')");
				if(s>0){
					System.out.println("insert success");
					session.setAttribute("orderid", orderid);
					}
				response.sendRedirect("pay.jsp");
			}
			}catch(Exception e){
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
		
		String size=request.getParameter("size");
		int price=0;
		int quantity=Integer.parseInt(request.getParameter("quantity"));
		
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		price=Integer.parseInt(request.getParameter("price"));
	    Product p=new Product(id,name,size,quantity,price);
	    cart.add(p);
		System.out.println("item added to cart successfully");
		System.out.println("items in cart are:\n");
		displayCart();
	    
		response.sendRedirect("productsDisplay.jsp");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public void displayCart(){
		for(int i=0;i<cart.size();i++){
			System.out.println("id "+cart.get(i).getId());
			System.out.println("Name "+cart.get(i).getName());
			System.out.println("Size "+cart.get(i).getSize());
			System.out.println("Quantity "+cart.get(i).getQuantity());
		}
	}
	
	
	public int calculateCost(List<Product> finalcart) {
		// TODO Auto-generated method stub
		int price=0;
		for(int i=0;i<finalcart.size();i++){
			price=0;
			price+=finalcart.get(i).getQuantity()*finalcart.get(i).getPrice();
		}
		System.out.println("price: "+price);
		return price;
	}

}
