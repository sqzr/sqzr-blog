package Interceptors;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import model.User;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import service.UserService;
import util.CookieUtil;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * Created by weiyang on 2014/9/13.
 */
public class PermissionInterceptor implements Interceptor {

    @Override
    public void destroy() {

    }

    @Override
    public void init() {

    }
    @Override
    public String intercept(ActionInvocation actionInvocation) throws Exception {
        ActionContext context = ActionContext.getContext();
        Map session = context.getSession();
        HttpServletRequest request = ServletActionContext.getRequest();
        Cookie cookie = CookieUtil.getCookie(request, "keeplogin");
        if (session.get("user") == null) {
            if (cookie == null)
            {
                if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
                    // ajax
                    return "notLogon_json";
                } else {
                    return "notLogon_view";
                }
            }
            ApplicationContext appctx = new ClassPathXmlApplicationContext("spring-config.xml");
            UserService userService = (UserService)appctx.getBean("userService");
            User user = userService.getUserByKeeplogin(cookie.getValue());
            if (user == null)
            {
                if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
                    // ajax
                    return "notLogon_json";
                } else {
                    return "notLogon_view";
                }
            }
            session.put("user", user);
        }

        return actionInvocation.invoke();
    }
}
