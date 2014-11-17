package dao.impl;

import dao.OptionDao;
import model.Option;
import org.springframework.data.redis.core.RedisTemplate;

import java.util.Map;

/**
 * Created by weiyang on 2014/11/16.
 */
public class OptionRedisDaoImpl implements OptionDao {
    private RedisTemplate redisTemplate;

    @Override
    public Map<String, String> getAllOption() {
        return redisTemplate.opsForHash().entries("options");
    }

    @Override
    public int update(Option option) {
        redisTemplate.opsForHash().put("options", option.getName(), option.getValue());
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
