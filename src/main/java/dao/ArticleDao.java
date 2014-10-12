package dao;

import model.Article;

import java.util.List;

/**
 * Created by weiyang on 2014/9/14.
 */
public interface ArticleDao {
    /**
     * 添加文章
     * @param article
     * @return 新增文章id
     */
    public int add(Article article);

    /**
     * 通过id获取文章
     * @param id
     * @return
     */
    public Article getArticleById(int id);

    /**
     * 通过uri获取文章
     * @param uri
     * @return
     */
    public Article getArticleByUri(String uri);
    /**
     * 获取所有文章
     * @return
     */
    public List<Article> list();

    /**
     * 通过id删除文章
     * @param id
     * @return 受影响行数
     */
    public int deleteArticleById(int id);

    /**
     * 修改文章
     * @param article
     * @return 受影响行数
     */
    public int update(Article article);

    /**
     * 获取指定文章的分类
     * @param id
     * @return 分类id
     */
    public int getCategoryIdByArticleId(int id);

    /**
     * 获取指定分类下的所有文章
     * @param c_id
     * @return
     */
    public List<Article> getArticleByCategoryId(int c_id);

    /**
     * 获取uri存在数量
     * @param uri
     * @return
     */
    public int getCountByUri(String uri);

    /**
     * 移动文章到默认分类
     * @param c_id
     * @return int 受影响的文章数
     */
    public int moveArticleToDefaultCategory(int c_id);

    /**
     * 获取分类里的文章数
     * @param c_id
     * @return int 文章数
     */
    public int getArticleCountByCategory(int c_id);
}
