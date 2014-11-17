package dao.impl;

import dao.OptionDao;
import model.Option;
import org.springframework.data.redis.core.RedisTemplate;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by weiyang on 2014/11/16.
 */
public class OptionRedisDaoImpl implements OptionDao {
    private RedisTemplate redisTemplate;

    @Override
    public Map<String, String> getAllOption() {
        Map<String, String> test = new HashMap<String, String>();
        test.put("title", new HashMap<String, String>().put("title", "sqzr"));
        return test;
    }

    @Override
    public int update(Option option) {
        redisTemplate.opsForValue().set(option.getName(), option.getValue());
        return 1;
    }

    // ---


    public RedisTemplate getRedisTemplate() {
        return redisTemplate;
    }

    public void setRedisTemplate(RedisTemplate redisTemplate) {
        this.redisTemplate = redisTemplate;
    }
}
