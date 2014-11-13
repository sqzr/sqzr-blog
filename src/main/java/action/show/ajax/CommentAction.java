package action.show.ajax;

import com.opensymphony.xwork2.ActionSupport;
import model.Article;
import model.Comment;
import service.CommentService;
import util.CookieUtil;
import util.EnvironmentInfo;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by weiyang on 2014/10/26.
 */
public class CommentAction extends ActionSupport {
    private CommentService commentService;
    private Map<String, Object> jsonInfo = new HashMap<String, Object>();
    private int a_id;
    private int parent;
    private String author;
    private String mail;
    private String url;
    private String text;

    public String comment() throws Exception {
        Comment comment = new Comment(
                new Article(this.a_id), new Date(), this.author, this.mail, this.url, EnvironmentInfo.getIpAddr(),EnvironmentInfo.getUserAgent(), this.text, "article_comment","approved",this.parent);
        int result = this.commentService.add(comment);
        this.jsonInfo.put("status", (result > 0) ? true : false);
        switch (result) {
            case -1:
                this.jsonInfo.put("tips","参数错误");
                break;
            case -2:
                this.jsonInfo.put("tips", "评论内容不能为空");
                break;
            case -3:
                this.jsonInfo.put("tips", "作者不能为空");
                break;
            case -4:
                this.jsonInfo.put("tips", "Email不能为空");
                break;
            case -5:
                this.jsonInfo.put("tips", "评论失败");
                break;
            case -6:
                this.jsonInfo.put("tips", "邮箱格式错误");
                break;
            case -7:
                this.jsonInfo.put("tips", "邮箱长度错误");
                break;
            case -8:
                this.jsonInfo.put("tips", "称呼长度错误");
                break;
            case -9:
                this.jsonInfo.put("tips", "文本长度错误");
                break;
            default:
                this.jsonInfo.put("id", result);
                this.jsonInfo.put("tips", "评论成功");
                // 保存用户cookie
                CookieUtil.setCookie("author", this.author);
                CookieUtil.setCookie("mail", this.mail);
                CookieUtil.setCookie("url",this.url);
                break;
        }
        return "json";
    }

    // ---


    public Map<String, Object> getJsonInfo() {
        return jsonInfo;
    }

    public void setJsonInfo(Map<String, Object> jsonInfo) {
        this.jsonInfo = jsonInfo;
    }

    public int getParent() {
        return parent;
    }

    public void setParent(int parent) {
        this.parent = parent;
    }

    public int getA_id() {
        return a_id;
    }

    public void setA_id(int a_id) {
        this.a_id = a_id;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public CommentService getCommentService() {
        return commentService;
    }

    public void setCommentService(CommentService commentService) {
        this.commentService = commentService;
    }
}
