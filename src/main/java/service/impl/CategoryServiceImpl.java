package service.impl;

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
    public boolean delete(int id) throws ParameterIsEmptyException, NotFoundException {
        if (id == 0) {
            throw new ParameterIsEmptyException("参数为空");
        }int result = categoryDao.delete(id);

        if (result == 0) {
            throw new NotFoundException();
        }
        return true;
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
}
