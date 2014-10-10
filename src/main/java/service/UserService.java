package service;

import model.User;

import java.util.Map;

/**
 * Created by weiyang on 2014/9/12.
 */
public interface UserService {
    public User login(String username, String password);

    /**
     * 修改密码
     * @param newPassword 新密码
     * @param oldPassword 旧密码
     * @param id 用户id
     * @return
     */
    public boolean updatePassword(String newPassword, String oldPassword, int id);
}
