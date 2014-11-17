package action.admin;

import com.google.common.collect.ImmutableList;
import com.opensymphony.xwork2.ActionSupport;
import model.Article;
import model.Category;
import model.Comment;
import other.Page;
import service.ArticleService;
import service.CategoryService;
import service.CommentService;
import service.OptionService;
import webException.NotFoundException;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by weiyang on 2014/9/13.
 */
public class MainViewAction extends ActionSupport {
    private Map<String, Object> info = new HashMap<String, Object>();
    private Map<String, String> options = new HashMap<String, String>();
    private List<Article> articles;
    private List<Category> categories;
    private Page<Comment> comments;
    private Page<Article> articlePage;
    private int id;
    private int page;
    private int aid;
    private String type;
    private ArticleService articleService;
    private CategoryService categoryService;
    private OptionService optionService;
    private CommentService commentService;
    private Article article;
    private Category category;

    public String index() throws Exception {
        this.info.put("title", "控制台");
        this.info.put("menu", "index");
        this.articlePage = articleService.list(1, 10);
        this.comments = commentService.get(1, 10);
        this.info.put("article_count",articlePage.getTotal());
        this.info.put("comment_count",comments.getTotal());
        this.info.put("category_count",categoryService.getCount());
        this.info.put("comment_spam_count", commentService.getStatusCount("spam"));
        this.info.put("comment_waiting_count", commentService.getStatusCount("waiting"));
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

    public String comment() throws Exception {
        ImmutableList<String> statusCondition = ImmutableList.of("waiting", "approved", "spam");
        if (!statusCondition.contains(this.type)) {
            throw new NotFoundException("找不到页面");
        }
        this.info.put("title", "评论管理");
        this.info.put("menu", "comment_"+this.type);
        this.info.put("uri", (this.aid == 0) ? "/admin/main_comment.html?type=" + this.type : "/admin/main_comment.html?aid=" + this.aid + "&type=" + this.type);
        int waitingCount = (this.aid == 0) ? commentService.getStatusCount("waiting") : commentService.getStatusCount("waiting", this.aid);
        int spamCount = (this.aid == 0) ? commentService.getStatusCount("spam") : commentService.getStatusCount("spam", this.aid);
        this.info.put("waitingCount", waitingCount);
        this.info.put("spamCount", spamCount);
        String otherStatusUri = (this.aid == 0) ? "/admin/main_comment.html?type=" : "/admin/main_comment.html?aid=" + this.aid + "&type=";
        this.info.put("otherStatusUri", otherStatusUri);
        this.comments = (this.aid == 0)?
                commentService.get(this.page, 10, this.type):
                commentService.get(this.page, 10, this.type,this.aid);
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
        this.info.put("uri", "/admin/main_article_list.html");
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

    public String uploadtest() throws Exception {
        return SUCCESS;
    }


    // ---


    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public CommentService getCommentService() {
        return commentService;
    }

    public void setCommentService(CommentService commentService) {
        this.commentService = commentService;
    }

    public Page<Comment> getComments() {
        return comments;
    }

    public void setComments(Page<Comment> comments) {
        this.comments = comments;
    }

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

    public Map<String, String> getOptions() {
        return options;
    }

    public void setOptions(Map<String, String> options) {
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