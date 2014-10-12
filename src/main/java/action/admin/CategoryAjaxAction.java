package action.admin;

import com.opensymphony.xwork2.ActionSupport;
import model.Category;
import service.ArticleService;
import service.CategoryService;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by weiyang on 2014/9/18.
 */
public class CategoryAjaxAction extends ActionSupport {
    private Map<String, Object> jsonInfo = new HashMap<String, Object>();
    private CategoryService categoryService;
    private int id;
    private String uri;
    private String name;

    public String add() throws Exception {
        int result = categoryService.add(new Category(this.name, this.uri));
        if (result > 0) {
            // 添加成功
            this.jsonInfo.put("status", true);
            this.jsonInfo.put("tips", "添加分类成功");
        } else {
            // 添加失败
            this.jsonInfo.put("status", false);
            this.jsonInfo.put("tips", "添加分类失败");
        }
        return "json";
    }

    public String update() throws Exception {
        if (categoryService.update(new Category(this.id, this.uri, this.name))) {
            //修改成功
            this.jsonInfo.put("status", true);
            this.jsonInfo.put("tips", "修改分类成功");
        } else {
            // 修改失败
            this.jsonInfo.put("status", false);
            this.jsonInfo.put("tips", "修改分类失败");
        }
        return "json";
    }

    public String delete() throws Exception {
        int result = categoryService.delete(this.id);
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

    public String list() throws Exception {
        this.jsonInfo.put("categories", categoryService.list());
        return "json";
    }

    public String setdefault() throws Exception {
        if (categoryService.setDefaultCategory(this.id)) {
            this.jsonInfo.put("status", true);
            this.jsonInfo.put("tips", "设置默认分类成功");
        } else {
            this.jsonInfo.put("status", false);
            this.jsonInfo.put("tips", "设置默认分类失败");
        }
        return "json";
    }





    // ---


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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Map<String, Object> getJsonInfo() {
        return jsonInfo;
    }

    public void setJsonInfo(Map<String, Object> jsonInfo) {
        this.jsonInfo = jsonInfo;
    }

    public CategoryService getCategoryService() {
        return categoryService;
    }

    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }
}
