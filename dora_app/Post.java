package dora_app;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.commons.fileupload.FileItem;


public class Post {

    private int postID;
    private String title;
    private String imageURL;
    private String description;
    private int rating;
    private int saveCounter;
    private int creatorID;
    private int spotID;


    public Post(String title, String description, int rating, int saveCounter, int creatorID, int spotID){
        this.title = title;
        this.description = description;
        this.rating = rating;
        this.creatorID = creatorID;
        this.saveCounter = saveCounter;
        this.spotID = spotID;
    }

    public Post(int postID, String title, String description, int rating, String imageURL, int saveCounter, int creatorID, int spotID){
        this.postID = postID;
        this.title = title;
        this.description = description;
        this.rating = rating;
        this.creatorID = creatorID;
        this.saveCounter = saveCounter;
        this.imageURL = imageURL;
        this.spotID = spotID;
    }

    public int getPostID() {
        return postID;
    }

    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }

    public String getImageURL() {
        return imageURL;
    }

    public int getRating(){
        return rating;
    }

    public int getSaveCounter(){
        return saveCounter;
    }

    public int getSpotID() {
        return spotID;
    }

    public int getCreatorID(){
        return creatorID;
    }

    public void saveImage(FileItem fileItem) throws Exception {
        String serverImagePath = "C:/Program Files/Apache Software Foundation/Tomcat 6.0/webapps/ismgroup71/images";

        File serverImageDirectory = new File(serverImagePath);

        // Create a unique name for the image
        String fileName = "post" + postID + "-pic.png";

        File imageFile = new File(serverImageDirectory, fileName);

        try {
            fileItem.write(imageFile);
        } catch (Exception e) {
            throw new Exception("Could not upload the post's image: " + e.getMessage());
        }

        // Set the path in which the file was saved
        this.imageURL = fileName;
    }

    public void saveNewPost() throws Exception {
        DBCon dbcon = new DBCon();
        Connection connection = null;
        
        try {
            connection = dbcon.getConnection();
            String insertQuery = "INSERT INTO post (title, description, accountid, spotid ,imageurl, rating, savecounter) VALUES (?, ?, ?, ?, ?, ?, 0)";

            PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
            // Set values for the parameters in the query


            preparedStatement.setString(1, title);
            preparedStatement.setString(2, description);
            preparedStatement.setInt(3, creatorID);
            preparedStatement.setInt(4, spotID);
            preparedStatement.setString(5, imageURL);
            preparedStatement.setInt(6, rating);

            // Execute the query
            preparedStatement.executeUpdate();

            preparedStatement.close();

        } catch (Exception e) {
            throw new Exception("Could not save the new post: " 
				+ e.getMessage()); 
        } finally {
            dbcon.close(connection);
        }
    }

    public void setNewPostIDFromDB() throws Exception{
        DBCon dbcon = new DBCon();
        Connection connection = null;
        int maxPostID = 0;

        try {
            connection = dbcon.getConnection();
            String selectQuery = "SELECT MAX(postid) AS max_postid FROM post";

            PreparedStatement preparedStatement = connection.prepareStatement(selectQuery);

            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                // Retrieve data from the result set
                maxPostID = rs.getInt("max_postid");
            }

            preparedStatement.close();
            rs.close();
        } catch (SQLException e) {
            throw new Exception(("Could not get max post ID: " 
				+ e.getMessage()));
        } finally {
            dbcon.close(connection);
        }

        this.postID = maxPostID + 1;
    }

    public static ArrayList<Post> getUserPosts(int userID) throws Exception {
        ArrayList<Post> userPosts = new ArrayList<>();

        DBCon dbcon = new DBCon();
        Connection connection = null;
        
        try {
            connection = dbcon.getConnection();
            String selectQuery = "SELECT * FROM post WHERE accountid = ?";

            PreparedStatement preparedStatement = connection.prepareStatement(selectQuery);
            // Set values for the parameters in the query
            preparedStatement.setInt(1, userID);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                // Retrieve data from the result set
                int postID = rs.getInt("postid");
                String title = rs.getString("title");
                String description = rs.getString("description");
                int rating = rs.getInt("rating");
                int creatorID = rs.getInt("accountid");
                int saveCounter = rs.getInt("savecounter");
                String imageURL = rs.getString("imageurl");
                int spotID = rs.getInt("spotid");
        
                // Create a new Post object and add it to the list
                userPosts.add(new Post(postID ,title, description, rating, imageURL, saveCounter, creatorID, spotID));
            }

            preparedStatement.close();
            rs.close();
        } catch (SQLException e) {
            throw new Exception(("Could not get users posts: " 
				+ e.getMessage()));
        } finally {
            dbcon.close(connection);
        }

        return userPosts;
    }

    public static ArrayList<Post> getLocationPosts(String area, String city) throws Exception {
        ArrayList<Post> locPosts = new ArrayList<>();

        DBCon dbcon = new DBCon();
        Connection connection = null;
        
        try {
            connection = dbcon.getConnection();
            String selectQuery = "SELECT post.postid, post.title, post.description, post.rating, post.savecounter, post.imageurl, post.spotid, post.accountid " +
                                " FROM post, spot, location WHERE post.spotid = spot.spotid " + 
                                " AND spot.locationid = location.locationid AND location.city = ? AND location.area = ?";

            PreparedStatement preparedStatement = connection.prepareStatement(selectQuery);
            // Set values for the parameters in the query
            preparedStatement.setString(1, city);
            preparedStatement.setString(2, area);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                // Retrieve data from the result set
                int postID = rs.getInt("postid");
                String title = rs.getString("title");
                String description = rs.getString("description");
                int rating = rs.getInt("rating");
                int creatorID = rs.getInt("accountid");
                int saveCounter = rs.getInt("savecounter");
                String imageURL = rs.getString("imageurl");
                int spotID = rs.getInt("spotid");
        
                // Create a new Post object and add it to the list
                locPosts.add(new Post(postID ,title, description, rating, imageURL, saveCounter, creatorID, spotID));
            }

            preparedStatement.close();
            rs.close();
        } catch (SQLException e) {
            throw new Exception(("Could not get loc posts: " 
				+ e.getMessage()));
        } finally {
            dbcon.close(connection);
        }

        return locPosts;
    }

    public static Post getPostByID(int postID) throws Exception{
        DBCon dbcon = new DBCon();
        Connection connection = null;
        Post post = null;

        try {
            connection = dbcon.getConnection();
            String selectQuery = "SELECT * FROM post WHERE postid = ?";

            PreparedStatement preparedStatement = connection.prepareStatement(selectQuery);

            preparedStatement.setInt(1, postID);

            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                // Retrieve data from the result set
                String title = rs.getString("title");
                String description = rs.getString("description");
                int rating = rs.getInt("rating");
                int creatorID = rs.getInt("accountid");
                int saveCounter = rs.getInt("savecounter");
                String imageURL = rs.getString("imageurl");
                int spotID = rs.getInt("spotid");
        
                // Create a new Post object and add it to the list
                post = new Post(postID ,title, description, rating, imageURL, saveCounter, creatorID, spotID);
            }

            preparedStatement.close();
            rs.close();
        } catch (SQLException e) {
            throw new Exception(("Could not get max post ID: " 
				+ e.getMessage()));
        } finally {
            dbcon.close(connection);
        }

        return post;
    }


    
    
}