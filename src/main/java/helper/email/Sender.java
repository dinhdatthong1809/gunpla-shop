package helper.email;

public class Sender {
    /* class's variables */

    /* instance variables */
    private String user;
    private String pass;
    private final static String DEFAULT_USER = "thongddps08464@fpt.edu.vn";
    private final static String DEFAULT_PASS = "Dinhdatthong1809";

    /* class's constructors */
    public Sender(String user, String pass) {
	this.user = user;
	this.pass = pass;
    }

    public Sender() {
	this(DEFAULT_USER, DEFAULT_PASS);
    }

    /* getters - setters */
    public String getUser() {
	return user;
    }

    public void setUser(String user) {
	this.user = user;
    }

    public String getPass() {
	return pass;
    }

    public void setPass(String pass) {
	this.pass = pass;
    }
}
