package t3h.edu.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.UnrecoverableEntryException;
import java.security.cert.CertificateException;
import java.util.Enumeration;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Main {
	public static void main(String[] args) throws UnrecoverableEntryException {
		KeyStore ks;
		String alias = "";
		try {
			ks = KeyStore.getInstance("JKS");
			try {
				// ks.load(new
				// FileInputStream("H:\\NEO\\2017\\Tax\\BK_NEW\\Server\\webapps\\ROOT\\WEB-INF\\cert\\vnpt.jks"),
				// "abc1234"
				// .toCharArray());
				ks.load(new FileInputStream("C:\\Users\\VuTua\\Desktop\\MY_UNT_KEYSTORE.jks"), "abc@123".toCharArray());
				Enumeration e = ks.aliases();
				while (e.hasMoreElements()) {
					alias = (String) e.nextElement();
					System.out.println(alias);
				}

				KeyStore.ProtectionParameter protParam = new KeyStore.PasswordProtection("abc@123".toCharArray());
				// KeyStore.ProtectionParameter protParam
				// = new KeyStore.PasswordProtection("abc1234".toCharArray());
				// get my private key
				KeyStore.PrivateKeyEntry pkEntry = (KeyStore.PrivateKeyEntry) ks
						.getEntry(alias, protParam);
				PrivateKey myPrivateKey = pkEntry.getPrivateKey();
				System.out.println("key " + myPrivateKey.toString());

			} catch (IOException ex) {
				Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
			} catch (NoSuchAlgorithmException ex) {
				Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
			} catch (CertificateException ex) {
				Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
			}
		} catch (KeyStoreException ex) {
			Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
		}

	}
}
