package helper;

public class StringHelper {
    public static String cutExtension(String str) {
	return str.substring(0, str.lastIndexOf("."));
    }
}
