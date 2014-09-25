package service.impl;

import dao.ArticleDao;
import dao.LogDao;
import factory.LogFactory;
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
    @Override
    public int add(Article article) {
        // 添加日志
        logDao.addLog(LogFactory.build("addArticle",article.getTitle(),"true"));
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

    /**
     * 通过id删除文章
     * @param id 文章id
     * @return
     * @throws ParameterIsEmptyException 没有传递参数
     * @throws NotFoundException 删除后没有影响条数
     */
    @Override
    public boolean deleteArticleById(int id) throws ParameterIsEmptyException, NotFoundException {
        if (id == 0) {
            throw new ParameterIsEmptyException("参数错误");
        }
        int result = articleDao.deleteArticleById(id);
        if (result == 0) {
            throw new NotFoundException();
        }
        logDao.addLog(LogFactory.build("deleteArticle", String.valueOf(id), "true"));
        return true;
    }

    /**
     * 修改文章
     * @param article 包含需要修改的文章类
     * @return
     * @throws ParameterIsEmptyException 没有传递文章id
     * @throws NotFoundException 修改后没有影响行数
     */
    @Override
    public boolean update(Article article) throws ParameterIsEmptyException, NotFoundException {
        if (article.getId() == 0) {
            throw new ParameterIsEmptyException("参数错误");
        }
        int result = articleDao.update(article);
        if (result == 0) {
            throw new NotFoundException();
        }
        logDao.addLog(LogFactory.build("updateArticle", String.valueOf(article.getId()), "true"));
        return true;
    }

    // ---


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
