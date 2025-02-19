package dora_app;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class Spot {
    private int spotID;
    private String name;
    private String info;
    private String category;
    private int viewCounter;
    private int locID;

    public Spot(int spotID, String name, String info, String category, int viewCounter, int locID) {
        this.spotID = spotID;
        this.name = name;
        this.info = info;
        this.category = category;
        this.viewCounter = viewCounter;
        this.locID = locID;
    }

    public Spot( String name, String category, int locID) {
        this.name = name;
        this.category = category;
        this.locID = locID;
    }

    public int getSpotid() {
        return spotID;
    }

    public String getName() {
        return name;
    }

    public String getInfo() {
        return info;
    }

    public String getCategory() {
        return category;
    }

    public int getViewCounter() {
        return viewCounter;
    }

    public int getLocationID() {
        return locID;
    }

    public static int createSpot(Spot spot) throws Exception {
			
		DBCon db = new DBCon();
		Connection con = null;
        int spotid = 0;
		String query = "SELECT * FROM spot WHERE name=?;";
		String sql = "INSERT INTO spot(spotid, name, info, category, viewcounter, locationid) VALUES (?,?,?,?,0,?);";
        String query1 = "SELECT spotid FROM spot WHERE name=?;";

		try {
			con = db.getConnection();
			PreparedStatement stm = con.prepareStatement(query);

			stm.setString(1, spot.getName());
			ResultSet rs = stm.executeQuery();
			if (!rs.next()) {
				PreparedStatement stmt = con.prepareStatement(sql);
				stmt.setInt(1, spot.getSpotid());
				stmt.setString(2, spot.getName());
				stmt.setString(3, spot.getInfo());
				stmt.setString(4, spot.getCategory());
                stmt.setInt(5, spot.getLocationID());
				stmt.executeUpdate();
				stmt.close();
                PreparedStatement st = con.prepareStatement(query1);
                st.setString(1, spot.getName());
			    ResultSet r = st.executeQuery();
                if (r.next()) {
                    spotid= r.getInt("spotid");
                } 
			} else {
                spotid = rs.getInt("spotid");
            }
            stm.close();
			rs.close();
			db.close(con);
            return spotid;
		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			try {
				db.close(con);
			} catch (Exception e) {
							
			}
		}	
	} //end of createspot

    public static Spot getSpotById(int spotid) throws Exception {
        DBCon db = new DBCon();
        Connection con = null;
        Spot spot = null;
        String query ="SELECT * FROM spot WHERE spotid=?;";

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);

            //setting parameter
            stmt.setInt(1, spotid);
            ResultSet rs = stmt.executeQuery();
            if (!rs.next()) {
                rs.close();
                stmt.close();
                return null;
            }

            spot = new Spot(rs.getInt("spotid"),
                            rs.getString("name"),
                            rs.getString("info"),
                            rs.getString("category"),
                            rs.getInt("viewCounter"),
                            rs.getInt("locationid"));
            rs.close();
            stmt.close();
            return spot;

        } catch(Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close(con);
            } catch(Exception e) {

            }
        }
    }
}
