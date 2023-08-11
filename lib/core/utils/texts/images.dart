import 'package:tricommon/common.dart';

class Images {
  Images._();

  static Map<String, dynamic>? images;

  static String getImage(
    FlowPage flowPage,
    String id,
  ) {
    if (images != null) {
      if (!images!.containsKey(flowPage.flow)) return 'not_founded';
      if (!images![flowPage.flow].containsKey(flowPage.page)) return 'not_founded';
      if (!images![flowPage.flow][flowPage.page].containsKey(id)) {
        return 'not_founded';
      }
      return images![flowPage.flow][flowPage.page][id];
    } else {
      return 'not_founded';
    }
  }
}
