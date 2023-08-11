import 'dart:convert';

import 'package:crypto/crypto.dart';

class ShaAtom {
  static final List pemArray = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z',
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z',
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '+',
    '/'
  ];

  String reencode(shahex) {
    var bytesInput = utf8.encode(shahex);
    var digest1 = sha1.convert(bytesInput).bytes;
    return _encode(digest1);
  }

  String encodeSha1(String value) {
    final bytes = utf8.encode(value);
    return sha1.convert(bytes).toString();
  }

  _encode(List<int> digest) {
    String sha = "";
    for (int j = 0; j <= digest.length; (j += 3)) {
      int size;
      if ((j + 3) <= digest.length) {
        size = 3;
      } else {
        size = (digest.length - j);
      }
      List<int> block = List.filled(3, 0);
      List.copyRange(block, 0, digest, j, j + size);
      sha = sha + (_encodeAtom(block, 0, size));
    }
    return sha;
  }

  _encodeAtom(List<int> data, int offset, int len) {
    StringBuffer buf = StringBuffer();
    if (len == 1) {
      int a = data[offset];
      int b = 0;
      buf.write(pemArray[a >>> 2 & 0x3f]);
      buf.write(pemArray[(a << 4 & 0x30) + (b >>> 4 & 0xf)]);
      buf.write('=');
      buf.write('=');
    } else if (len == 2) {
      int a = data[offset];
      int b = data[offset + 1];
      int c = 0;
      buf.write(pemArray[a >>> 2 & 0x3f]);
      buf.write(pemArray[(a << 4 & 0x30) + (b >>> 4 & 0xf)]);
      buf.write(pemArray[(b << 2 & 0x3c) + (c >>> 6 & 3)]);
      buf.write('=');
    } else {
      int a = data[offset];
      int b = data[offset + 1];
      int c = data[offset + 2];
      buf.write(pemArray[a >>> 2 & 0x3f]);
      buf.write(pemArray[(a << 4 & 0x30) + (b >>> 4 & 0xf)]);
      buf.write(pemArray[(b << 2 & 0x3c) + (c >>> 6 & 3)]);
      buf.write(pemArray[c & 0x3f]);
    }
    return buf.toString();
  }
}
