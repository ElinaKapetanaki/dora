package dora_app;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserAccount extends Account {
    private String fullName;
    private int age;
    private String country;
    private String gender;
    private String bio;

    public UserAccount(String username, String password, String fullName, int age, String country, String gender,
            String bio) {
        super(username, password);
        this.fullName = fullName;
        this.age = age;
        this.country = country;
        this.gender = gender;
        this.bio = bio;
    }

    public UserAccount(int accountid, String username, String password, String fullName, int age, String country,
            String gender, String bio) {
        super(accountid, username, password);
        this.fullName = fullName;
        this.age = age;
        this.country = country;
        this.gender = gender;
        this.bio = bio;
    }

    public String getFullName() {
        return fullName;
    }

    public String getBio() {
        return bio;
    }

    public void register() throws Exception {
        DBCon dbcon = new DBCon();
        Connection connection = null;
        int accountid = 0;

        try {
            connection = dbcon.getConnection();
            String checkSql = "SELECT username FROM account WHERE username=?;";
            try (PreparedStatement checkStmt = connection.prepareStatement(checkSql)) {
                checkStmt.setString(1, getUsername());
                ResultSet rs = checkStmt.executeQuery();

                if (rs.next()) {
                    rs.close();
                    throw new Exception("Sorry, username already registered");
                }
            }
            String insertQuery = "INSERT INTO account (username, password) VALUES (?, ?)";
            String selectQuery = "SELECT accountid FROM account WHERE username=? AND password=?";
            String insertQuery2 = "INSERT INTO user_account (accountid, fullname, age, nationality, gender, bio) VALUES (?, ?, ?, ?, ?, ?)";

            PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            preparedStatement.executeUpdate();
            preparedStatement.close();

            PreparedStatement preparedStatement2 = connection.prepareStatement(selectQuery);
            preparedStatement2.setString(1, username);
            preparedStatement2.setString(2, password);
            ResultSet rs = preparedStatement2.executeQuery();
            if (rs.next()) {
                accountid = rs.getInt("accountid");
            }
            preparedStatement2.close();

            this.accountID = accountid;

            PreparedStatement preparedStatement3 = connection.prepareStatement(insertQuery2);
            preparedStatement3.setInt(1, accountid);
            preparedStatement3.setString(2, fullName);
            preparedStatement3.setInt(3, age);
            preparedStatement3.setString(4, country);
            preparedStatement3.setString(5, gender);
            preparedStatement3.setString(6, bio);
            preparedStatement3.executeUpdate();
            preparedStatement3.close();

        } catch (SQLException e) {
            throw new Exception("Could not save the user"
                    + e.getMessage());
        } finally {
            dbcon.close(connection);
        }

    }

    public static UserAccount getUserAccountById(int accountid) throws Exception {
        DBCon db = new DBCon();
        Connection con = null;
        UserAccount userAccount = null;
        String query = "SELECT * FROM user_account WHERE accountid=?;";
        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, accountid);
            ResultSet rs = stmt.executeQuery();
            if (!rs.next()) {
                stmt.close();
                rs.close();
                return null;
            }
            userAccount = new UserAccount(rs.getInt("accountid"), rs.getString("username"),
                    rs.getString("password"),
                    rs.getString("fullname"),
                    rs.getInt("age"),
                    rs.getString("nationality"),
                    rs.getString("gender"),
                    rs.getString("bio"));
            rs.close();
            stmt.close();
            return userAccount;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close(con);
            } catch (Exception e) {

            }
        }

    }

}