import 'package:flutter/foundation.dart';

class Config {
  // Defaults (safe fallbacks)
  static const String _devBaseUrl = 'http://localhost:8080';
  static const String _prodBaseUrl = 'https://renthub-4.onrender.com';

  // Computed base URL
  static String get baseUrl {
    return kReleaseMode ? _prodBaseUrl : _devBaseUrl;
  }
}
