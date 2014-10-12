import org.ocpsoft.prettytime.PrettyTime;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * Created by weiyang on 2014/9/28.
 */
public class datetest {
    public static void main(String[] args) throws ParseException {
        PrettyTime prettyTime = new PrettyTime();
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date dateFormat = format.parse("2013-09-27 12:38:34".toString());
        System.out.println(new Random().nextInt());

    }
}
