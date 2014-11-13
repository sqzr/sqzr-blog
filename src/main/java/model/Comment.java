package model;

import java.util.Date;
import java.util.List;

/**
 * Created by weiyang on 2014/10/24.
 */
public class Comment {
    private int id;
    private Article article;
    private Date created;
    private String author;
    private String mail;
    private String url;
    private String ip;
    private String useragent;
    private String text;
    private String type;
    private String status;
    private int parent;

    public Comment() {
    }

    public Comment(Article article, Date created, String author, String mail, String url, String ip, String useragent, String text, String type, String status, int parent) {
        this.article = article;
        this.created = created;
        this.author = author;
        this.mail = mail;
        this.url = url;
        this.ip = ip;
        this.useragent = useragent;
        this.text = text;
        this.type = type;
        this.status = status;
        this.parent = parent;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", article=" + article +
                ", created=" + created +
                ", author='" + author + '\'' +
                ", mail='" + mail + '\'' +
                ", url='" + url + '\'' +
                ", ip='" + ip + '\'' +
                ", useragent='" + useragent + '\'' +
                ", text='" + text + '\'' +
                ", type='" + type + '\'' +
                ", status='" + status + '\'' +
                ", parent=" + parent +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
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

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getUseragent() {
        return useragent;
    }

    public void setUseragent(String useragent) {
        this.useragent = useragent;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getParent() {
        return parent;
    }

    public void setParent(int parent) {
        this.parent = parent;
    }
}
