package util;

import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by weiyang on 2014/9/13.
 */
public class EnvironmentInfo {
    /**
     * 获取Ip地址
     * @return
     */
    public static String getIpAddr() {
        HttpServletRequest request = ServletActionContext.getRequest();
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }


    /**
     * 获取useragent
     */
    public static String getUserAgent() {
        HttpServletRequest request = ServletActionContext.getRequest();
        return request.getHeader("User-Agent");
    }


}
