package dao;

import model.Category;

import java.util.List;

/**
 * Created by weiyang on 2014/9/18.
 */
public interface CategoryDao {
    public int add(Category category);

    public List<Category> list();

    public int delete(int id);

    public int update(Category category);

    /**
     * 增加分类文章数
     * @param id 分类id
     * @param num 添加数量
     */
    public void plusCount(int id,int num);

    /**
     * 减少分类文章数
     * @param id 分类id
     * @param num 添加数量
     */
    public void minusCount(int id,int num);

    /**
     * 通过id获取分类
     * @param id
     * @return
     */
    public Category getCategoryById(int id);

    /**
     * 获取分类下存在多少文章
     * @param id
     * @return
     */
    public int getArticleCountByCategoryId(int id);

    /**
     * 设置默认分类
     * @param id
     * @return
     */
    public boolean setDefaultCategory(int id);

    /**
     * 获取默认分类
     * @return
     */
    public Category getDefault();

    /**
     * 通过uri获取分类
     * @param uri
     * @return
     */
    public Category getCategoryByUri(String uri);

    /**
     * 判断value是否已存在与column
     * @param name
     * @param uri
     * @return
     */
    public boolean checkValueExist(String name, String uri);

    /**
     * 除id外,判断value是否已存在与column
     * @param value
     * @param column 字段
     * @param id 排除id
     * @return
     */
    public boolean checkValueExist(String value, String column, int id);
}
