package dao;

import model.Option;

import java.util.List;
import java.util.Map;

/**
 * Created by weiyang on 2014/10/7.
 */
public interface OptionDao {
    /**
     * 返回所有设置
     * @return
     */
    public Map<String,Object> getAllOption();

    public void update(Option option);
}
