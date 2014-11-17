import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.redis.core.RedisTemplate;

import java.text.ParseException;

/**
 * Created by weiyang on 2014/11/16.
 */
public class RedisTest {
    public static void main(String[] args) throws ParseException {
//        Jedis jedis = new Jedis("127.0.0.1", 6379);
//        System.out.println(jedis.get("name"))
        ApplicationContext app = new ClassPathXmlApplicationContext("spring-config.xml");
        RedisTemplate rt = (RedisTemplate) app.getBean("redisTemplate");
        rt.opsForValue().append("xxoo", "test");
        System.out.print(rt.opsForValue().get("name"));
    }
}
