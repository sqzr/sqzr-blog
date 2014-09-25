package action.admin;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by weiyang on 2014/9/13.
 */
public class UserViewAction extends ActionSupport {
    private Map<String, Object> info = new HashMap<String, Object>();
    private HttpSession session;
    private HttpServletRequest request;
    /**
     * 后台登陆界面
     * @return
     * @throws Exception
     */
    public String login() throws Exception {
        this.info.put("title","Administrator Login");
        return SUCCESS;
    }

    /**
     * 注销
     * @return
     */
    public String logout() throws Exception {
        this.request = ServletActionContext.getRequest();
        this.session = request.getSession();
        this.session.setAttribute("user", null);
        return "logout";
    }

    // ---


    public Map<String, Object> getInfo() {
        return info;
    }

    public void setInfo(Map<String, Object> info) {
        this.info = info;
    }
}
