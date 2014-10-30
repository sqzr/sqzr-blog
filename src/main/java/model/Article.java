package model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by weiyang on 2014/9/14.
 */
public class Article {
    private int id;
    private Category category;
    private String type;
    private String title;
    private int allowcomment;
    private int commentsnum;
    private String content;
    private String uri;
    private Date date;
    private List<Comment> comments;

    public Article() {
    }

    public Article(int id) {
        this.id = id;
    }

    public Article(String type, String title, Category category, String content, String uri) {
        this.type = type;
        this.date = new Date();
        this.category = category;
        this.title = title;
        this.content = content;
        this.uri = uri;
    }

    public Article(String type,String title,Category category, String content, String uri, Date date) {
        this.category = category;
        this.type = type;
        this.title = title;
        this.content = content;
        this.uri = uri;
        this.date = date;
    }

    public Article(String type,String title,Category category, String content, String uri, Date date,int allowcomment) {
        this.category = category;
        this.type = type;
        this.title = title;
        this.content = content;
        this.uri = uri;
        this.date = date;
        this.allowcomment = allowcomment;
    }

    public Article(int id,String type,Category category, String title, String content, String uri) {
        this.id = id;
        this.type = type;
        this.category = category;
        this.title = title;
        this.content = content;
        this.uri = uri;
    }

    public Article(int id,String type,Category category, String title, String content, String uri,Date date,int allowcomment) {
        this.id = id;
        this.type = type;
        this.category = category;
        this.title = title;
        this.content = content;
        this.uri = uri;
        this.date = date;
        this.allowcomment = allowcomment;
    }

    public Article(int id,String type,Category category, String title, String content, String uri,Date date) {
        this.id = id;
        this.type = type;
        this.category = category;
        this.title = title;
        this.content = content;
        this.uri = uri;
        this.date = date;
    }

    public Article(String uri, String title, String content) {
        this.uri = uri;
        this.title = title;
        this.content = content;
    }



    @Override
    public String toString() {
        return "Article{" +
                "id=" + id +
                ", category=" + category +
                ", type='" + type + '\'' +
                ", title='" + title + '\'' +
                ", allowcomment=" + allowcomment +
                ", commentsnum=" + commentsnum +
                ", content='" + content + '\'' +
                ", uri='" + uri + '\'' +
                ", date=" + date +
                ", comments=" + comments +
                '}';
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public int getAllowcomment() {
        return allowcomment;
    }

    public void setAllowcomment(int allowcomment) {
        this.allowcomment = allowcomment;
    }

    public int getCommentsnum() {
        return commentsnum;
    }

    public void setCommentsnum(int commentsnum) {
        this.commentsnum = commentsnum;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getUri() {
        return uri;
    }

    public void setUri(String uri) {
        this.uri = uri;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
