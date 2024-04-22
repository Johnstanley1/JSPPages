/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package club.admin;

import club.business.Member;
import club.data.MemberDB;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author joees
 */
public class JAPUMemberAdminController extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                
        String action = request.getParameter("action");
        String undoAction = request.getParameter("undoAction");

        ArrayList<Member> members = null;
                
        if (action == null) {
            action = "displayMembers";
        } 
           
        if (action.equals("displayMembers")) {
            members = MemberDB.selectMembers();
            request.setAttribute("members", members);
            
            request.getRequestDispatcher("/JAPUDisplayMember.jsp")
                    .forward(request, response); 
  
        }
        else if (action.equals("addMember")) {
            request.getRequestDispatcher("/JAPUAddMember.jsp")
                    .forward(request, response);
            
        }else if(action.equals("editMember")){
            String email = request.getParameter("email");
            Member member = MemberDB.selectMember(email);
            request.setAttribute("member", member);
            
            request.getRequestDispatcher("/JAPUEditMember.jsp")
                    .forward(request, response);
            
        }else if(action.equals("removeMember")){
            String email = request.getParameter("email");
            Member member = MemberDB.selectMember(email);
            request.setAttribute("member", member);
            
            request.getRequestDispatcher("/JAPURemoveMember.jsp")
                    .forward(request, response);
            
        }else if(undoAction.equals("no")){
            members = MemberDB.selectMembers();
            request.setAttribute("members", members);
            
            request.getRequestDispatcher("/JAPUDisplayMember.jsp")
                    .forward(request, response);
        }
    
    }
    
    private void saveMember(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException{
        
            String url = "/JAPUDisplayMember.jsp";
            String action = request.getParameter("action");        
        
            //get parameters from the request
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String program = request.getParameter("program");
            String level = request.getParameter("level");
                        
            int levelParam = 0;

            if (level !=null && !level.isEmpty()) {
                levelParam = Integer.parseInt(level);
            }
            
            Member member = new Member();
            member.setFullName(fullName);
            member.setEmailAddress(email);
            member.setPhoneNumber(phone);
            member.setProgramName(program);
            member.setYearLevel(levelParam);
            
            String message = "";
            if (action.equals("addMember")) {
            
                if (!member.isValid()) {
                    message = "Cannot insert a new record. Please enter a valid name/or email";
                    url = "JAPUAddMember.jsp";
                
                }else{
                    if (MemberDB.emailExists(email)) {
                        message = "";
                        MemberDB.update(member);

                    }else{
                        message = "";
                        MemberDB.insert(member);

                    }
                }
            
            }else if(action.equals("editMember")){
                if (member.isValid()) {
                     if (MemberDB.emailExists(email)) {
                        message = "";
                        MemberDB.update(member);

                    }else{
                        message = "";
                        MemberDB.insert(member);

                    }
                }else{
                    message = "Cannot insert a new record. Please enter a valid name/or email";
                    url = "JAPUEditMember.jsp";
                    MemberDB.selectMember(email);
                    request.setAttribute("member", member);
                }

            }
             ArrayList<Member> members = MemberDB.selectMembers();
             request.setAttribute("members", members);
             request.setAttribute("message", message);           
             request.getRequestDispatcher(url)
                        .forward(request, response);
              
    }
        
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {  
        String action = request.getParameter("action");  
        
        if (action.equals("addMember")) {
            saveMember(request, response);
            
        }else if(action.equals("editMember")){
            saveMember(request, response);
            
        }else if(action.equals("deleteMember")){
            String email = request.getParameter("email");
            Member member = MemberDB.selectMember(email);

            MemberDB.delete(member);
            
            ArrayList<Member> members = MemberDB.selectMembers();
            request.setAttribute("members", members);
            
            request.getRequestDispatcher("/JAPUDisplayMember.jsp")
                    .forward(request, response);
            
        }

    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
