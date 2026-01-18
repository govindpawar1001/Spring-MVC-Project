package com.linkcode.in.springMVC.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.linkcode.in.springMVC.POJO.AdminPOJO;
import com.linkcode.in.springMVC.Service.AdminService;

import jakarta.servlet.http.HttpSession;



@Controller
public class AdminController {
    
    @Autowired
    private AdminService service;

  

    // Show Create Account Page
    @GetMapping("/create")
    public String showCreatePage() {
        return "createAccount"; // Returns createAccount.jsp
    }

    // Process Create Account
    @PostMapping("/create")
    public String createAdminAccount(@RequestParam("username") String user,
                                     @RequestParam("password") String pass, ModelMap map) {
        AdminPOJO admin = service.addAdmin(user, pass);
        if (admin != null) {
            map.addAttribute("msg", "Account created successfully! Please login.");
            return "Login";
        }
        return "createAccount";
    }
    
    
    
    // Show Login Page
    @GetMapping("/login")
    public String showLoginPage() {
        return "Login"; // Returns Login.jsp
    }

    // Process Login
    @PostMapping("/login")
    public String login(@RequestParam("username") String user,
                        @RequestParam("password") String pass, ModelMap map,HttpSession session ) {
        AdminPOJO admin = service.findAdmin(user, pass);
        if (admin != null) {
        	session.setAttribute("login", admin);
        	session.setMaxInactiveInterval(30);
            return "Home"; // Redirect to Employee Management Home
        } else {
            map.addAttribute("msg", "Invalid Username or Password");
            return "Login";
        }
    }
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.invalidate();
    	return "Login";
    }
}