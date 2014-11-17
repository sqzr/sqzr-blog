package dao.impl;

import dao.OptionDao;
import handler.MapResultHandler;
import model.Option;
import org.apache.ibatis.session.SqlSession;

import java.util.Map;

/**
 * Created by weiyang on 2014/10/7.
 */
public class OptionDaoImpl implements OptionDao {
    private SqlSession sqlSession;

    @Override
    public Map<String, String> getAllOption() {
        MapResultHandler mapResultHandler = new MapResultHandler();
        sqlSession.select("model.Option.getAllOption", mapResultHandler);
        return mapResultHandler.getMappedResults();
//        return sqlSession.selectMap("model.Option.getAllOption", null, "name");
    }

    @Override
    public int update(Option option) {
        return sqlSession.update("model.Option.update", option);
    }

    // ---


    public SqlSession getSqlSession() {
        return sqlSession;
    }

    public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
}
