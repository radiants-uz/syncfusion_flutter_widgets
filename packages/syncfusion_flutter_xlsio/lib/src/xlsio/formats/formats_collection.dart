import '../general/workbook.dart';
import 'format.dart';

// ignore: public_member_api_docs
class FormatsCollection {
  /// Initializes new instance and sets its application and parent objects.
  FormatsCollection(Workbook workbook) {
    _parent = workbook;
    _rawFormats = <int, Format>{};
    _hashFormatStrings = <String, Format>{};
  }

  /// Represent the parent.
  late Workbook _parent;

  /// Represents the Decimal Seprator.
  // ignore: unused_field
  static const String _decimalSeparator = '.';

  /// Represents the Thousand seprator.
  // ignore: unused_field
  static const String _thousandSeparator = ',';

  /// Represents the percentage in decimal numbers.
  // ignore: unused_field
  static const String _percentage = '%';

  /// Represents the fraction symbol.
  // ignore: unused_field
  static const String _fraction = '/';

  /// Represents the index of the date format.
  // ignore: unused_field
  static const String _date = 'date';

  /// Represents the time separator.
  // ignore: unused_field
  static const String _time = ':';

  /// Represents the Exponenet Symbol.
  static const String exponent = 'E';

  /// Represents the Minus symbol.
  // ignore: unused_field
  static const String _minus = '-';

  /// Represents the Currency Symbol.
  // ignore: unused_field
  static const String _currency = r'\$';

  /// Represents the default exponential Symbol.
  static const String _default_exponential = 'E+';

  /// Index to the first user-defined number format.
  static const int _default_first_custom_index = 163;

  /// Default format Strings.
  final List<String> _defaultFormatString = <String>[
    'General',
    '0',
    '0.00',
    '#,##0',
    '#,##0.00',
    r"'$'#,##0_);\('$'#,##0\)",
    r"'$'#,##0_);[Red]\('$'#,##0\)",
    r"'$'#,##0.00_);\('$'#,##0.00\)",
    r"'$'#,##0.00_);[Red]\('$'#,##0.00\)",
    '0%',
    '0.00%',
    '0.00E+00',
    '# ?/?',
    '# ??/??',
    'm/d/yyyy',
    r'd\-mmm\-yy',
    r'd\-mmm',
    r'mmm\-yy',
    r'h:mm\\ AM/PM',
    r'h:mm:ss\\ AM/PM',
    'h:mm',
    'h:mm:ss',
    r'm/d/yyyy\\ h:mm',
    r'#,##0_);(#,##0)',
    r'#,##0_);[Red](#,##0)',
    r'#,##0.00_);(#,##0.00)',
    r'#,##0.00_);[Red](#,##0.00)',
    r"_(* #,##0_);_(* \(#,##0\);_(* '-'_);_(@_)",
    r"_('$'* #,##0_);_('$'* \(#,##0\);_('$'* '-'_);_(@_)",
    r"_(* #,##0.00_);_(* \(#,##0.00\);_(* '-'??_);_(@_)",
    r"_('$'* #,##0.00_);_('$'* \(#,##0.00\);_('$'* '-'??_);_(@_)",
    'mm:ss',
    '[h]:mm:ss',
    'mm:ss.0',
    '##0.0E+0',
    '@',
  ];

  /// Maximum number formats count in a workbook. 36 Default + 206 Custom formats.
  static const int _max_formats_count = 242;

  /// Index-to-_Format.
  late Map<int, Format> _rawFormats;

  /// Dictionary. Key - format string, value - _Format.
  late Map<String, Format> _hashFormatStrings;

  /// Gets the number of elements contained in the collection. Read-only
  int get count {
    return _rawFormats.length;
  }

  /// Represents the parent object.
  Workbook get parent {
    return _parent;
  }

  /// Indexer of the class
  // ignore: library_private_types_in_public_api
  Format operator [](dynamic index) => _rawFormats[index]!;

