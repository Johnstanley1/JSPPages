/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package JAPU.Club;

import JAPU.business.JAPUUser;
import JAPU.data.JAPUUserDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.GregorianCalendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author joees
 */
@WebServlet(name = "JAPUClubServlet", urlPatterns = {"/JAPUClubServlet"})
public class JAPUClubServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String url = "/JAPURegister.jsp";
        
        //get current action
        String action = request.getParameter("action");
        if (action == null) {
            action = "join";
        }
    
      
        //perform the action and set page to requested page after return is clicked
        if (action.equals("join")) {
            url = "/JAPURegister.jsp";
        }
        else if (action.equals("add")) {
            //get parameters from the request
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String program = request.getParameter("program");
            String level = request.getParameter("level");
            
            int levelParam = 0;
            if (!level.isEmpty() && level !=null) {
                levelParam = Integer.parseInt(level);
            }
            //store data in the user object
            JAPUUser user = new JAPUUser(fullName, email, phone, program, levelParam);

            //validate input
            String message;
            if (fullName == null || email == null 
                    || fullName.isEmpty() || email.isEmpty()) {
                message = "Full name and email is required";
                url = "/JAPURegister.jsp";
            }
            else{
                message = null;
                url = "/JAPUDisplayMember.jsp"; 
                JAPUUserDB.insert(user);
            }
            request.setAttribute("user", user);
            request.setAttribute("message", message);
            
            GregorianCalendar currentDate = new GregorianCalendar();
            int currentYear = currentDate.get(Calendar.YEAR);
            
            request.setAttribute("currentYear", currentYear);
            
            getServletContext().getRequestDispatcher(url)
                    .forward(request, response);
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
        
    }

 
}
