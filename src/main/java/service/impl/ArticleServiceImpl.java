package service.impl;

import other.Page;
import other.PageHelper;
import dao.ArticleDao;
import dao.CategoryDao;
import dao.LogDao;
import factory.LogFactory;
import opensource.jpinyin.PinyinFormat;
import opensource.jpinyin.PinyinHelper;
import webException.*;
import model.Article;
import service.ArticleService;

import java.util.List;
import java.util.Random;

/**
 * Created by weiyang on 2014/9/14.
 */
public class ArticleServiceImpl implements ArticleService {
    private ArticleDao articleDao;
    private LogDao logDao;
    private CategoryDao categoryDao;

    @Override
    public int add(Article article) {
        // 判断标题是否为空
        if ("".equals(article.getTitle())) {
            return -1;
        }
        // 判断是否选择分类
        if (article.getCategory().getId() == 0) {
            return -2;
        }
        // 判断uri是否为空
        if ("".equals(article.getUri())) {
            // 自动生成uri
            article.setUri(PinyinHelper.convertToPinyinString(article.getTitle().replace(" ", ""), "-", PinyinFormat.WITHOUT_TONE));
            // 判断自动生成的uri 是否存在
            int count = articleDao.getCountByUri(article.getUri());
            if (count > 0) {
                article.setUri(article.getUri() + "-" + new Random().nextInt());
            }
        } else {
            // 判断用户自己输的uri是否存在
            int count = articleDao.getCountByUri(article.getUri());
            if (count > 0) {
                // 重复
                return -3;
            }
        }
        // 添加日志
        logDao.addLog(LogFactory.build("addArticle", article.getTitle(), "true"));
        // 记录数加一
        categoryDao.plusCount(article.getCategory().getId(),1);
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
    public Page<Article> list(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        Page<Article> page = (Page<Article>) articleDao.list();
        return page;
    }

    @Override
    public int delete(int id) {
        if (id == 0) {
            return -1;
        }
        categoryDao.minusCount(articleDao.getCategoryIdByArticleId(id),1);
        int result = articleDao.deleteArticleById(id);
        if (result == 0) {
            return -2;
        }
        return result;
    }

    @Override
    public int update(Article article,int new_c_id) throws ParameterIsEmptyException, NotFoundException {
        if (article.getId() == 0) {
            throw new ParameterIsEmptyException("参数错误");
        }
        // 判断标题是否为空
        if ("".equals(article.getTitle())) {
            return -1;
        }
        // 判断是否选择分类
        if (article.getCategory().getId() == 0) {
            return -2;
        }
        // 判断uri是否重复
        if ("".equals(article.getUri())) {
            // 自动生成uri
            article.setUri(PinyinHelper.convertToPinyinString(article.getTitle().replace(" ", ""), "-", PinyinFormat.WITHOUT_TONE));
            // 判断自动生成的uri 是否存在
            int count = articleDao.getCountByUri(article.getUri());
            if (count > 0) {
                article.setUri(article.getUri() + "-" + new Random().nextInt());
            }
        } else {
            // 判断用户自己输的uri是否存在
            int count = articleDao.getCountByUri(article.getUri());
            if (count > 0) {
                // 重复
                return -3;
            }
        }
        // 判断是否有更改过分类
        if (article.getCategory().getId() != new_c_id) {
            categoryDao.plusCount(article.getCategory().getId(),1);
            categoryDao.minusCount(new_c_id,1);
        }
        int result = articleDao.update(article);
        if (result == 0) {
            throw new NotFoundException();
        }
        logDao.addLog(LogFactory.build("updateArticle", String.valueOf(article.getId()), "true"));
        return 1;
    }

    @Override
    public List<Article> getArticleByCategoryId(int c_id) {
        return articleDao.getArticleByCategoryId(c_id);
    }

    @Override
    public Article getArticleByUri(String uri) {
        return articleDao.getArticleByUri(uri);
    }

    @Override
    public List<Article> getArticleListByCategoryUri(String uri) {
        return articleDao.getArticleByCategoryId(categoryDao.getCategoryByUri(uri).getId());
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
