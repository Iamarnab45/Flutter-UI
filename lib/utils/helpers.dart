class Helpers {
  static String formatName(String name) {
    return name.trim().split(' ').map((e) => e.capitalize()).join(' ');
  }
}

extension StringCasingExtension on String {
  String capitalize() =>
      isEmpty ? '' : '${this[0].toUpperCase()}${substring(1)}';
}
