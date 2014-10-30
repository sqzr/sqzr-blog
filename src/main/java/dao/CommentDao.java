package dao;

import model.Comment;

import java.util.List;

/**
 * Created by weiyang on 2014/10/26.
 */
public interface CommentDao {
    /**
     * 添加评论
     * @param comment
     * @return id值
     */
    public int add(Comment comment);

    /**
     * 获取所有评论
     * @return
     */
    public List<Comment> get();

    /**
     * 获取指定状态的评论
     * @param status
     * @return
     */
    public List<Comment> get(String status);
    /**
     * 获取所有评论
     * @param waiting 是否获取待审核的评论
     * @param spam 是否获取垃圾评论
     * @return
     */
    public List<Comment> get(boolean waiting,boolean spam);

    /**
     * 删除评论
     * @param id
     * @return 受影响行数
     */
    public int delete(int id);

    /**
     * 批量删除评论
     * @param batch
     * @return 受影响行数
     */
    public int delete(List<Integer> batch);

    /**
     * 获取某个状态条数
     * @param column 字段名
     * @return
     */
    public int getStatusCount(String column);

    /**
     * 修改状态
     * @param id
     * @param status
     * @return
     */
    public int updateStatus(int id,String status);
}
