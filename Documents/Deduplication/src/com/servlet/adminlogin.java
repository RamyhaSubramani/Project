package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import com.bean.Regbean;
import com.imple.Regimple;
import com.inter.Reginter;

/**
 * Servlet implementation class adminlogin
 */
@WebServlet("/adminlogin")
public class adminlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminlogin() {
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
		String email = request.getParameter("email");
		String Password = request.getParameter("Password");

		System.out.println(email + "  " + Password);

		Regbean lb = new Regbean();

		
		lb.setEmail(email);
		lb.setPassword(Password);
		

		HttpSession session = request.getSession();
		session.setAttribute("email", email);

		Reginter asd = new Regimple();
		boolean j = asd.login(lb);
		System.out.println(j);

		if (email.equals("admin@gmail.com") && Password.equals("admin"))
		{
			response.sendRedirect("NewFile.jsp");
		}
		else
		{
			response.sendRedirect("Error.jsp");
		}
		
		
		
	}

}
