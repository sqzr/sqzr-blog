package service;

import model.Category;
import webException.NotFoundException;
import webException.ParameterIsEmptyException;

import java.util.List;

/**
 * Created by weiyang on 2014/9/18.
 */
public interface CategoryService {
    public int add(Category category);

    public List<Category> list();

    public boolean delete(int id) throws ParameterIsEmptyException, NotFoundException;

    public boolean update(Category category);

    public Category getCategoryById(int id);
}
