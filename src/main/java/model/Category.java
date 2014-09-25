package model;

import java.util.Date;

/**
 * Created by weiyang on 2014/9/18.
 */
public class Category {
    private int id;
    private String name;
    private String uri;
    private Date date;

    public Category() {
    }

    public Category(int id) {
        this.id = id;
    }

    public Category(String name, String uri) {
        this.name = name;
        this.uri = uri;
        this.date = new Date();
    }

    public Category(int id, String uri, String name) {
        this.id = id;
        this.uri = uri;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUri() {
        return uri;
    }

    public void setUri(String uri) {
        this.uri = uri;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
