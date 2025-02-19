<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Error Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/style.css">
        <link rel="icon" href="images/favicon.png" type="image/png">
        <link rel="stylesheet" href="css/bootstrap.min.css">
    </head>
    <body>

      <div class="container">
        
            
        <div class="page-header">
            <div class="alert alert-danger" role="alert">
			<h1>Oops something went wrong</h1>
		</div>

        <div class="row">

            <div class="col-xs-12">

                <h2>Description</h2>
                
                <% if(exception != null) { %>	                  	
                    <p><code><%=exception %></code></p>						
                <% } %>		
                   
            </div>

        </div>  
              
        </div>
      </div><!-- /.container -->	
  </body>
</html>