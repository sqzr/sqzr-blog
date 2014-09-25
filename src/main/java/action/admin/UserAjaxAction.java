package action.admin;

import com.opensymphony.xwork2.ActionSupport;
import model.User;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.struts2.ServletActionContext;
import service.UserService;
import util.Conversion;
import util.EnvironmentInfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by weiyang on 2014/9/12.
 */
public class UserAjaxAction extends ActionSupport {
    private UserService userService;
    private HttpSession session;
    private HttpServletRequest request;
    private String username;
    private String password;
    private Map<String, Object> jsonInfo = new HashMap<String, Object>();

    public UserAjaxAction() {
        this.request = ServletActionContext.getRequest();
        this.session = request.getSession();
    }

    /**
     * 后台登陆
     * @return
     * @throws Exception
     */
    public String login() throws Exception {
        User user = userService.login(username, password);
        if (username == null || password == null) {
            jsonInfo.put("status", false);
            jsonInfo.put("tips", "用户名或密码不能为空");
        }
        if (user == null) {
            jsonInfo.put("status", false);
            jsonInfo.put("tips","用户名或密码错误");
        } else {
            jsonInfo.put("status", true);
            jsonInfo.put("tips", "登陆成功,跳转中");
        }
        session.setAttribute("user", user);
        return "json";
    }

    // ---

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
