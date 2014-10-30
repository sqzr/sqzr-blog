package util;

import net.sf.json.JSONObject;

import java.security.MessageDigest;
import java.util.HashMap;
import java.util.Map;

/**
 * blog www.micmiu.com
 *
 * @author Michael
 *
 */
public class EncoderHandler {

    private static final String ALGORITHM = "MD5";

    private static final char[] HEX_DIGITS = { '0', '1', '2', '3', '4', '5',
            '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };

    /**
     * encode string
     *
     * @param algorithm
     * @param str
     * @return String
     */
    public static String encode(String algorithm, String str) {
        if (str == null) {
            return null;
        }
        try {
            MessageDigest messageDigest = MessageDigest.getInstance(algorithm);
            messageDigest.update(str.getBytes());
            return getFormattedText(messageDigest.digest());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    /**
     * encode By MD5
     *
     * @param str
     * @return String
     */
    public static String encodeByMD5(String str) {
        if (str == null) {
            return null;
        }
        try {
            MessageDigest messageDigest = MessageDigest.getInstance(ALGORITHM);
            messageDigest.update(str.getBytes());
            return getFormattedText(messageDigest.digest());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    /**
     * Takes the raw bytes from the digest and formats them correct.
     *
     * @param bytes
     *            the raw bytes from the digest.
     * @return the formatted bytes.
     */
    private static String getFormattedText(byte[] bytes) {
        int len = bytes.length;
        StringBuilder buf = new StringBuilder(len * 2);
        // 把密文转换成十六进制的字符串形式
        for (int j = 0; j < len; j++) { 			buf.append(HEX_DIGITS[(bytes[j] >> 4) & 0x0f]);
            buf.append(HEX_DIGITS[bytes[j] & 0x0f]);
        }
        return buf.toString();
    }

    public static void main(String[] args) {
        System.out.println("111111 MD5  :"
                + EncoderHandler.encodeByMD5("111111"));
        System.out.println("111111 MD5  :"
                + EncoderHandler.encode("MD5", "111111"));
        System.out.println("111111 SHA1 :"
                + EncoderHandler.encode("SHA1", "111111"));
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("userId", 1001);
        map.put("userName", "张三");
        map.put("userSex", "男");
        JSONObject jsonObject = JSONObject.fromObject(map);
        System.out.println(jsonObject);
    }

}