package model;

/**
 * Created by weiyang on 2014/9/11.
 */
public class User {
    private int id;
    private String username;
    private String password;
    private String keeplogin;
    private int g_id;
    private String avatar;
    private String lastloginip;
    private String lastloginuseragent;

    public User() {
    }

    public User(int id, String password) {
        this.id = id;
        this.password = password;
    }

    public String getKeeplogin() {
        return keeplogin;
    }

    public void setKeeplogin(String keeplogin) {
        this.keeplogin = keeplogin;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getG_id() {
        return g_id;
    }

    public void setG_id(int g_id) {
        this.g_id = g_id;
    }

    public String getLastloginip() {
        return lastloginip;
    }

    public void setLastloginip(String lastloginip) {
        this.lastloginip = lastloginip;
    }

    public String getLastloginuseragent() {
        return lastloginuseragent;
    }

    public void setLastloginuseragent(String lastloginuseragent) {
        this.lastloginuseragent = lastloginuseragent;
    }
}
