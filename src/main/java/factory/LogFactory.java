package factory;

import model.Log;
import util.EnvironmentInfo;

import java.util.Date;

/**
 * Created by weiyang on 2014/9/16.
 */
public class LogFactory {
    public static Log build(String type,String content,String result) {
        Log log = new Log();
        log.setIp(EnvironmentInfo.getIpAddr());
        log.setUseragent(EnvironmentInfo.getUserAgent());
        log.setType(type);
        log.setContent(content);
        log.setResult(result);
        log.setDate(new Date());
        return log;
    }

    public static Log build(String type, String content) {
        Log log = new Log();
        log.setIp(EnvironmentInfo.getIpAddr());
        log.setUseragent(EnvironmentInfo.getUserAgent());
        log.setType(type);
        log.setContent(content);
        log.setDate(new Date());
        return log;
    }

}
