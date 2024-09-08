import 'package:myskin_flutterbytes/src/cores/cores.dart';

/// WIDGET EXTENSIONS
extension WidgetsList on List<Widget> {
  List<Widget> separate(Widget separator) {
    List<Widget> separatedList = [];
    for (var i = 0; i < length; i++) {
      separatedList.add(this[i]);
      if (i < length - 1) {
        separatedList.add(separator);
      }
    }
    return separatedList;
  }
}

extension WidgetExtension on Widget {
  Widget expand({int? flex}) {
    return Expanded(
      flex: flex ?? 1,
      child: this,
    );
  }

  Widget padding({
    required double horizontal,
    required double vertical,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal,
        vertical: vertical,
      ),
      child: this,
    );
  }
}

extension NameInitials on String {
  String get initials {
    final name = trim().toLowerCase();

    final parts = name.split(RegExp(r'[\s-]+'));

    final filteredParts = parts.where((part) {
      final commonPrefixes = [
        'de',
        'van',
        'von',
        'der',
        'den',
        'le',
        'la',
        'du',
        'di'
      ];
      final commonSuffixes = ['jr', 'sr', 'ii', 'iii', 'iv', 'v'];
      return part.isNotEmpty &&
          !commonPrefixes.contains(part) &&
          !commonSuffixes.contains(part);
    }).toList();

    if (filteredParts.isEmpty) {
      return '';
    }

    String initials = filteredParts.map((part) => part[0].toUpperCase()).join();

    if (initials.length == 1 && filteredParts[0].length > 1) {
      initials += filteredParts[0][1].toUpperCase();
    }

    return initials.substring(0, initials.length.clamp(0, 3));
  }
}
