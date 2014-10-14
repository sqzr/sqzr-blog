package service;

import other.Page;
import webException.NotFoundException;
import webException.ParameterIsEmptyException;
import model.Article;

import java.util.List;

/**
 * Created by weiyang on 2014/9/14.
 */
public interface ArticleService {
    /**
     * 添加文章
     * @param article
     * @return int -1 标题为空
     * @return int -2 分类未选
     * @return int -3 uri重复
     */
    public int add(Article article);

    public Article getArticleById(int id) throws ParameterIsEmptyException, NotFoundException;

    public List<Article> list();

    public Page<Article> list(int pageNum,int pageSize);

    /**
     * 删除文章
     * @param id 文章id
     * @return -1 参数错误
     * @return -2 没有受影响行数
     * @return 受影响行数
     */
    public int delete(int id);

    /**
     * 修改文章
     * @param article 包含需要修改的文章类
     * @return int 1 修改成功
     * @return int -1 标题为空
     * @return int -2 没有选择分类
     * @return int -3 uri重复
     * @throws ParameterIsEmptyException 没有传递文章id
     * @throws NotFoundException 修改后没有影响行数
     */
    public int update(Article article,int old_c_id) throws ParameterIsEmptyException, NotFoundException;

    /**
     * 获取指定分类下的所有文章
     * @param c_id
     * @return
     */
    public List<Article> getArticleByCategoryId(int c_id);

    /**
     * 通过uri获取文章
     * @param uri
     * @return
     */
    public Article getArticleByUri(String uri);

    /**
     * 获取指定分类下的所有文章
     * @param uri cateogry uri
     * @return
     */
    public List<Article> getArticleListByCategoryUri(String uri);
}
