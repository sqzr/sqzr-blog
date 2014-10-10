package Interceptors;

import java.util.HashMap;

/**
 * Created by weiyang on 2014/10/7.
 */
public class MapParam extends HashMap<String, Object> {
    private static final long serialVersionUID = 1L;
    /**
     * 作为Key的字段对应MapParam的Key
     */
    public static final String KEY_FIELD = "name";

    /**
     * 作为Value的字段对应MapParam的Key
     */
    public static final String VALUE_FIELD = "value";

    public MapParam() {

    }

    /**
     * 指定keyField和valueField
     * @param keyField Map中key对应的字段
     * @param valueField Map中value对应的字段
     */
    public MapParam(String keyField, String valueField) {
        this.put(KEY_FIELD, keyField);
        this.put(VALUE_FIELD, valueField);
    }
}
