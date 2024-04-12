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


public class JAPUClearCartServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String url = "/JAPUECart.jsp";
        HttpSession session = request.getSession();
                
        ECart loanCart = (ECart) session.getAttribute("loanCart");
        
        if (loanCart == null) {
            loanCart = new ECart();
            
        }
                    
        ArrayList<Book> cartItems = loanCart.getItems();
                        
        for(Book item: cartItems){
                
            ELoan.addToQOH(cartItems, item.getCode(),item.getQuantity());
            
        }
                   
        session.invalidate();
            
        getServletContext()
                .getRequestDispatcher(url)
                .forward(request, response);    
        

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
