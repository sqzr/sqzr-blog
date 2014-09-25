package dao.impl;

import dao.ArticleDao;
import model.Article;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

/**
 * Created by weiyang on 2014/9/14.
 */
public class ArticleDaoImpl implements ArticleDao {
    private SqlSession sqlSession;

    /**
     * 添加文章
     * @param article
     * @return 新增文章的id
     */
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
    public List<Article> list() {
        return sqlSession.selectList("model.Article.list");
    }

    /**
     * 删除文章
     * @param id
     * @return 受影响行数
     */
    @Override
    public int deleteArticleById(int id) {
        return sqlSession.delete("model.Article.delete", id);
    }

    @Override
    public int update(Article article) {
        return sqlSession.update("model.Article.update", article);
    }

    // ---


    public SqlSession getSqlSession() {
        return sqlSession;
    }

    public void setSqlSession(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
}
