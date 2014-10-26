package service.impl;

import dao.CommentDao;
import model.Comment;
import service.CommentService;

/**
 * Created by weiyang on 2014/10/26.
 */
public class CommentServiceImpl implements CommentService {
    private CommentDao commentDao;
    @Override
    public int add(Comment comment) {
        if (comment.getArticle().getId() == 0) {
            return -1;
        }
        if("".equals(comment.getText())) {
            return -2;
        }
        if ("".equals(comment.getAuthor())) {
            return -3;
        }
        if ("".equals(comment.getMail())) {
            return -4;
        }
        int result = commentDao.add(comment);
        return (result > 0) ? result : -5;
    }

    // ---


    public CommentDao getCommentDao() {
        return commentDao;
    }

    public void setCommentDao(CommentDao commentDao) {
        this.commentDao = commentDao;
    }
}
