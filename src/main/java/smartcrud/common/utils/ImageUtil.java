package smartcrud.common.utils;

import org.apache.commons.codec.binary.Base64;

public class ImageUtil {
	public static String bytes2HtmlImgTag(byte[] icon) {
		byte[] base64 = Base64.encodeBase64(icon, true);
		return "<img src=\"data:image/gif;base64," + new String(base64)
				+ "\" />";
	}
}
