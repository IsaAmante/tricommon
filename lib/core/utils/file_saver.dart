import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:tricommon/core/exceptions/tribanco_exceptions.dart';
import 'package:flutter/foundation.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

class FileSaver {
  FileSaver._();

  static Future<String> save(String base64Image, String fileName) async {
    try {
      List<int> imageBytes = base64.decode(base64Image);
      var dir = (Platform.isAndroid) ? await getExternalStorageDirectory() : await getApplicationDocumentsDirectory();

      final file = File('${dir?.path}/$fileName');
      await file.writeAsBytes(imageBytes);

      return '${dir?.path}/$fileName';
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return '';
  }

  static Future<String> createAndGetImageAsUint8ListPath({
    required String fileName,
    required Uint8List image,
  }) async {
    try {
      String dirPath = (await getTemporaryDirectory()).path;
      String filePath = '$dirPath/$fileName';
      File imgFile = File(filePath);

      await imgFile.writeAsBytes(image);
      await imgFile.create(recursive: true);

      if (await imgFile.exists()) {
        await GallerySaver.saveImage(filePath);
        return filePath;
      }
      throw FileSaverException();
    } catch (e) {
      debugPrint(e.toString());
      throw FileSaverException();
    }
  }
}
