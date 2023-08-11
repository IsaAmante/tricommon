import 'package:tricommon/common.dart';

class UrlLauncher {
  /// May throw UrlLauncherException
  static Future<void> tryLaunch(String url) async {
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      try {
        if (!(await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        ))) {
          throw UrlLauncherException();
        }
      } catch (_) {
        throw UrlLauncherException();
      }
    } else {
      throw UrlLauncherException();
    }
  }
}
