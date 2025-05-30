import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersionUtil {
  static String _version = "Unknown";

  /// Fetch application version from package info
  static Future<void> init() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      _version = "${packageInfo.version} (${packageInfo.buildNumber})";
      printVersion();
    } catch (e) {
      debugPrint("Error fetching app version: $e");
    }
  }

  /// Get the application version
  static String get version => _version;

  /// Print version for debugging
  static void printVersion() {
    debugPrint("App Version: $_version");
  }
}
