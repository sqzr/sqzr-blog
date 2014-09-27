package action.admin;

import com.opensymphony.xwork2.ActionSupport;
import model.Article;
import model.Category;
import opensource.jpinyin.PinyinFormat;
import opensource.jpinyin.PinyinHelper;
import org.apache.commons.lang3.StringUtils;
import service.ArticleService;

import java.util.Date;
import java.util.HashMap;
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
    private int c_id;
    private int oldcid;
    private int newcid;

    /**
     * 添加文章
     * @return
     * @throws Exception
     */
    public String add() throws Exception {
        if ("".equals(this.uri)) {
            // uri 为空,自动生成拼音
            this.uri = PinyinHelper.convertToPinyinString(this.title.replace(" ", ""),"-", PinyinFormat.WITHOUT_TONE);
        }
        this.id = articleService.add(new Article(this.title, new Category(this.c_id), this.content, this.uri));
        if (this.id > 0) {
            jsonInfo.put("tips", "文章添加成功");
            jsonInfo.put("article_id", this.id);
            jsonInfo.put("status", true);
        } else {
            jsonInfo.put("tips", "文章添加失败");
            jsonInfo.put("status", false);
        }
        return "json";
    }

    /**
     * 修改文章
     * @return
     */
    public String update() throws Exception {
        if (articleService.update(new Article(id,new Category(this.newcid),title,content,uri),this.oldcid)) {
            jsonInfo.put("tips", "修改成功");
            jsonInfo.put("status", true);
        } else {
            jsonInfo.put("tips", "修改失败");
            jsonInfo.put("status", false);
        }
        return "json";
    }


    // ---


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
