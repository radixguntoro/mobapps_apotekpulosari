class TextTransform {
  static String capitalize(String string) {
    if (string == null) {
      throw ArgumentError.notNull('string');
    }

    if (string.isEmpty) {
      return string;
    }

    return string[0].toUpperCase() + string.substring(1);
  }

  static String title(String string) {
    return string.replaceAllMapped(
        RegExp(
          r'[A-Z]{2,}(?=[A-Z][a-z]+[0-9]*|\b)|[A-Z]?[a-z]+[0-9]*|[A-Z]|[0-9]+'),
        (Match m) =>
          "${m[0][0].toUpperCase()}${m[0].substring(1).toLowerCase()}")
    .replaceAll(RegExp(r'(_)+'), ' ');
  }
}