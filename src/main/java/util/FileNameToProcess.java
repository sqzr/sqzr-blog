package util;

import com.google.common.collect.ImmutableList;

import java.util.UUID;

/**
 * Created by weiyang on 2014/11/15.
 */
public class FileNameToProcess {
    /*
 * Java文件操作 获取文件扩展名
 *
 *  Created on: 2011-8-2
 *      Author: blueeagle
 */
    public static String getExtensionName(String filename) {
        if ((filename != null) && (filename.length() > 0)) {
            int dot = filename.lastIndexOf('.');
            if ((dot > -1) && (dot < (filename.length() - 1))) {
                return filename.substring(dot + 1);
            }
        }
        return filename;
    }

    /*
     * Java文件操作 获取不带扩展名的文件名
     *
     *  Created on: 2011-8-2
     *      Author: blueeagle
     */
    public static String getFileNameNoEx(String filename) {
        if ((filename != null) && (filename.length() > 0)) {
            int dot = filename.lastIndexOf('.');
            if ((dot > -1) && (dot < (filename.length()))) {
                return filename.substring(0, dot);
            }
        }
        return filename;
    }

    /**
     * 通过随机UUID生成图片名
     *
     * @param filename 完整的文件名
     * @return
     */
    public static String generateImageFileName(String filename) {
        return UUID.randomUUID().toString() + "." + getExtensionName(filename);
    }

    /**
     * 判断文件名是否图片后缀名
     *
     * @param filename
     * @return
     */
    public static boolean checkFileNameIsImage(String filename) {
        ImmutableList<String> Ex = ImmutableList.of("gif", "jpg", "jpeg", "bmp", "png");

        if (!Ex.contains(getExtensionName(filename))) {
            return false;
        }
        return true;
    }
}
