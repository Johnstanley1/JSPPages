/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package club.cart;

import club.business.Book;
import club.business.ECart;
import club.business.ELoan;
import java.io.IOException;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;


/**
 *
 * @author joees
 */
public class JAPUCartServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            

        String url = "/JAPUECart.jsp";
        ServletContext sc = getServletContext();
        HttpSession session = request.getSession();
        
        ArrayList<Book> loanItems = (ArrayList<Book>) sc.getAttribute("loanItems"); 
        ECart loanCart = (ECart)session.getAttribute("loanCart");
        
        if (loanCart == null ) {
            loanCart = new ECart();
            session.setAttribute("loanCart", loanCart);
        }
     
        String action = request.getParameter("action");         
        if (action != null && action.equals("reserve")) {
             String code = request.getParameter("code");
             Book books = ELoan.findItem(loanItems, code);
             
            if (books != null && books.getQuantity() > 0) {
                loanCart.addItem(books);

                // Update the quantity in inventory and update the attributes
                ELoan.subtractFromQOH(loanItems, code, 1);

                // Store loanItems in the session
                session.setAttribute("loanItems", loanItems);
                // Store loanCart in the session (if necessary)
                session.setAttribute("loanCart", loanCart);
            } 
        }    
        
        getServletContext().getRequestDispatcher(url).forward(request, response);   
           
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
