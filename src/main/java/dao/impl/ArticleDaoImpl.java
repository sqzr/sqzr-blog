package dao.impl;

import dao.ArticleDao;
import model.Article;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;

import javax.xml.transform.Result;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by weiyang on 2014/9/14.
 */
public class ArticleDaoImpl implements ArticleDao {
    private SqlSession sqlSession;

    @Override
    public int add(Article article) {
        sqlSession.insert("model.Article.add", article);
        return article.getId();
    }

    @Override
    public Article getArticleById(int id) {
        return sqlSession.selectOne("model.Article.getArticleById", id);
    }

    @Override
    public Article getArticleByUri(String uri) {
        return sqlSession.selectOne("model.Article.getArticleByUri", uri);
    }

    @Override
    public List<Article> list() {
        return sqlSession.selectList("model.Article.list");
    }

    @Override
    public List<Article> listDontDraft() {
        return sqlSession.selectList("model.Article.listDontDraft");
    }

    @Override
    public int deleteArticleById(int id) {
        return sqlSession.delete("model.Article.delete", id);
    }

    @Override
    public int update(Article article) {
        return sqlSession.update("model.Article.update", article);
    }

    @Override
    public int getCategoryIdByArticleId(int id) {
        return sqlSession.selectOne("model.Article.getCategoryIdByArticleId", id);
    }

    @Override
    public List<Article> getArticleByCategoryId(int c_id) {
        return sqlSession.selectList("model.Article.getArticleByCategoryId", c_id);
    }

    @Override
    public List<Article> getArticleByCategoryIdDontDraft(int c_id) {
        return sqlSession.selectList("model.Article.getArticleByCategoryIdDontDraft",c_id);
    }

    @Override
    public int getCountByUri(String uri) {
        Map<String, Object> condition = new HashMap<String, Object>();
        condition.put("uri", uri);
        return sqlSession.selectOne("model.Article.getCountByUri", condition);
    }

    @Override
    public int getCountByUri(String uri, int id) {
        Map<String, Object> condition = new HashMap<String, Object>();
        condition.put("uri", uri);
        condition.put("id", id);
        return sqlSession.selectOne("model.Article.getCountByUri",condition);
    }

    @Override
    public int moveArticleToDefaultCategory(int c_id) {
        return sqlSession.update("model.Article.moveArticleToDefaultCategory", c_id);
    }

    @Override
    public int getArticleCountByCategory(int c_id) {
        return sqlSession.selectOne("model.Article.getArticleCountByCategory",c_id);
    }

    @Override
    public int batchDelete(List<Integer> batch) {
        return sqlSession.delete("model.Article.batchDelete", batch);
    }

    // ---


    public SqlSession getSqlSession() {
        return sqlSession;
    }

    public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
}
