package club.business;

import java.io.Serializable;

/**
 *
 * @author joees
 */
public class JAPUUser implements Serializable {
    private String fullName;
    private String email;
    private String phone;
    private String program;
    private int level;
    
    public JAPUUser(){
        fullName = "";
        email = "";
        phone = "";
        program = "";
        level = 0;
    }
    
    public JAPUUser(String fullName, String email, String phone, String program, int level){
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.program = program;
        this.level = level;
    }
    
    public String getFullName(){
        return fullName;
    }
    
    public void setFullName(String fullName){
        this.fullName = fullName;
    }
    
    public String getEmail(){
        return email;
    }
    
    public void setEmail(String email){
        this.email = email;
    }
    
    public String getPhone(){
        return phone;
    }
    
    public void setPhone(String phone){
        this.phone = phone;
    }
    
    public String getProgram(){
        return program;
    }
    
    public void setProgram(String program){
        this.program = program;
    }
    
    public int getLevel(){
        return level;
    }
    
    public void setLevel(int level){
        this.level = level;
    }
}
