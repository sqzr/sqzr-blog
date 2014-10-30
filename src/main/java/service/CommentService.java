package service;

import model.Comment;
import other.Page;

import java.util.List;

/**
 * Created by weiyang on 2014/10/26.
 */
public interface CommentService {
    /**
     * 添加评论
     * @param comment
     * @return -1 参数错误(colum:a_id)
     * @return -2 评论内容为空
     * @return -3 作者为空
     * @return -4 email为空
     * @return -5 添加失败
     * @return -6 邮箱格式错误
     * @retrun -7 邮箱长度错误
     * @return -8 称呼长度错误
     * @return -9 文本长度错误
     * @retrun id值
     */
    public int add(Comment comment);

    /**
     * 获取所有评论
     * @return
     */
    public List<Comment> get();

    /**
     * 获取所有评论(分页)
     * @param pageNum 页数
     * @param pageSize 每页行数
     * @return
     */
    public Page<Comment> get(int pageNum, int pageSize);

    /**
     * 获取所有评论(有条件)
     * @param pageNum 页数
     * @param pageSize 每页行数
     * @param status 状态
     * @return
     */
    public Page<Comment> get(int pageNum, int pageSize,String status);

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
     * @return -1 id 为空
     * @return -2 删除失败
     * @return 受影响行数
     */
    public int delete(int id);

    /**
     * 批量删除
     * @param batch
     * @return -1 没有选择评论
     * @return -2 没有评论被删除
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
     * @return -1 id 参数错误
     * @return -2 状态错误
     * @retrun 受影响行数
     */
    public int updateStatus(int id, String status);
}
