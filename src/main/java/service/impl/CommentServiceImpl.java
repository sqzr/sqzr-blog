package service.impl;

import com.foundationdb.sql.parser.IsNullNode;
import com.google.common.base.Strings;
import com.google.common.collect.ImmutableList;
import dao.ArticleDao;
import dao.CommentDao;
import model.Article;
import model.Comment;
import other.Page;
import other.PageHelper;
import service.ArticleService;
import service.CommentService;

import java.util.List;
import java.util.regex.Pattern;

import dao.CommentDao;
import model.Comment;
import service.CommentService;
import webException.NotFoundException;
import webException.ParameterIsEmptyException;

/**
 * Created by weiyang on 2014/10/26.
 */
public class CommentServiceImpl implements CommentService {
    private CommentDao commentDao;
    private ArticleDao articleDao;
    private ArticleService articleService;

    @Override
    public int add(Comment comment) {
        if (comment.getArticle().getId() == 0) {
            return -1;
        }
        if(Strings.isNullOrEmpty(comment.getText())) {
            return -2;
        }
        if (Strings.isNullOrEmpty(comment.getAuthor())) {
            return -3;
        }
        if (Strings.isNullOrEmpty(comment.getMail())) {
            return -4;
        }
        if (!Pattern.compile("\\w+@(\\w+.)+[a-z]{2,3}").matcher(comment.getMail()).matches()) {
            return -6;
        }
        if (comment.getMail().length() > 50 || comment.getMail().length() < 2) {
            return -7;
        }
        if (comment.getAuthor().length() > 16 || comment.getAuthor().length() < 1) {
            return -8;
        }
        if (comment.getText().length() > 500 || comment.getText().length() < 6) {
            return -9;
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
        if (articleDao.plusCommentCount(comment.getArticle(), 1) != 1) {
            return -5;
        }
        int result = commentDao.add(comment);
        return (result > 0) ? result : -5;
    }

    @Override
    public List<Comment> get() {
        return commentDao.get();
    }

    @Override
    public Page<Comment> get(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        Page<Comment> page = (Page<Comment>) commentDao.get();
        return page;
    }

    @Override
    public Page<Comment> get(int pageNum, int pageSize, String status) {
        PageHelper.startPage(pageNum, pageSize);
        Page<Comment> page = (Page<Comment>) commentDao.get(status);
        return page;
    }

    @Override
    public Page<Comment> get(int pageNum, int pageSize, String status, int aid) throws NotFoundException, ParameterIsEmptyException {
        PageHelper.startPage(pageNum, pageSize);
        Page<Comment> page = (Page<Comment>) commentDao.get(status,aid);
        return page;
    }

    @Override
    public List<Comment> get(boolean waiting, boolean spam) {
        return commentDao.get(waiting, spam);
    }

    @Override
    public int delete(int id) {
        if (id == 0) {
            return -1;
        }
        int aid = commentDao.getArticleIdByCommentId(id);
        int result = commentDao.delete(id);
        if (result == 1) {
            articleDao.minusCommentCount(aid,1);
        }
        return (result == 1) ? result : -2;
    }

    @Override
    public int delete(List<Integer> batch) {
        if (batch.size() == 0) {
            return -1;
        }
        for (int cid : batch) {
            // 循环减少每条评论的文章数
            articleDao.minusCommentCount(commentDao.getArticleIdByCommentId(cid), 1);
        }
        int result = commentDao.delete(batch);
        return (result > 0) ? result : -2;
    }

    @Override
    public int getStatusCount(String column) {
        return commentDao.getStatusCount(column);
    }

    @Override
    public int getStatusCount(String column, int aid) {
        return commentDao.getStatusCount(column,aid);
    }

    @Override
    public int updateStatus(int id, String status) {
        if (id == 0) {
            return -1;
        }
        ImmutableList<String> statusCondition = ImmutableList.of("waiting", "approved", "spam");
        if (!statusCondition.contains(status)) {
            return -2;
        }
        return commentDao.updateStatus(id, status);
    }

    // ---


    public ArticleService getArticleService() {
        return articleService;
    }

    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
    }

    public ArticleDao getArticleDao() {
        return articleDao;
    }

    public void setArticleDao(ArticleDao articleDao) {
        this.articleDao = articleDao;
    }

    public CommentDao getCommentDao() {
        return commentDao;
    }

    public void setCommentDao(CommentDao commentDao) {
        this.commentDao = commentDao;
    }
}
