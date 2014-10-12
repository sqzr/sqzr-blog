package action.admin;

import com.opensymphony.xwork2.ActionSupport;
import model.User;
import org.apache.struts2.ServletActionContext;
import service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by weiyang on 2014/9/13.
 */
public class UserViewAction extends ActionSupport {
    private Map<String, Object> info = new HashMap<String, Object>();
    private UserService userService;
    private HttpSession session;
    private HttpServletRequest request;
    private HttpServletResponse response;

    public UserViewAction() {
        this.request = ServletActionContext.getRequest();
        this.session = request.getSession();
        this.response = ServletActionContext.getResponse();
    }

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
        userService.logout(this.session, this.request, this.response);
        return "logout";
    }

    // ---


    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public Map<String, Object> getInfo() {
        return info;
    }

    public void setInfo(Map<String, Object> info) {
        this.info = info;
    }
}
