/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package club.admin;

import club.business.Book;
import club.data.BookIO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author joees
 */
public class JAPUAddBookServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String url = "/JAPUAddBook.jsp";
        List<String> errorMsg = new ArrayList<>();
        
        String action = request.getParameter("action");
        if (action == null) {
            action = "join";
        }
              
        if (action.equals("join")) {
            url = "/JAPUAddBook.jsp";
        }else if(action.equals("save")){
            String codeParam = request.getParameter("code");
            String descriptionParam = request.getParameter("description");
            String quantityParam = request.getParameter("quantity");
            
            int quantity = 0;    
                    
            if (codeParam == null || codeParam.isEmpty()) {
                errorMsg.add("Book code is required");
                url = "/JAPUAddBook.jsp";
            }
                
            if(descriptionParam == null || descriptionParam.isEmpty() || descriptionParam.length()<3){
                errorMsg.add("Description must have at least 3 characters");
                url = "/JAPUAddBook.jsp";
            }
                
            if(quantityParam == null || quantityParam.isEmpty()){
                errorMsg.add("Quantity is required");
                url = "/JAPUAddBook.jsp";    
            }else{ 
                try{
                    quantity = Integer.parseInt(quantityParam);

                    if (quantity <= 0) {
                        errorMsg.add("Quantity must be a positive number");
                        url = "/JAPUAddBook.jsp"; 
                   }
                }catch(NumberFormatException e){
                    request.setAttribute("errorClass", e.getClass().getName());
                    request.setAttribute("errorMessage", e.getMessage());
                    request.getRequestDispatcher("/JAPUError.jsp").forward(request, response);
                    return;
                }
                       
            }

            Book book = new Book(codeParam, descriptionParam, quantity);
            if(!errorMsg.isEmpty()){
                request.setAttribute("errorMsg", errorMsg);
                url = "/JAPUAddBook.jsp";
            }else{
                errorMsg = null;
                url = "/JAPUDisplayBooks";
                
                BookIO.insert(book, getServletContext().getRealPath("/WEB-INF/books.txt"));
            }
            
            String erroClass = "";
            String message = "";
            
            request.setAttribute("book", book);
            
            getServletContext().getRequestDispatcher(url)
                .forward(request, response);
        }
        
       
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
