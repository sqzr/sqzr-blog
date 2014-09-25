package dao.impl;

import dao.LogDao;
import model.Log;
import org.apache.ibatis.session.SqlSession;

/**
 * Created by weiyang on 2014/9/13.
 */
public class LogDaoImpl implements LogDao {

    private SqlSession sqlSession;
    /**
     * 添加日志
     * @param log
     */
    @Override
    public void addLog(Log log) {
        sqlSession.insert("model.Log.addLog",log);
    }

    // ---


    public SqlSession getSqlSession() {
        return sqlSession;
    }

    public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
}
