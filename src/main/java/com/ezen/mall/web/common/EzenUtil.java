package com.ezen.mall.web.common;

public class EzenUtil {
    public static String encryption(String text) {
        char[] array = text.toCharArray();
        for (int i = 0; i < array.length; i++) {
            array[i] = (char) (array[i] + 999);
        }
        return new String(array);
    }

    public static String decryption(String text){
        char[] array = text.toCharArray();
        for (int i = 0; i < array.length; i++) {
            array[i] = (char) (array[i] - 999);
        }
        return new String(array);
    }
}
