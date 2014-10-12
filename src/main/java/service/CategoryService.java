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

    /**
     * 删除分类
     * @param id
     * @return -1 参数错误
     * @return -2 没有受影响行数
     * @return
     */
    public int delete(int id);

    public boolean update(Category category);

    public Category getCategoryById(int id);

    /**
     * 设置默认分类
     * @param id
     * @return
     */
    public boolean setDefaultCategory(int id);


}
