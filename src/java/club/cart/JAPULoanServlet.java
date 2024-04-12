/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package club.cart;
import club.business.ELoan;
import club.business.Book;
import java.io.IOException;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author joees
 */
public class JAPULoanServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                                
        String url = "/JAPUELoan.jsp";
        ServletContext sc = getServletContext();
        String bookFilePath = sc.getInitParameter("booksFilePath");
        String path = sc.getRealPath(bookFilePath);
        
        ArrayList<Book> loanItems = (ArrayList<Book>) request.getSession().getAttribute("loanItems");
                
        if (loanItems == null || loanItems.isEmpty()) {
            loanItems = ELoan.loadItems(path);
           
            sc.setAttribute("loanItems", loanItems);    
            
        }
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
