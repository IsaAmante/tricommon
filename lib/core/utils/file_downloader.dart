import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class FileDownloader {
  FileDownloader._();

  static Future<String> get(String url, String fileName) async {
    Dio dio = Dio();

    try {
      var dir = await getApplicationDocumentsDirectory();
      await dio.download(url, "${dir.path}/$fileName");
      return "${dir.path}/$fileName";
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return '';
  }
}
