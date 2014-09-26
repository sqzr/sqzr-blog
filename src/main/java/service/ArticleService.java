package service;

import webException.NotFoundException;
import webException.ParameterIsEmptyException;
import model.Article;

import java.util.List;

/**
 * Created by weiyang on 2014/9/14.
 */
public interface ArticleService {
    public int add(Article article);

    public Article getArticleById(int id) throws ParameterIsEmptyException, NotFoundException;

    public List<Article> list();

    /**
     * 通过id删除文章
     * @param id 文章id
     * @return
     * @throws ParameterIsEmptyException 没有传递参数
     * @throws NotFoundException 删除后没有影响条数
     */
    public boolean deleteArticleById(int id) throws ParameterIsEmptyException, NotFoundException;

    /**
     * 修改文章
     * @param article 包含需要修改的文章类
     * @return
     * @throws ParameterIsEmptyException 没有传递文章id
     * @throws NotFoundException 修改后没有影响行数
     */
    public boolean update(Article article) throws ParameterIsEmptyException, NotFoundException;

    /**
     * 获取指定分类下的所有文章
     * @param c_id
     * @return
     */
    public List<Article> getArticleByCategoryId(int c_id);
}
