package dao.impl;

import dao.UserDao;
import model.User;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by weiyang on 2014/9/12.
 */
public class UserDaoImpl implements UserDao {
    private SqlSession sqlSession;

    /**
     * 登陆
     * @param username
     * @param password
     * @return
     */
    @Override
    public User login(String username, String password) {
        Map<String, String> info = new HashMap<String, String>();
        info.put("username", username);
        info.put("password", password);
        User user = sqlSession.selectOne("model.User.loginCheck", info);
        return user;
    }

    /**
     * 更新登陆环境
     * @param environment
     */
    @Override
    public void updateLoginInfo(Map<String, Object> environment) {
        sqlSession.update("model.User.updateLoginInfo", environment);
    }

    @Override
    public int updatePassword(User user) {
        return sqlSession.update("model.User.updatePassword", user);
    }

    @Override
    public String getPassword(int id) {
        return sqlSession.selectOne("model.User.getPassword",id);
    }

    @Override
    public User getUserById(int id) {
        return null;
    }

    // ----


    public SqlSession getSqlSession() {
        return sqlSession;
    }

    public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
}
