package handler;

import org.apache.ibatis.session.ResultContext;
import org.apache.ibatis.session.ResultHandler;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by weiyang on 2014/11/17.
 */
public class MapResultHandler implements ResultHandler {
    private Map mappedResults = new HashMap();

    @Override
    public void handleResult(ResultContext context) {
        Map map = (Map) context.getResultObject();
        mappedResults.put(map.get("name"), map.get("value"));
    }

    public Map getMappedResults() {
        return mappedResults;
    }
}
