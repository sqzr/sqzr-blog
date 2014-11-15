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

    public void update(List<Option> options);

    /**
     * 更新单个配置
     *
     * @param option
     * @return
     */
    public boolean update(Option option);
}
