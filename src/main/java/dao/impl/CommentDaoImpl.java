package dao.impl;

import dao.CommentDao;
import model.Comment;
import org.apache.ibatis.session.SqlSession;

/**
 * Created by weiyang on 2014/10/26.
 */
public class CommentDaoImpl implements CommentDao {
    private SqlSession sqlSession;
    @Override
    public int add(Comment comment) {
        sqlSession.insert("model.Comment.add", comment);
        return comment.getId();
    }

    // ---


    public SqlSession getSqlSession() {
        return sqlSession;
    }

    public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
}
