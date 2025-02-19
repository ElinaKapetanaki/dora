<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dora_app.Account" %>
<%@ page import="dora_app.DBCon" %>
<%@ page import="dora_app.BusinessAccount" %>
<%@ page import="dora_app.UserAccount" %>
<%@ page errorPage="error.jsp" %>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");

Account uAccount = new Account(username,password);

try {

    Account account = uAccount.logIn(username, password);
    

    if (account instanceof UserAccount) {
        // If it's a UserAccount, forward to user profile page
        session.setAttribute("authenticatedUser", account);
        response.sendRedirect("userprofile.jsp");

    } else if (account instanceof BusinessAccount) {
        // If it's a BusinessAccount, forward to business page
        session.setAttribute("authenticatedBusiness", account);
        response.sendRedirect("businessprofile.jsp");

    } else {
        // Unknown account type
        throw new Exception("Wrong username or password");
    }

} catch(Exception e) {

    request.setAttribute("error_message", e.getMessage());

%>
    <jsp:forward page="login.jsp" />

<%
}
%>