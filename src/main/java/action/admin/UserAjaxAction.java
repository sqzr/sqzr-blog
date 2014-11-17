package action.admin;

import com.opensymphony.xwork2.ActionSupport;
import model.User;
import org.apache.struts2.ServletActionContext;
import service.UserService;
import util.CookieUtil;
import util.JsonInfoUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by weiyang on 2014/9/12.
 */
public class UserAjaxAction extends ActionSupport {
    private UserService userService;
    private HttpSession session;
    private HttpServletRequest request;
    private HttpServletResponse response;
    private String username;
    private String password;
    private boolean keepMeLoggedInd;
    private Map<String, Object> jsonInfo = new HashMap<String, Object>();

    public UserAjaxAction() {
        this.request = ServletActionContext.getRequest();
        this.session = request.getSession();
        this.response = ServletActionContext.getResponse();
    }

    /**
     * 后台登陆
     *
     * @return
     * @throws Exception
     */
    public String login() throws Exception {
        User user = userService.login(username, password);
        if (username == null || password == null) {
            this.jsonInfo = JsonInfoUtil.generate("用户名或密码不能为空", false);
        }
        if (user == null) {
            this.jsonInfo = JsonInfoUtil.generate("用户名或密码错误", false);
        } else {
            String keeplogin = userService.updateKeeplogin(user.getId());
            if (this.keepMeLoggedInd == true) {
                CookieUtil.setCookie(this.response, "keeplogin", keeplogin, Integer.MAX_VALUE);
            }
            this.jsonInfo = JsonInfoUtil.generate("登陆成功,跳转中", true);
        }
        session.setAttribute("user", user);
        return "json";
    }

    // ---


    public boolean isKeepMeLoggedInd() {
        return keepMeLoggedInd;
    }

    public void setKeepMeLoggedInd(boolean keepMeLoggedInd) {
        this.keepMeLoggedInd = keepMeLoggedInd;
    }

    public Map<String, Object> getJsonInfo() {
        return jsonInfo;
    }

    public void setJsonInfo(Map<String, Object> jsonInfo) {
        this.jsonInfo = jsonInfo;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}