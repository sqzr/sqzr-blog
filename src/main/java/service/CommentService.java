package service;

import model.Comment;

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
     * @retrun id值
     */
    public int add(Comment comment);
}
