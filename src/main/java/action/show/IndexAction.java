package action.show;

import other.Page;
import com.opensymphony.xwork2.ActionSupport;
import model.Article;
import model.Option;
import org.markdown4j.Markdown4jProcessor;
import service.ArticleService;
import service.OptionService;

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
        this.articlePage = articleService.list(this.page, Integer.parseInt(numberMap.get("value")));
        return "success";
    }

    public String blog() throws Exception {
        this.article = articleService.getArticleByUri(this.uri);
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
