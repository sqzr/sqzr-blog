import java.text.ParseException;
import java.util.UUID;

/**
 * Created by weiyang on 2014/9/28.
 */
public class datetest {
    public static void main(String[] args) throws ParseException {
//        PrettyTime prettyTime = new PrettyTime();
//        DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        Date dateFormat = format.parse("2013-09-27 12:38:34".toString());
//        System.out.println(new Random().nextInt());
        System.out.println(UUID.randomUUID().toString());
        System.out.println(getExtensionName("asdasdsa.jsp.png.xxoo"));
    }

    public static String getExtensionName(String filename) {
        if ((filename != null) && (filename.length() > 0)) {
            int dot = filename.lastIndexOf('.');
            if ((dot > -1) && (dot < (filename.length() - 1))) {
                return filename.substring(dot + 1);
            }
        }
        return filename;
    }
}
