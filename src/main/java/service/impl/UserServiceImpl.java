package service.impl;

import dao.LogDao;
import dao.UserDao;
import factory.LogFactory;
import model.Log;
import model.User;
import org.apache.commons.codec.digest.DigestUtils;
import service.UserService;
import util.CookieUtil;
import util.EnvironmentInfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * Created by weiyang on 2014/9/12.
 */
public class UserServiceImpl implements UserService {
    private UserDao userDao;
    private LogDao logDao;
    @Override
    public User login(String username, String password) {
        User user = userDao.login(username, password);
        // 日志对象
        Log log = new Log();
        log.setIp(EnvironmentInfo.getIpAddr());
        log.setUseragent(EnvironmentInfo.getUserAgent());
        log.setType("login");
        log.setDate(new Date());
        log.setContent("username:" + username + "-password:" + password);
        if (user != null) {
            // 登陆成功,更新登陆记录
            Map<String, Object> environmentInfo = new HashMap<String, Object>();
            environmentInfo.put("id", user.getId());
            environmentInfo.put("lastloginip", EnvironmentInfo.getIpAddr());
            environmentInfo.put("lastloginuseragent", EnvironmentInfo.getUserAgent());
            userDao.updateLoginInfo(environmentInfo);
            log.setResult("true");
        }else{
            log.setResult("false");
        }
        logDao.addLog(log);
        return user;
    }

    @Override
    public boolean logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        User user = (User) session.getAttribute("user");
        this.updateKeeplogin(user.getId());
        session.setAttribute("user", null);
        CookieUtil.removeCookie(request, response, "keeplogin");
        return true;
    }

    @Override
    public boolean updatePassword(String newPassword, String oldPassword, int id) {
        Log log = LogFactory.build("updatePassword", "newPassword:" + newPassword + "---" + oldPassword);
        if (!userDao.getPassword(id).equals(oldPassword)) {
            log.setResult("false");
            logDao.addLog(log);
            return false;
        }
        User user = new User(id, newPassword);
        if (userDao.updatePassword(user) == 0) {
            log.setResult("false");
            logDao.addLog(log);
            return false;
        }
        log.setResult("true");
        logDao.addLog(log);
        return true;
    }

    @Override
    public User getUserByKeeplogin(String keeplogin) {
        return userDao.getUserByKeeplogin(keeplogin);
    }

    @Override
    public String updateKeeplogin(int id) {
        User user = new User();
        String keeplogin = DigestUtils.md5Hex(String.valueOf(new Random().nextInt()));
        user.setId(id);
        user.setKeeplogin(keeplogin);
        userDao.updateKeeplogin(user);
        return keeplogin;
    }

    // ---


    public LogDao getLogDao() {
        return logDao;
    }

    public void setLogDao(LogDao logDao) {
        this.logDao = logDao;
    }

    public UserDao getUserDao() {
        return userDao;
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }
}
