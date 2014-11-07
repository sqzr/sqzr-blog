package dao.impl;

import com.google.common.collect.ImmutableMap;
import com.sun.org.apache.xpath.internal.operations.Bool;
import dao.CommentDao;
import model.Comment;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

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

    @Override
    public List<Comment> get() {
        return sqlSession.selectList("model.Comment.get");
    }

    @Override
    public List<Comment> get(String status) {
//        ImmutableMap<String,String> condition = ImmutableMap.of("status", status);
        Map<String, String> condition = new HashMap<String, String>();
        condition.put("status", status);
        return sqlSession.selectList("model.Comment.get", condition);
    }

    @Override
    public List<Comment> get(String stauts, int aid) {
        Map<String, Object> condition = new HashMap<String, Object>();
        condition.put("status", stauts);
        condition.put("aid", aid);
        return sqlSession.selectList("model.Comment.get", condition);
    }

    @Override
    public List<Comment> get(boolean waiting, boolean spam) {
        Map<String, Boolean> condition = new HashMap<String, Boolean>();
        if (!waiting) {
            condition.put("waiting", true);
        }
        if (!spam) {
            condition.put("spam", true);
        }
        return sqlSession.selectList("model.Comment.get",condition);
    }

    @Override
    public int delete(int id) {
        return sqlSession.delete("model.Comment.delete", id);
    }

    @Override
    public int delete(List<Integer> batch) {
        return sqlSession.delete("model.Comment.batchDelete",batch);
    }

    @Override
    public int getStatusCount(String column) {
        Map<String, Boolean> columnMap = new HashMap<String, Boolean>();
        if (column == "approved") {
            columnMap.put("approved", true);
        }
        if (column == "waiting") {
            columnMap.put("waiting", true);
        }
        if (column == "spam") {
            columnMap.put("spam", true);
        }
        return sqlSession.selectOne("model.Comment.getStatusCount", columnMap);
    }

    @Override
    public int getStatusCount(String column, int aid) {
        Map<String, Object> condition = new HashMap<String, Object>();
        if (column == "approved") {
            condition.put("approved", true);
        }
        if (column == "waiting") {
            condition.put("waiting", true);
        }
        if (column == "spam") {
            condition.put("spam", true);
        }
        condition.put("aid", aid);
        return sqlSession.selectOne("model.Comment.getStatusCount", condition);
    }

    @Override
    public int updateStatus(int id, String status) {
        ImmutableMap<String,String> condition = ImmutableMap.of("id",String.valueOf(id),"status",status);
        return sqlSession.update("model.Comment.updateStatus", condition);
    }

    @Override
    public int getArticleIdByCommentId(int id) {
        return sqlSession.selectOne("model.Comment.getArticleIdByCommentId", id);
    }

    // ---


    public SqlSession getSqlSession() {
        return sqlSession;
    }

    public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
}
