package service;

import model.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * Created by weiyang on 2014/9/12.
 */
public interface UserService {
    public User login(String username, String password);

    /**
     * 注销
     * @return
     */
    public boolean logout(HttpSession session,HttpServletRequest request, HttpServletResponse response);

    /**
     * 修改密码
     * @param newPassword 新密码
     * @param oldPassword 旧密码
     * @param id 用户id
     * @return
     */
    public boolean updatePassword(String newPassword, String oldPassword, int id);

    /**
     * 通过keeplogin获取user
     * @param keeplogin
     * @return
     */
    public User getUserByKeeplogin(String keeplogin);

    /**
     * 更新keeplogin
     * @param id
     * @return keeplogin值
     */
    public String updateKeeplogin(int id);
}
