class Errors {
  Errors._();

  static Map<String, dynamic>? errors;

  static String getError(
    String id,
  ) {
    if (errors != null) {
      if (!errors!.containsKey(id)) return 'not_founded';
      return errors![id];
    } else {
      return 'not_founded';
    }
  }
}
