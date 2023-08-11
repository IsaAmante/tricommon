import 'package:diacritic/diacritic.dart';

extension StringExtension on String {
  String get capitalized => isNotEmpty ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : this;
  String get titleCased => isNotEmpty ? split(' ').map((word) => word.capitalized).join(' ') : this;
  String get removeAccents => removeDiacritics(this);
}
