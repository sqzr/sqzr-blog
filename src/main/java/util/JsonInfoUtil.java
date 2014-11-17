package util;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by weiyang on 2014/11/17.
 */
public class JsonInfoUtil {
    private static Map<String, Object> jsonInfo = new HashMap<String, Object>();

    public static Map<String, Object> generate() {
        return jsonInfo;
    }

    public static Map<String, Object> generate(boolean status) {
        jsonInfo.put("status", status);
        return jsonInfo;
    }

    public static Map<String, Object> generate(String tips, boolean status) {
        jsonInfo.put("tips", tips);
        jsonInfo.put("status", status);
        return jsonInfo;
    }

    public static Map<String, Object> generate(String key1, Object value1, String key2, Object value2) {
        jsonInfo.put(key1, value1);
        jsonInfo.put(key2, value2);
        return jsonInfo;
    }


}
