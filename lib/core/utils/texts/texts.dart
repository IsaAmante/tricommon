import 'package:tricommon/common.dart';

class Texts {
  Texts._();

  static Map<String, dynamic>? texts;

  static String getText(
    FlowPage flowPage,
    String id,
  ) {
    if (texts != null) {
      if (!texts!.containsKey(flowPage.flow)) return 'not_founded';
      if (!texts![flowPage.flow].containsKey(flowPage.page)) return 'not_founded';
      if (!texts![flowPage.flow][flowPage.page].containsKey(id)) {
        return 'not_founded';
      }
      return texts![flowPage.flow][flowPage.page][id];
    } else {
      return 'not_founded';
    }
  }
}
