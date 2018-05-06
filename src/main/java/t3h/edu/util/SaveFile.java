package t3h.edu.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.apache.poi.ss.usermodel.DataFormatter;

public class SaveFile {
	SimpleDateFormat dateParse = new SimpleDateFormat("dd/MM/yyyy");
	SimpleDateFormat datetimeParse = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
	SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
	DataFormatter df = new DataFormatter();
	int MAX_MEMORY_SIZE = 1024 * 1024 * 60; // 60MB

	String vn_lower = "à,á,ả,ã,ạ,â,ầ,ấ,ẩ,ẫ,ậ,ă,ằ,ắ,ẳ,ẵ,f,è,é,ẻ,ẽ,ẹ,ê,ề,ế,ể,ễ,ệ,ì,í,ỉ,ĩ,ị,ò,ó,ỏ,õ,ọ,ô,ồ,ố,ổ,ỗ,ộ,ơ,ờ,ớ,ở,ỡ,ợ,ù,ú,ủ,ũ,ụ,ư,ừ,ứ,ử,ữ,ự,ỳ,ý,ỷ,ỹ,ỵ,đ";
	String vn_upper = "À,Á,Ả,Ã,Ạ,Â,Ầ,Ấ,Ẩ,Ẫ,Ậ,Ă,Ằ,Ắ,Ẳ,Ẵ,Ặ,È,É,Ẻ,Ẽ,Ẹ,Ê,Ề,Ế,Ể,Ễ,Ệ,Ì,Í,Ỉ,Ĩ,Ị,Ò,Ó,Ỏ,Õ,Ọ,Ô,Ồ,Ố,Ổ,Ỗ,Ộ,Ơ,Ờ,Ớ,Ở,Ỡ,Ợ,Ù,Ú,Ủ,Ũ,Ụ,Ư,Ừ,Ứ,Ử,Ữ,Ự,Ỳ,Ý,Ỷ,Ỹ,Ỵ,Đ";
	String en_lower = "a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,e,e,e,e,e,e,e,e,e,e,e,i,i,i,i,i,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,u,u,u,u,u,u,u,u,u,u,u,y,y,y,y,y,d";
	String en_upper = "A,A,A,A,A,A,A,A,A,A,A,A,A,A,A,A,A,E,E,E,E,E,E,E,E,E,E,E,I,I,I,I,I,O,O,O,O,O,O,O,O,O,O,O,O,O,O,O,O,O,U,U,U,U,U,U,U,U,U,U,U,Y,Y,Y,Y,Y,D";
	String character_iso_8859_1_map = "&quot;,&apos;,&amp;,&lt;,&gt;,&nbsp;,&iexcl;,&cent;,&pound;,&curren;,&yen;,&brvbar;,&sect;,&uml;,&copy;,&ordf;,&laquo;,&not;,&shy;,&reg;,&macr;,&deg;,&plusmn;,&sup2;,&sup3;,&acute;,&micro;,&para;,&middot;,&cedil;,&sup1;,&ordm;,&raquo;,&frac14;,&frac12;,&frac34;,&iquest;,&times;,&divide;,&Agrave;,&Aacute;,&Acirc;,&Atilde;,&Auml;,&Aring;,&AElig;,&Ccedil;,&Egrave;,&Eacute;,&Ecirc;,&Euml;,&Igrave;,&Iacute;,&Icirc;,&Iuml;,&ETH;,&Ntilde;,&Ograve;,&Oacute;,&Ocirc;,&Otilde;,&Ouml;,&Oslash;,&Ugrave;,&Uacute;,&Ucirc;,&Uuml;,&Yacute;,&THORN;,&szlig;,&agrave;,&aacute;,&acirc;,&atilde;,&auml;,&aring;,&aelig;,&ccedil;,&egrave;,&eacute;,&ecirc;,&euml;,&igrave;,&iacute;,&icirc;,&iuml;,&eth;,&ntilde;,&ograve;,&oacute;,&ocirc;,&otilde;,&ouml;,&oslash;,&ugrave;,&uacute;,&ucirc;,&uuml;,&yacute;,&thorn;,&yuml;";
	String[] character_iso_8859_1_map_arr = character_iso_8859_1_map.split(",");
	String character_unicode = "\",',&,<,>, ,¡,¢,£,¤,¥,¦,§,¨,©,ª,«,¬,�­,®,¯,°,±,²,³,´,µ,¶,·,¸,¹,º,»,¼,½,¾,¿,×,÷,À,Á,Â,Ã,Ä,Å,Æ,Ç,È,É,Ê,Ë,Ì,Í,Î,Ï,Ð,Ñ,Ò,Ó,Ô,Õ,Ö,Ø,Ù,Ú,Û,Ü,Ý,Þ,ß,à,á,â,ã,ä,å,æ,ç,è,é,ê,ë,ì,í,î,ï,ð,ñ,ò,ó,ô,õ,ö,ø,ù,ú,û,ü,ý,þ,ÿ";
	String[] character_unicode_arr = character_unicode.split(",");

