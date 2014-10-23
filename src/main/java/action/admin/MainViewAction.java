package action.admin;

import com.opensymphony.xwork2.ActionSupport;
import model.Article;
import model.Category;
import other.Page;
import service.ArticleService;
import service.CategoryService;
import service.OptionService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by weiyang on 2014/9/13.
 */
public class MainViewAction extends ActionSupport {
    private Map<String, Object> info = new HashMap<String, Object>();
    private Map<String, Object> options = new HashMap<String, Object>();
    private List<Article> articles;
    private List<Category> categories;
    private Page<Article> articlePage;
    private int id;
    private int page;
    private ArticleService articleService;
    private CategoryService categoryService;
    private OptionService optionService;
    private Article article;
    private Category category;

    public String index() throws Exception {
        this.info.put("title", "控制台");
        this.info.put("menu", "index");
        return SUCCESS;
    }

    public String category() throws Exception {
        this.info.put("title", "分类管理");
        this.info.put("menu", "category");
        this.categories = categoryService.list();
        return SUCCESS;
    }

    public String category_list() throws Exception {
        this.category = categoryService.getCategoryById(this.id);
        this.articlePage = articleService.getArticleByCategoryId(this.id,this.page,10,true);
        this.info.put("uri", "/admin/main_category_list.html?id=" + this.id);
        this.info.put("menu", "category_list");
        this.info.put("title", "分类:" + category.getName());
        return SUCCESS;
    }

    public String article_add() throws Exception {
        this.info.put("title", "添加文章");
        this.info.put("menu", "article_add");
        this.categories = categoryService.list();
        return SUCCESS;
    }

    public String article_update() throws Exception {
        this.info.put("menu", "article_update");
        this.categories = categoryService.list();
        this.article = articleService.getArticleById(id);
        this.info.put("title", "更新:" + this.article.getTitle());
        return SUCCESS;
    }

    public String article_list() throws Exception {
        this.info.put("title", "文章列表");
        this.info.put("menu", "article_list");
        this.articlePage = articleService.list(this.page, 10);
        return SUCCESS;
    }
    public String settings() throws Exception {
        this.info.put("title", "设置");
        this.info.put("menu", "settings");
        this.options = optionService.getAllOption();
        return SUCCESS;
    }

    public String category_delete() throws Exception {
        categoryService.delete(id);
        return "category_delete";
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

    public Map<String, Object> getOptions() {
        return options;
    }

    public void setOptions(Map<String, Object> options) {
        this.options = options;
    }

    public OptionService getOptionService() {
        return optionService;
    }

    public void setOptionService(OptionService optionService) {
        this.optionService = optionService;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public CategoryService getCategoryService() {
        return categoryService;
    }

    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    public List<Category> getCategories() {
        return categories;
    }

    public void setCategories(List<Category> categories) {
        this.categories = categories;
    }

    public List<Article> getArticles() {
        return articles;
    }

    public void setArticles(List<Article> articles) {
        this.articles = articles;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public ArticleService getArticleService() {
        return articleService;
    }

    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    public Map<String, Object> getInfo() {
        return info;
    }

    public void setInfo(Map<String, Object> info) {
        this.info = info;
    }
}
