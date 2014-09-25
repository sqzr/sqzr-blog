package dao;

import model.Article;

import java.util.List;

/**
 * Created by weiyang on 2014/9/14.
 */
public interface ArticleDao {
    public int add(Article article);

    public Article getArticleById(int id);

    public List<Article> list();

    public int deleteArticleById(int id);

    public int update(Article article);
}
