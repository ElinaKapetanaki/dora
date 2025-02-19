package dora_app;

public class BusinessAccount extends Account {
    private int businessSpot;

    public BusinessAccount(int accountid, String username, String password, int businessSpot) {
        super(accountid, username, password);
        this.businessSpot = businessSpot;
    }
    
}
