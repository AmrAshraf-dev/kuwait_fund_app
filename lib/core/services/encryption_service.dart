import 'dart:convert';
 
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pointycastle/pointycastle.dart';

enum KeyType {
  CustomerAuthIOS,
  CustomerAuthAndroid,

}

class EncryptionService {
  late Map<KeyType, String> _keyMap;

  EncryptionService() {
    _keyMap = {
      KeyType.CustomerAuthIOS: dotenv.env['RSA_Login_PublicKey_IOS'] ?? '',
      KeyType.CustomerAuthAndroid: dotenv.env['RSA_Login_PublicKey_Android'] ?? '',
    
    };

    // Ensure all keys are loaded
    for (var key in KeyType.values) {
      if (_keyMap[key]?.isEmpty ?? true) {
        throw Exception('Key for $key is missing in the .env file.');
      }
    }
  }



  RSAPublicKey _parsePublicKey(String publicKeyPem) {
    final keyBytes = base64.decode(publicKeyPem);

    final asn1Parser = ASN1Parser(keyBytes);
    final asn1Sequence = asn1Parser.nextObject() as ASN1Sequence;
    final modulus = asn1Sequence.elements![0] as ASN1Integer;
    final exponent = asn1Sequence.elements![1] as ASN1Integer;

    return RSAPublicKey(modulus.integer!, exponent.integer!);
  }

  String encryptString(String plainText, KeyType keyType) {
    final publicKeyString = _keyMap[keyType];
    if (publicKeyString == null || publicKeyString.isEmpty) {
      throw Exception('Public key for $keyType is not set.');
    }

    final publicKey = _parsePublicKey(publicKeyString);
    final encrypter = encrypt.Encrypter(encrypt.RSA(publicKey: publicKey));

    try {
      final encrypted = encrypter.encrypt(plainText);
      return encrypted.base64;
    } catch (e) {
      throw Exception('Encryption failed for $keyType: $e');
    }
  }
}