  /// Inserts all default formats into list.
  void insertDefaultFormats() {
    Format curFormat;
    int iFormatIndex = 0;
    final int iLength = _defaultFormatString.length;
    for (int iIndex = 0; iIndex < iLength; iIndex++) {
      curFormat = Format(this);
      curFormat.index = iFormatIndex;
      curFormat.formatString = _defaultFormatString[iIndex];
      if (!_rawFormats.containsKey(curFormat.index)) {
        _rawFormats[curFormat.index] = curFormat;
        _hashFormatStrings[curFormat.formatString!] = curFormat;
      }
      if (iFormatIndex == 22) {
        iFormatIndex = 36;
      }
      iFormatIndex++;
    }
  }

  /// Gets all used formats.
  List<Format> getUsedFormats() {
    final List<Format> result = <Format>[];

    final List<int> keys = _rawFormats.keys.toList();
    final int index = keys.indexOf(49);

    /// 49 is last index of always present formats
    final int iCount = _rawFormats.length;

    if (index >= 0 && index < iCount - 1) {
      for (int i = index + 1; i < iCount; i++) {
        final Format format = _rawFormats[keys[i]]!;

        if (format.index >= _default_first_custom_index) {
          result.add(format);
        }
      }
    }

    return result;
  }

  /// Searches for format with specified format string and creates one if a match is not found.
  int findOrCreateFormat(String? formatString) {
    return _hashFormatStrings.containsKey(formatString)
        ? _hashFormatStrings[formatString]!.index
        : createFormat(formatString);
  }

  /// Method that creates format object based on the format string and registers it in the workbook.
  int createFormat(String? formatString) {
    if (formatString == null) {
      throw Exception('formatString');
    }

    if (formatString.isEmpty) {
      throw Exception('formatString - string cannot be empty');
    }
    if (formatString.contains(_default_exponential.toLowerCase())) {
      formatString = formatString.replaceAll(
        _default_exponential.toLowerCase(),
        _default_exponential,
      );
    }
    //      formatString = GetCustomizedString(formatString);
    if (_hashFormatStrings.containsKey(formatString)) {
      final Format format = _hashFormatStrings[formatString]!;
      return format.index;
    }
    if (_parent.cultureInfo.culture == 'en-US') {
      final String localStr = formatString.replaceAll(r"'$'", r'\$');

      /// To know if the format string to be created is a pre-defined one.
      for (final String formatStr in _hashFormatStrings.keys) {
        if (formatStr.replaceAll(r'\\', '').replaceAll(r"'$'", r'\$') ==
            localStr) {
          final Format format = _hashFormatStrings[formatStr]!;
          return format.index;
        }
      }
    }
    final int iCount = _rawFormats.length;
    int index = _rawFormats.keys.toList()[iCount - 1];

    /// NOTE: By Microsoft, indexes less than 163 are reserved for build-in formats.
    if (index < _default_first_custom_index) {
      index = _default_first_custom_index;
    }
    index++;

    if (iCount < _max_formats_count) {
      final Format format = Format(this);
      format.formatString = formatString;
      format.index = index;
      _register(format);
    } else {
      return 0;
    }
    return index;
  }

  /// Determines whether the IDictionary contains an element with the specified key.
  bool contains(int key) {
    return _rawFormats.containsKey(key);
  }

  /// Determines whether the IDictionary contains an element with the specified key.
  // ignore: unused_element
  bool _containsFormat(String format) {
    return _hashFormatStrings.containsKey(format);
  }

  /// Adding formats to collection
  void _register(Format format) {
    _rawFormats[format.index] = format;
    _hashFormatStrings[format.formatString!] = format;
  }

  ///  Removes all elements from the IDictionary.

  void clear() {
    for (final MapEntry<String, Format> format in _hashFormatStrings.entries) {
      format.value.clear();
    }
    _rawFormats.clear();
    _hashFormatStrings.clear();
    _defaultFormatString.clear();
  }
}
