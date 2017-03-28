/**
 * Created by Radion on 26.03.2017.
 */
public class User {
    private String fullName;
    private String password;
    private String email;

    public User(String fullName, String password, String email) {
        this.fullName = fullName;
        this.password = password;
        this.email = email;
    }

    public String getFullName() {
        return fullName;
    }

    public String getPassword() {
        return password;
    }

    public String getEmail() {
        return email;
    }
}
