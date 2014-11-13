package action.admin;

import com.google.common.base.Strings;
import com.opensymphony.xwork2.ActionSupport;
import model.Article;
import model.Category;
import opensource.jpinyin.PinyinFormat;
import opensource.jpinyin.PinyinHelper;
import org.apache.commons.lang3.StringUtils;
import service.ArticleService;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by weiyang on 2014/9/14.
 */
public class ArticleAjaxAction extends ActionSupport {
    private Map<String, Object> jsonInfo = new HashMap<String, Object>();
    private ArticleService articleService;
    private int id;
    private String title;
    private String content;
    private String uri;
    private String type;
    private String date;
    private boolean allowcomment;
    private int c_id;
    private int oldcid;
    private int newcid;
    private List<Integer> batch;

    /**
     * 添加文章
     * @return
     * @throws Exception
     */
    public String add() throws Exception {
        Date tempDate = (Strings.isNullOrEmpty(this.date)) ? new Date() : new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(this.date);
        int result = articleService.add(new Article(this.type, this.title, new Category(this.c_id), this.content, this.uri, tempDate,this.allowcomment));
        boolean temp = (result > 0) ? true : false;
        this.jsonInfo.put("status", temp);
        switch (result) {
            case 0:
                this.jsonInfo.put("tips", "添加文章失败");
                break;
            case -1:
                this.jsonInfo.put("tips", "标题不能为空");
                break;
            case -2:
                this.jsonInfo.put("tips", "分类未选择");
                break;
            case -3:
                this.jsonInfo.put("tips", "uri重复");
                break;
            default:
                this.jsonInfo.put("tips", "添加文章成功");
                this.jsonInfo.put("article_id", result);
                break;
        }
        return "json";
    }

    /**
     * 修改文章
     * @return
     */
    public String update() throws Exception {
        Date tempDate = (Strings.isNullOrEmpty(this.date)) ? null : new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(this.date);
        Article article = new Article(id, type, new Category(this.newcid), title, content, uri, tempDate,this.allowcomment);
        int result = articleService.update(article, this.oldcid);
        boolean temp = (result > 0) ? true : false;
        this.jsonInfo.put("status", temp);
        switch (result) {
            case 0:
                this.jsonInfo.put("tips", "修改文章失败");
                break;
            case -1:
                this.jsonInfo.put("tips", "标题不能为空");
                break;
            case -2:
                this.jsonInfo.put("tips", "分类未选择");
                break;
            case -3:
                this.jsonInfo.put("tips", "uri重复");
                break;
            default:
                this.jsonInfo.put("tips", "修改文章成功");
                this.jsonInfo.put("article_id", result);
                break;
        }
        return "json";
    }

    public String delete() throws Exception {
        int result = articleService.delete(this.id);
        boolean temp = (result > 0) ? true : false;
        this.jsonInfo.put("status", temp);
        switch (result) {
            case -1:
                this.jsonInfo.put("tips", "参数错误");
                break;
            case -2:
                this.jsonInfo.put("tips", "删除失败");
                break;
        }
        return "json";
    }

    public String delete_batch() throws Exception {
        int result = articleService.batchDelete(batch);
        boolean temp = (result > 0) ? true : false;
        this.jsonInfo.put("status", temp);
        switch (result) {
            case -1:
                this.jsonInfo.put("tips", "没有文章被删除");
                break;
            case -2:
                this.jsonInfo.put("tips", "没有文章被删除");
                break;
        }
        return "json";
    }
    // ---


    public boolean getAllowcomment() {
        return allowcomment;
    }

    public void setAllowcomment(boolean allowcomment) {
        this.allowcomment = allowcomment;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public List<Integer> getBatch() {
        return batch;
    }

    public void setBatch(List<Integer> batch) {
        this.batch = batch;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getNewcid() {
        return newcid;
    }

    public void setNewcid(int newcid) {
        this.newcid = newcid;
    }

    public int getOldcid() {
        return oldcid;
    }

    public void setOldcid(int oldcid) {
        this.oldcid = oldcid;
    }

    public int getC_id() {
        return c_id;
    }

    public void setC_id(int c_id) {
        this.c_id = c_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUri() {
        return uri;
    }

    public void setUri(String uri) {
        this.uri = uri;
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

    public ArticleService getArticleService() {
        return articleService;
    }

    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
    }

    public Map<String, Object> getJsonInfo() {
        return jsonInfo;
    }

    public void setJsonInfo(Map<String, Object> jsonInfo) {
        this.jsonInfo = jsonInfo;
    }
}
