package model;

import java.util.Calendar;
import java.util.Date;

/**
 * Created by weiyang on 2014/9/13.
 */
public class Log {
    private int id;
    private String type;
    private String ip;
    private String useragent;
    private String content;
    private String result;
    private Date date;

    public Log() {
    }

    public Log(String type, String ip, String useragent, String content, String result, Date date) {
        this.type = type;
        this.ip = ip;
        this.useragent = useragent;
        this.content = content;
        this.result = result;
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