	public void prepare(FileItemStream item, InputStream stream, String rootPath) {
		String fileName = getEnStringFromVnString(item.getName()).replaceAll(" +", "");
		saveFile(stream, fileName, rootPath);
	}

	public String saveFile(InputStream in, String fileName, String path) {
		String result = "";
		File fileUploaded = null;
		try {
			String orgFileName = fileName.substring(0, fileName.lastIndexOf("."));
			String extFileName = fileName.substring(orgFileName.length()).toLowerCase();
			String finalFileName = orgFileName + getCurrentTime() + extFileName;
			int j = 0;
			path = path + fileName;
			while (true) {
				fileUploaded = new File(path);
				if (fileUploaded.exists())
					finalFileName = orgFileName + getCurrentTime() + "_" + j + extFileName;
				else
					break;
				j++;
			}
			fileUploaded = new File(path);
			OutputStream out = new FileOutputStream(fileUploaded);
			byte[] buf = new byte[1024];
			int len;
			while ((len = in.read(buf)) > 0) {
				out.write(buf, 0, len);
			}
			if (fileUploaded.exists())
				// ghi file thanh cong, tra ve ten file
				result = finalFileName;
			out.close();
			in.close();
		} catch (Exception e) {
			result = "{RESULT:'FAIL',VALUE:'" + e.getMessage() + "'}";
		}
		return result;
	}

	public String getCurrentTime() {
		Calendar cal = Calendar.getInstance();
		String format = "_yyyyMMddHHmmss";
		DateFormat dateFormat = new SimpleDateFormat(format);
		return dateFormat.format(cal.getTime());
	}

	private String getEnStringFromVnString(String vnUtf8String) {
		String vn_char_lower = vn_lower.replaceAll(",", "");
		String vn_char_upper = vn_upper.replaceAll(",", "");
		String en_char_lower = en_lower.replaceAll(",", "");
		String en_char_upper = en_upper.replaceAll(",", "");

		if (vnUtf8String == null)
			return "";
		if (vnUtf8String.length() == 0)
			return "";

		String a = "";
		String s = ClearISO_8859_1_From_UTF8String(vnUtf8String);

		char b;
		for (int i = 0; i < s.length(); i++) {
			b = s.charAt(i);
			for (int j = 0; j < vn_char_lower.length(); j++) {
				if (b == vn_char_lower.charAt(j)) {
					b = en_char_lower.charAt(j);
					break;
				} else if (b == vn_char_upper.charAt(j)) {
					b = en_char_upper.charAt(j);
					break;
				}
			}

			a = a + Character.toString(b);
		}
		return a;
	}

	public String ClearISO_8859_1_From_UTF8String(String s) {
		try {
			if (s == null)
				return "";
			if (s.length() == 0)
				return "";

			String result = s;

			for (int i = 0; i < character_iso_8859_1_map_arr.length; i++) {
				String s1 = character_iso_8859_1_map_arr[i];
				// replace iso 8859_1 string by unicode string
				result = result.replaceAll(s1, character_unicode_arr[i]);
			}

			return result;
		} catch (Exception ex) {
			ex.printStackTrace();
			return "";
		}
	}
}
