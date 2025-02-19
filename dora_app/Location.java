package dora_app;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Location{

    private int locID;
    private String city;
    private String area;

    public Location(int locID, String city, String area) {
        this.locID = locID;
        this.city = city;
        this.area = area;
    }

    public Location(String city, String area) {
        this.city = city;
        this.area = area;
    }

    public int getLocID() {
        return locID;
    }

    public String getCity() {
        return city;
    }

    public String getArea() {
        return area;
    }
    
    public static int createLocation(Location location) throws Exception {
			
		DBCon db = new DBCon();
		Connection con = null;
        int locID = 0;
		String query = "SELECT * FROM location WHERE city=? AND area=?";
		String sql = "INSERT INTO location(city, area) VALUES (?,?)";
        String query1 = "SELECT locationid FROM location WHERE city=? AND area=?";
    
        try {
			con = db.getConnection();
			PreparedStatement stm = con.prepareStatement(query);

			stm.setString(1, location.getCity());
            stm.setString(2, location.getArea());
			ResultSet rs = stm.executeQuery();

			if (!rs.next()) {
				PreparedStatement stmt = con.prepareStatement(sql);
				stmt.setString(1, location.getCity());
				stmt.setString(2, location.getArea());
				stmt.executeUpdate();
				stmt.close();

                PreparedStatement st = con.prepareStatement(query1);
                st.setString(1, location.getCity());
                st.setString(2, location.getArea());
			    ResultSet r = st.executeQuery();
                if (r.next()) {
                    locID = r.getInt("locationid");
                } 
                st.close();
                r.close();

			} else {
                    locID = rs.getInt("locationid");
            }

            stm.close();
			rs.close();
			db.close(con);

            return locID;

		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			try {
				db.close(con);
			} catch (Exception e) {
							
			}
		}	
}
 public static Location getLocationByID(int locID) throws Exception{
        DBCon dbcon = new DBCon();
        Connection connection = null;
        Location  location = null;

        try {
            connection = dbcon.getConnection();
            String selectQuery = "SELECT * FROM location WHERE locationid = ?";

            PreparedStatement preparedStatement = connection.prepareStatement(selectQuery);

            preparedStatement.setInt(1, locID);

            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                // Retrieve data from the result set
                int locationid = rs.getInt("locationid");
                String city = rs.getString("city");
                String area = rs.getString("area");
        
                // Create a new Location object and add it to the list
                location = new Location(locationid , city, area);
            }

            preparedStatement.close();
            rs.close();
        } catch (SQLException e) {
            throw new Exception(("Could not get  location ID: " 
				+ e.getMessage()));
        } finally {
            dbcon.close(connection);
        }

        return location;
    }
}