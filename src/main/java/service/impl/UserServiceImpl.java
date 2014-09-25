package service.impl;

import dao.LogDao;
import dao.UserDao;
import model.Log;
import model.User;
import service.UserService;
import util.EnvironmentInfo;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

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
