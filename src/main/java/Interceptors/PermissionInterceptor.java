package Interceptors;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import org.apache.struts2.ServletActionContext;

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
        if (session.get("user") == null) {
            if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
                // ajax
                return "notLogon_json";
            } else {
                return "notLogon_view";
            }
        }

        return actionInvocation.invoke();
    }
}
