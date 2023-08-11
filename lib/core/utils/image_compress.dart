import 'dart:typed_data';

import 'package:flutter_image_compress/flutter_image_compress.dart';

Future<Uint8List?> compressPhoto(String file) async {
  var result = await FlutterImageCompress.compressWithFile(
    file,
    quality: 15,
    rotate: 0,
    format: CompressFormat.jpeg,
  );
  return result;
}

Future<Uint8List?> compressPhotoCamera(Uint8List file) async {
  var result = await FlutterImageCompress.compressWithList(
    file,
    quality: 15,
    rotate: 0,
    format: CompressFormat.jpeg,
  );
  return result;
}
