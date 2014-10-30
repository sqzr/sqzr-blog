package action.admin.ajax;

import com.opensymphony.xwork2.ActionSupport;
import service.CommentService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by weiyang on 2014/10/28.
 */
public class CommentAjaxAction extends ActionSupport {
    private CommentService commentService;
    private Map<String, Object> jsonInfo = new HashMap<String, Object>();
    // --接受参数--
    private int id;
    private List<Integer> batch;
    private String status;

    public String delete() throws Exception {
        int result = this.commentService.delete(this.id);
        this.jsonInfo.put("status", (result > 0) ? true : false);
        switch (result) {
            case -1:
                this.jsonInfo.put("tips", "参数错误");
                break;
            case -2:
                this.jsonInfo.put("tips", "参数错误");
                break;
            default:
                this.jsonInfo.put("tips", "删除成功");
                break;
        }
        return "json";
    }

    public String delete_batch() throws Exception {
        int result = this.commentService.delete(batch);
        this.jsonInfo.put("status", (result > 0) ? true : false);
        switch (result) {
            case -1:
                this.jsonInfo.put("tips", "参数错误");
                break;
            case -2:
                this.jsonInfo.put("tips", "没有评论被删除");
                break;
            default:
                this.jsonInfo.put("tips", "删除成功");
                break;
        }
        return "json";
    }

    public String move() throws Exception {
        int result = this.commentService.updateStatus(this.id, this.status);
        this.jsonInfo.put("status", (result > 0) ? true : false);
        switch (result) {
            case -1:
                this.jsonInfo.put("tips", "参数错误");
                break;
            case -2:
                this.jsonInfo.put("tips", "状态错误");
                break;
            default:
                this.jsonInfo.put("tips", "移动成功");
                break;
        }
        return "json";
    }

    // --get、set--


    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<Integer> getBatch() {
        return batch;
    }

    public void setBatch(List<Integer> batch) {
        this.batch = batch;
    }

    public Map<String, Object> getJsonInfo() {
        return jsonInfo;
    }

    public void setJsonInfo(Map<String, Object> jsonInfo) {
        this.jsonInfo = jsonInfo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public CommentService getCommentService() {
        return commentService;
    }

    public void setCommentService(CommentService commentService) {
        this.commentService = commentService;
    }
}
