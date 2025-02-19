<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dora_app.UserAccount" %>


<%
// Read form parameters
String username = request.getParameter("username");
String password = request.getParameter("password");
String fullName = request.getParameter("fullName");
String ageStr = request.getParameter("age");
String country = request.getParameter("country");
String gender = request.getParameter("gender");
String bio = request.getParameter("bio");

ArrayList<String> errors = new ArrayList<String>();

    if (username == null || username.length() < 3) {
        errors.add("Username must be at least 3 characters long");
    }

    if (password == null || password.length() < 6) {
        errors.add("Password must be at least 6 characters long");
    }

    if (fullName == null) {
        errors.add("Please write your full Name");
    }

    if (ageStr == null) {
        errors.add("Please enter your age");
    } else {
        try {
            int age = Integer.parseInt(ageStr);
        } catch (NumberFormatException e) {
            errors.add("Age must be a valid number");
        }
    }

    if (country == null) {
        errors.add("Please write your country");
    }

    if (gender == null) {
        errors.add("Please write your gender");
    }

    if (bio == null) {
        errors.add("Please write your bio");
    }

    if (errors.isEmpty()) {
        UserAccount userAccount = new UserAccount(username, password, fullName, Integer.parseInt(ageStr), country, gender, bio);
        try {
            userAccount.register();
            session.setAttribute("authenticatedUser", userAccount);
            // Redirect to userprofile.jsp
            response.sendRedirect("userprofile.jsp");
            return;
        } catch (Exception e) {
            errors.add(e.getMessage());
        }
    }
    
    request.setAttribute("errors", errors);

    %>
    <jsp:forward page="usersignup.jsp"/>