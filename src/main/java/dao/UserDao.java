package dao;

import model.User;

import java.util.Map;

/**
 * Created by weiyang on 2014/9/12.
 */
public interface UserDao {
    public User login(String username, String password);
    public User getUserById(int id);
    public void updateLoginInfo(Map<String, Object> environment);
}
