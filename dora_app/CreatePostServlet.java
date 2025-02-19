package dora_app;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;

import java.io.IOException;
import java.util.List;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class CreatePostServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();

        UserAccount authenticatedUser = (UserAccount) session.getAttribute("authenticatedUser");

        String title = null;
        String city = null;
        String area = null;
        String spotName = null;
        String category = null;
        // Description is not a required field and if not completed is an empty String.
        String description = "";
        int rating = 0;
        FileItem fileUploadItem = null;

        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                DiskFileItemFactory factory = new DiskFileItemFactory();

                // Create a new file upload handler
                ServletFileUpload upload = new ServletFileUpload(factory);

                // Parse the request to get file items
                List<FileItem> fileItems = upload.parseRequest(request);
                for (FileItem item : fileItems) {
                    // Normal form fields
                    if (item.isFormField()) {
                        String fieldName = item.getFieldName();
                        String value = item.getString();

                        switch (fieldName) {
                            case "title":
                                title = value;
                                break;
                            case "city":
                                city = value;
                                break;
                            case "area":
                                area = value;
                                break;
                            case "spotName":
                                spotName = value;
                                break;
                            case "description":
                                description = value;
                                break;
                            case "category":
                                category = value;
                                break;
                            case "rating":
                                rating = Integer.parseInt(value);
                                break;
                        }
                        
                    } else {
                        /*  Get the picture item to be uploaded to the server.
                            And check if the current form field represents an image:
                            is not null and starts with "image/", like "image/jpeg", "image/png". */
                        if (item.getContentType() != null && item.getContentType().startsWith("image/")) {
                            fileUploadItem = item;
                        } else {
                            request.setAttribute("message", "Please upload an image with your post");
                            RequestDispatcher dispatcher = request.getRequestDispatcher("createapost.jsp");
                            dispatcher.forward(request, response);
                        }
                    }
                }
                
                if (fileUploadItem != null) {

                    Location location = new Location(city, area);
                    int locationID = Location.createLocation(location);

                    Spot spot = new Spot(spotName, category, locationID);
                    int spotid = Spot.createSpot(spot);
                    Post post = new Post(title, description, rating, 0, authenticatedUser.getAccountID(), spotid);
                    post.setNewPostIDFromDB();

                    // Upload the image file to the server 
                    post.saveImage(fileUploadItem);

                    // Save the post to the database
                    post.saveNewPost();

                    request.setAttribute("message", "Successfully uploaded your post");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("userprofile.jsp");
                    dispatcher.forward(request, response);
                }

            } catch (Exception e) {
                request.setAttribute("message", e.getMessage());
                RequestDispatcher dispatcher = request.getRequestDispatcher("createapost.jsp");
                dispatcher.forward(request, response);
            }
        }
    }

    
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        /* In case someone tries to access the Servlet through the page's URL (method get) 
        without completing the form send him back to the create a post form if he is an authenticated user. 
        Otherwise send him to the login page. */

        HttpSession session = request.getSession();

        UserAccount authenticatedUser = (UserAccount) session.getAttribute("authenticatedUser");

        if (authenticatedUser == null) {
            request.setAttribute("error_message", "You are not authorized to access this resource, please login");
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("message", "Please complete the create a post form");
            RequestDispatcher dispatcher = request.getRequestDispatcher("createapost.jsp");
            dispatcher.forward(request, response);
        }
    }
}