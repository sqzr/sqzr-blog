package dao;

import com.sun.org.apache.xml.internal.security.algorithms.implementations.SignatureDSA;
import model.Category;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

/**
 * Created by weiyang on 2014/9/18.
 */
public interface CategoryDao {
    public int add(Category category);

    public List<Category> list();

    public int delete(int id);

    public int update(Category category);

    public void plusCount(int id);

    public void minusCount(int id);

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
}
