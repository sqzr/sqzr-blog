package action.show;

import com.sqzr.rssutil.Author;
import com.sqzr.rssutil.Entry;
import com.sqzr.rssutil.Feed;
import model.Comment;
import org.apache.struts2.ServletActionContext;
import other.Page;
import com.opensymphony.xwork2.ActionSupport;
import model.Article;
import org.markdown4j.Markdown4jProcessor;
import service.ArticleService;
import service.OptionService;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by weiyang on 2014/10/7.
 */
public class IndexAction extends ActionSupport {
    private ArticleService articleService;
    private OptionService optionService;
    private List<Article> articles;
    private Page<Article> articlePage;
    private Article article;
    private Map<String, Object> options = new HashMap<String, Object>();
    private String uri;
    private int page;

    public String index() throws Exception {
        this.options = optionService.getAllOption();
        Map<String, String> numberMap = (HashMap<String,String>) this.options.get("pagenumber");
        this.articlePage = articleService.list(this.page, Integer.parseInt(numberMap.get("value")),false);
        return "success";
    }

    public String blog() throws Exception {
        this.article = articleService.getArticleByUri(this.uri);
        List<Comment> temp = new ArrayList<Comment>();
        for (Comment comment : this.article.getComments()) {
            if ("approved".equals(comment.getStatus())) {
                temp.add(comment);
            }
        }
        this.article.setComments(temp);
        this.options = optionService.getAllOption();
        return "success";
    }

    public String category() throws Exception {
        this.articles = articleService.getArticleListByCategoryUri(this.uri);
        this.options = optionService.getAllOption();
        return "success";
    }

    public String archives() throws Exception {
        this.articles = articleService.list();
        this.options = optionService.getAllOption();
        return "success";
    }

    public String atom() throws Exception {
        this.options = optionService.getAllOption();
        String option_title = ((HashMap<String, String>) this.options.get("title")).get("value");
        String option_url = ((HashMap<String, String>) this.options.get("url")).get("value");
        String option_author_name = ((HashMap<String, String>) this.options.get("authorname")).get("value");
        String option_author_email = ((HashMap<String, String>) this.options.get("authoremail")).get("value");
        Feed feed = new Feed();
        feed.setXMLEncoding("UTF-8");
        feed.setTitle(option_title);
        feed.setThisLink(option_url + "/atom.xml");
        feed.setLink(option_url);
        feed.setId(option_url);
        feed.setAuthor(new Author(option_author_name, option_author_email));
        List<Entry> entries = new ArrayList<Entry>();
        this.articles = articleService.list();
        for (Article article1 : articles) {
            entries.add(new Entry(
                    article1.getTitle(),
                    option_url + "/" + article1.getUri() + ".shtml",
                    new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(article1.getDate()),
                    new Markdown4jProcessor().process(article1.getContent())));
        }
        feed.setEntryList(entries);
        String rssxml = feed.generateDocument().asXML();
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/xml;charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter out = response.getWriter();
        out.write(rssxml);
        out.flush();
        out.close();
        return null;
    }

    // ---


    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public Page<Article> getArticlePage() {
        return articlePage;
    }

    public void setArticlePage(Page<Article> articlePage) {
        this.articlePage = articlePage;
    }

    public String getUri() {
        return uri;
    }

    public void setUri(String uri) {
        this.uri = uri;
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    public OptionService getOptionService() {
        return optionService;
    }

    public void setOptionService(OptionService optionService) {
        this.optionService = optionService;
    }

    public Map<String, Object> getOptions() {
        return options;
    }

    public void setOptions(Map<String, Object> options) {
        this.options = options;
    }

    public List<Article> getArticles() {
        return articles;
    }

    public void setArticles(List<Article> articles) {
        this.articles = articles;
    }

    public ArticleService getArticleService() {
        return articleService;
    }

    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
    }


}
