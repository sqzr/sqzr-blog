package service;

import model.Category;
import webException.NotFoundException;
import webException.ParameterIsEmptyException;

import java.util.List;

/**
 * Created by weiyang on 2014/9/18.
 */
public interface CategoryService {
    /**
     * 添加分类
     * @param category
     * @return -1 分类名为空
     * @return -2 uri为空
     * @return -3 分类名已存在
     * @return -4 uri已存在
     * @return -5 添加失败
     * @return 受影响行数
     */
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

    /**
     * 更新分类
     * @param category
     * @return -1 分类名为空
     * @return -2 uri为空
     * @return -3 分类名已存在
     * @return -4 uri已存在
     * @return -5 参数错误
     * @return -6 修改失败
     * @return 受影响行数
     */
    public int update(Category category);

    public Category getCategoryById(int id);

    /**
     * 设置默认分类
     * @param id
     * @return
     */
    public boolean setDefaultCategory(int id);


}
