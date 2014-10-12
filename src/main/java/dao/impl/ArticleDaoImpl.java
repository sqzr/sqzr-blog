package dao.impl;

import dao.ArticleDao;
import model.Article;
import org.apache.ibatis.session.SqlSession;

import javax.xml.transform.Result;
import java.util.List;

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
    public int getCountByUri(String uri) {
        return sqlSession.selectOne("model.Article.getCountByUri", uri);
    }

    @Override
    public int moveArticleToDefaultCategory(int c_id) {
        return sqlSession.update("model.Article.moveArticleToDefaultCategory", c_id);
    }

    @Override
    public int getArticleCountByCategory(int c_id) {
        return sqlSession.selectOne("model.Article.getArticleCountByCategory",c_id);
    }

    // ---


    public SqlSession getSqlSession() {
        return sqlSession;
    }

    public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
}
