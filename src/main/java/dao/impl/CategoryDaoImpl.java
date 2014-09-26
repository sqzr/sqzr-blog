package dao.impl;

import dao.CategoryDao;
import model.Category;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

/**
 * Created by weiyang on 2014/9/18.
 */
public class CategoryDaoImpl implements CategoryDao {
    private SqlSession sqlSession;


    @Override
    public int add(Category category) {
        sqlSession.insert("model.Category.add", category);
        return category.getId();
    }

    public int delete(int id) {
        return sqlSession.delete("model.Category.delete", id);
    }

    @Override
    public int update(Category category) {
        return sqlSession.update("model.Category.update", category);
    }

    @Override
    public void plusCount(int id) {
        sqlSession.update("model.Category.plusCount", id);
    }

    @Override
    public void minusCount(int id) {
        sqlSession.update("model.Category.minusCount", id);
    }

    @Override
    public Category getCategoryById(int id) {
        return sqlSession.selectOne("model.Category.getCategoryById", id);
    }

    @Override
    public int getArticleCountByCategoryId(int id) {
        return sqlSession.selectOne("model.Category.getArticleCountByCategoryId", id);
    }


    @Override
    public List<Category> list() {
        return sqlSession.selectList("model.Category.list");
    }

    // ---


    public SqlSession getSqlSession() {
        return sqlSession;
    }

    public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
}
