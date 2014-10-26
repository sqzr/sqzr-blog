package dao;

import model.Comment;

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


}
