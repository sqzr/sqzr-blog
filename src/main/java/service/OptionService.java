package service;

import model.Option;

import java.util.List;
import java.util.Map;

/**
 * Created by weiyang on 2014/10/7.
 */
public interface OptionService {
    /**
     * 获取所有设置
     * @return
     */
    public Map<String,Object> getAllOption();

    public void updateAll(List<Option> options);
}
