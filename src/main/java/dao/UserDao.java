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

    /**
     * 修改密码
     * @param user 包含密码以及用户id
     * @return
     */
    public int updatePassword(User user);

    /**
     * 获取用户密码
     */
    public String getPassword(int id);

    /**
     * 通过keeplogin获取user
     * @param keeplogin
     * @return
     */
    public User getUserByKeeplogin(String keeplogin);

    /**
     * 更新keeplogin
     * @param user
     * @return
     */
    public int updateKeeplogin(User user);
}
