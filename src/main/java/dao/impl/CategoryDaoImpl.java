package dao.impl;

import dao.CategoryDao;
import model.Category;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public void plusCount(int id,int num) {
        Map<String, Integer> temp = new HashMap<String, Integer>();
        temp.put("id", id);
        temp.put("num", num);
        sqlSession.update("model.Category.plusCount", temp);
    }

    @Override
    public void minusCount(int id,int num) {
        Map<String, Integer> temp = new HashMap<String, Integer>();
        temp.put("id", id);
        temp.put("num", num);
        sqlSession.update("model.Category.minusCount", temp);
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
    public boolean setDefaultCategory(int id) {
        sqlSession.update("model.Category.clearDefault");
        if (sqlSession.update("model.Category.setDefault", id) > 0) {
            return true;
        } else {
            return false;
        }

    }

    @Override
    public Category getDefault() {
        return sqlSession.selectOne("model.Category.getDefault");
    }

    @Override
    public Category getCategoryByUri(String uri) {
        return sqlSession.selectOne("model.Category.getCategoryByUri", uri);
    }

    public boolean checkValueExist(String value, String column) {
        Map<String, Object> condition = new HashMap<String, Object>();
        condition.put(column, value);
        int result = sqlSession.selectOne("model.Category.checkValueExist", condition);
        return (result != 0) ? true : false;
    }

    @Override
    public boolean checkValueExist(String value, String column, int id) {
        Map<String, Object> condition = new HashMap<String, Object>();
        condition.put(column, value);
        condition.put("id", id);
        int result = sqlSession.selectOne("model.Category.checkValueExist", condition);
        return (result != 0) ? true : false;
    }

    @Override
    public int getCount() {
        return sqlSession.selectOne("model.Category.getCount");
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
