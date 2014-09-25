package service;

import model.User;

import java.util.Map;

/**
 * Created by weiyang on 2014/9/12.
 */
public interface UserService {
    public User login(String username, String password);
}
