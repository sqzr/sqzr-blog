package service;

import webException.NotFoundException;
import webException.ParameterIsEmptyException;
import model.Article;

import java.util.List;

/**
 * Created by weiyang on 2014/9/14.
 */
public interface ArticleService {
    public int add(Article article);

    public Article getArticleById(int id) throws ParameterIsEmptyException, NotFoundException;

    public List<Article> list();

    public boolean deleteArticleById(int id) throws ParameterIsEmptyException, NotFoundException;

    public boolean update(Article article) throws ParameterIsEmptyException, NotFoundException;
}
