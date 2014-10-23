package model;

import java.util.Date;

/**
 * Created by weiyang on 2014/9/14.
 */
public class Article {
    private int id;
    private Category category;
    private String type;
    private String title;
    private String content;
    private String uri;
    private Date date;

    public Article() {
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

    public Article(int id,String type,Category category, String title, String content, String uri) {
        this.id = id;
        this.type = type;
        this.category = category;
        this.title = title;
        this.content = content;
        this.uri = uri;
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
