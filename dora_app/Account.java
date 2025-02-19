package dora_app;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class Account {
    protected int accountID;
    protected String username;
    protected String password;


    public Account(int accountID, String username, String password) {
    this.accountID = accountID;
    this.username = username;
    this.password = password;
    }

    public Account( String username, String password) {
    this.username = username;
    this.password = password;
    }

    public void setUsername(String username) {
    this.username = username;
    }

    public void setPassword(String password) {
    this.password = password;
    }

    public int getAccountID(){
    return accountID;
    }


    public String getUsername(){
    return username;
    }

    public String getPassword() {
        return password;
    }
    

    public static Account logIn(String username, String password) throws Exception {
        Account account = null;
        DBCon db = new DBCon();
        Connection con = null;
        String query = "SELECT accountid FROM account WHERE username = ? AND password = ?";
        String query1 = "SELECT * FROM user_account WHERE accountid= ?";
         String query2 = "SELECT spotid FROM business_account WHERE accountid= ?";

        try {
            
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);

            // setting parameters
            stmt.setString(1, username);
            stmt.setString(2, password);

            // Execute the query
            ResultSet rs = stmt.executeQuery();

            // case not valid credentials
            if (!rs.next()) {
                rs.close();
                stmt.close();
                db.close(con);
                return null;
            }

            int accountid = rs.getInt("accountid");

            PreparedStatement stm = con.prepareStatement(query1);
            // setting parameters
            stm.setInt(1, accountid);
            

            // Execute the query
            ResultSet rts = stm.executeQuery();

            if (rts.next()) {

                // case valid credentials
             account = new UserAccount(accountid, username, password,
            rts.getString("fullname"),
            rts.getInt("age"),
            rts.getString("nationality"),
            rts.getString("gender"),
            rts.getString("bio"));
            } else {
            PreparedStatement st = con.prepareStatement(query2);
            // setting parameters
            st.setInt(1, accountid);
            

            // Execute the query
            ResultSet r = st.executeQuery();
            if (r.next()) {
            int spotid = r.getInt("spotid");
             account = new BusinessAccount(accountid, username, password, spotid);
            }
            }

            // Close resources
            rs.close();
            stmt.close();
            db.close(con);

            return account;

        } catch (SQLException e) {
            throw new Exception("Error during login."+ e.getMessage());
        } finally {
			try {
				db.close(con);
			} catch (Exception e) {
							
		    }
        }
    } 

}