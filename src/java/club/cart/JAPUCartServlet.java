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
        
        ArrayList<Book> loanItems = (ArrayList<Book>) getServletContext().getAttribute("loanItems"); 
        HttpSession session = request.getSession();
        ECart loanCart = (ECart)session.getAttribute("loanCart");
        
        if (loanCart == null ) {
            loanCart = new ECart();
            session.setAttribute("loanCart", loanCart);
        }
     
        String action = request.getParameter("action");
        
         
        if (action != null && action.equals("reserve")) {
            
            String code = request.getParameter("code");
           
            Book loanItem = ELoan.findItem(loanItems, code);
            
            loanCart.addItem(loanItem);  
            
            ELoan.subtractFromQOH(loanItems, code, 1);
                       
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
