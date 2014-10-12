package service.impl;

import dao.ArticleDao;
import dao.CategoryDao;
import dao.LogDao;
import dao.impl.LogDaoImpl;
import factory.LogFactory;
import model.Category;
import service.CategoryService;
import webException.NotFoundException;
import webException.ParameterIsEmptyException;

import java.util.List;

/**
 * Created by weiyang on 2014/9/18.
 */
public class CategoryServiceImpl implements CategoryService {
    private CategoryDao categoryDao;
    private LogDao logDao;
    private ArticleDao articleDao;

    @Override
    public int add(Category category) {
        int result = categoryDao.add(category);
        if (result > 0) {
            logDao.addLog(LogFactory.build("addCategory",category.getName(),"true"));
        }else{
            logDao.addLog(LogFactory.build("addCategory",category.getName(),"false"));
        }
        return result;
    }

    @Override
    public List<Category> list() {
        return categoryDao.list();
    }

    @Override
    public int delete(int id){
        if (id == 0) {
            return -1;
        }
        int articleCount = articleDao.getArticleCountByCategory(id);
        if (articleCount > 0) {
            int addArticleCount = articleDao.moveArticleToDefaultCategory(id);
            categoryDao.plusCount(categoryDao.getDefault().getId(),addArticleCount);
        }
        int result = categoryDao.delete(id);
        if (result == 0) {
            return -2;
        }
        return result;
    }

    @Override
    public boolean update(Category category) {
        if (category.getId() == 0) {
            return false;
        }
        int result = categoryDao.update(category);
        if (result == 0) {
            return false;
        }
        return true;
    }

    @Override
    public Category getCategoryById(int id) {
        return categoryDao.getCategoryById(id);
    }

    @Override
    public boolean setDefaultCategory(int id) {
        return categoryDao.setDefaultCategory(id);
    }



    // ---


    public ArticleDao getArticleDao() {
        return articleDao;
    }

    public void setArticleDao(ArticleDao articleDao) {
        this.articleDao = articleDao;
    }

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
}
