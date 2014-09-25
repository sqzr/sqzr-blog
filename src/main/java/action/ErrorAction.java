package action;

import com.opensymphony.xwork2.ActionSupport;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by weiyang on 2014/9/24.
 */
public class ErrorAction extends ActionSupport {
    private Map<String, Object> jsonInfo = new HashMap<String, Object>();

    public String notlogon() throws Exception {
        this.jsonInfo.put("status", false);
        this.jsonInfo.put("tips", "登陆超时");
        return "success";
    }
    // ---


    public Map<String, Object> getJsonInfo() {
        return jsonInfo;
    }

    public void setJsonInfo(Map<String, Object> jsonInfo) {
        this.jsonInfo = jsonInfo;
    }


}
