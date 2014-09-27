package service.impl;

import dao.ArticleDao;
import dao.CategoryDao;
import dao.LogDao;
import factory.LogFactory;
import model.Category;
import webException.*;
import model.Article;
import service.ArticleService;

import java.util.List;

/**
 * Created by weiyang on 2014/9/14.
 */
public class ArticleServiceImpl implements ArticleService {
    private ArticleDao articleDao;
    private LogDao logDao;
    private CategoryDao categoryDao;

    @Override
    public int add(Article article) {
        // 添加日志
        logDao.addLog(LogFactory.build("addArticle",article.getTitle(),"true"));
        // 记录数加一
        categoryDao.plusCount(article.getCategory().getId());
        return articleDao.add(article);
    }

    @Override
    public Article getArticleById(int id) throws ParameterIsEmptyException, NotFoundException {
        if (id == 0) {
            // 未传值
            throw new ParameterIsEmptyException("参数错误");
        }
        Article article = articleDao.getArticleById(id);
        if (article == null) {
            // 未找到
            throw new NotFoundException();
        }
        return article;
    }

    @Override
    public List<Article> list() {
        return articleDao.list();
    }

    @Override
    public boolean deleteArticleById(int id) throws ParameterIsEmptyException, NotFoundException {
        if (id == 0) {
            throw new ParameterIsEmptyException("参数错误");
        }
        categoryDao.minusCount(articleDao.getCategoryIdByArticleId(id));
        int result = articleDao.deleteArticleById(id);
        if (result == 0) {
            throw new NotFoundException();
        }
        logDao.addLog(LogFactory.build("deleteArticle", String.valueOf(id), "true"));
        return true;
    }

    @Override
    public boolean update(Article article,int new_c_id) throws ParameterIsEmptyException, NotFoundException {
        if (article.getId() == 0) {
            throw new ParameterIsEmptyException("参数错误");
        }
        // 判断是否有更改过分类
        if (article.getCategory().getId() != new_c_id) {
            categoryDao.plusCount(article.getCategory().getId());
            categoryDao.minusCount(new_c_id);
        }
        int result = articleDao.update(article);
        if (result == 0) {
            throw new NotFoundException();
        }
        logDao.addLog(LogFactory.build("updateArticle", String.valueOf(article.getId()), "true"));
        return true;
    }

    @Override
    public List<Article> getArticleByCategoryId(int c_id) {
        return articleDao.getArticleByCategoryId(c_id);
    }

    // ---


    public CategoryDao getCategoryDao() {
        return categoryDao;
    }

    public void setCategoryDao(CategoryDao categoryDao) {
        this.categoryDao = categoryDao;
    }

    public LogDao getLogDao() {
        return logDao;
    }

    public void setLogDao(LogDao logDao) {
        this.logDao = logDao;
    }

    public ArticleDao getArticleDao() {
        return articleDao;
    }

    public void setArticleDao(ArticleDao articleDao) {
        this.articleDao = articleDao;
    }
}
