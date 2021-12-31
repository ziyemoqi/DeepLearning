package com.yc.common.utils;

import com.yc.common.constant.CommonConstant;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang3.StringUtils;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import javax.crypto.*;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;
import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;

/**
 * 功能描述:关于加解密、加解码的工具类
 *
 * @Author: xieyc
 * @Date: 2019-05-10 13:48
 */
@Slf4j
public class EncoderUtil {

    private EncoderUtil() {

    }
    // ================= AES 加密 START ==================

    /**
     * AES加密
     *
     * @param orignalStr 明文
     * @param encryKey   aes密钥
     * @return 结果描述
     */
    public static String aesEncrypt(String orignalStr, String encryKey) {
        String encryptMsg = "";
        try {
            encryptMsg = base64Encode(aesEncryptToBytes(orignalStr, encryKey));
        } catch (Exception e) {
            log.error("AES加密失败", e);
        }
        return encryptMsg;
    }

    /**
     * base 64 encode
     *
     * @param bytes 待编码的byte[]
     * @return 编码后的base 64 code
     */
    private static String base64Encode(byte[] bytes) {
        return new BASE64Encoder().encode(bytes);
    }

    /**
     * AES加密
     *
     * @param content    待加密的内容
     * @param encryptKey 加密密钥
     * @return 加密后的byte[]
     */
    private static byte[] aesEncryptToBytes(String content, String encryptKey) {
        byte[] decryptBytes = new byte[0];
        try {
            KeyGenerator kgen = KeyGenerator.getInstance(CommonConstant.ENCODE_AES);
            SecureRandom random = SecureRandom.getInstance(CommonConstant.ALGORITHM_SHA1PRNG);
            random.setSeed(encryptKey.getBytes());
            kgen.init(128, random);
            Cipher cipher = Cipher.getInstance(CommonConstant.ENCODE_AES_CIPHERS);
            cipher.init(Cipher.ENCRYPT_MODE, new SecretKeySpec(kgen.generateKey().getEncoded(), CommonConstant.ENCODE_AES));
            decryptBytes = cipher.doFinal(content.getBytes(StandardCharsets.UTF_8));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return decryptBytes;
    }

    /**
     * Aes解密
     *
     * @param encryptStr 密文
     * @param decryptKey aeskey
     * @return str
     */
    public static String aesDecrypt(String encryptStr, String decryptKey) {
        if (StringUtils.isNotBlank(encryptStr)) {
            try {
                return aesDecryptByBytes(base64Decode(encryptStr), decryptKey);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    /**
     * base64解密
     *
     * @param base64Code base64code
     * @return byty[]
     */
    private static byte[] base64Decode(String base64Code) {
        try {
            if (StringUtils.isNotEmpty(base64Code)) {
                return (new BASE64Decoder()).decodeBuffer(base64Code);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new byte[0];
    }

    private static String aesDecryptByBytes(byte[] encryptBytes, String decryptKey) {
        byte[] decryptBytes = new byte[0];
        try {
            KeyGenerator kgen = KeyGenerator.getInstance(CommonConstant.ENCODE_AES);
            SecureRandom random = SecureRandom.getInstance(CommonConstant.ALGORITHM_SHA1PRNG);
            random.setSeed(decryptKey.getBytes());
            kgen.init(128, random);
            Cipher cipher = Cipher.getInstance(CommonConstant.ENCODE_AES_CIPHERS);
            cipher.init(2, new SecretKeySpec(kgen.generateKey().getEncoded(), CommonConstant.ENCODE_AES));
            decryptBytes = cipher.doFinal(encryptBytes);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new String(decryptBytes);
    }
    // ================= AES 加密 END ====================

    // ================= RSA 加密 END ====================

    /**
     * RSA公钥加密
     *
     * @param str       加密字符串
     * @param publicKey 公钥
     * @return 密文
     * @throws Exception 加密过程中的异常信息
     */
    public static String rsaEncrypt(String str, String publicKey) {
        String resultStr = null;
        try {
            byte[] decoded = Base64.decodeBase64(publicKey);
            RSAPublicKey pubKey = (RSAPublicKey) KeyFactory.getInstance(CommonConstant.ENCODE_RSA).generatePublic(new X509EncodedKeySpec(decoded));
            Cipher cipher = Cipher.getInstance(CommonConstant.ENCODE_RSA);
            cipher.init(Cipher.ENCRYPT_MODE, pubKey);
            resultStr = Base64.encodeBase64String(cipher.doFinal(str.getBytes(StandardCharsets.UTF_8)));
        } catch (InvalidKeySpecException | NoSuchAlgorithmException | NoSuchPaddingException | InvalidKeyException | IllegalBlockSizeException | BadPaddingException e) {
            e.printStackTrace();
        }
        return resultStr;
    }

    /**
     * RSA私钥解密
     *
     * @param str        加密字符串
     * @param privateKey 私钥
     * @return 铭文
     * @throws Exception 解密过程中的异常信息
     */
    public static String rsaDecrypt(String str, String privateKey) {
        byte[] decryptBytes = new byte[0];
        //64位解码加密后的字符串
        byte[] inputByte = Base64.decodeBase64(str.getBytes(StandardCharsets.UTF_8));
        //base64编码的私钥
        byte[] decoded = Base64.decodeBase64(privateKey);
        try {
            RSAPrivateKey priKey = (RSAPrivateKey) KeyFactory.getInstance(CommonConstant.ENCODE_RSA).generatePrivate(new PKCS8EncodedKeySpec(decoded));
            //RSA解密
            Cipher cipher = Cipher.getInstance(CommonConstant.ENCODE_RSA);
            cipher.init(Cipher.DECRYPT_MODE, priKey);
            decryptBytes = cipher.doFinal(inputByte);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new String(decryptBytes);
    }

    // ================= RSA 加密 END ====================
}
