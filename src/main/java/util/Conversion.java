package util;

/**
 * Created by weiyang on 2014/9/12.
 */
public class Conversion {
    /**
     * 中文转-->unicode
     *
     * @param str
     * @return 反回unicode编码
     */
    public static String stringToUnicode(String str) {
        StringBuffer result = new StringBuffer();
        for (int i = 0; i < str.length(); i++) {
            int chr1 = (char) str.charAt(i);
            result.append("\\u" + Integer.toHexString(chr1));

        }
        return result.toString();
    }

    public static void main(String[] args) {
        String wz = "牛逼";
        System.out.println(stringToUnicode(wz));
    }
}
