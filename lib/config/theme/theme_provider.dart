import 'package:ed_tech/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppThemeMode {
  light,
  dark,
  system,
}

// Custom observer class to detect system theme changes
class _PlatformBrightnessObserver extends WidgetsBindingObserver {
  final VoidCallback onChanged;

  _PlatformBrightnessObserver({required this.onChanged});

  @override
  void didChangePlatformBrightness() {
    onChanged();
    super.didChangePlatformBrightness();
  }
}

class ThemeProvider with ChangeNotifier {
  late ThemeData _themeData;
  AppThemeMode _themeMode = AppThemeMode.system;
  bool _isDarkMode = false;

  // Reference to store the observer
  _PlatformBrightnessObserver? _brightnessObserver;

  ThemeProvider(BuildContext context) {
    _themeData = AppTheme.getLightTheme(context);
    _loadTheme(context);

    // Set up system theme change listener
    _brightnessObserver = _PlatformBrightnessObserver(
      onChanged: () {
        if (_themeMode == AppThemeMode.system) {
          _updateTheme(context);
          notifyListeners();
        }
      },
    );

    WidgetsBinding.instance.addObserver(_brightnessObserver!);
  }

  ThemeData get themeData => _themeData;
  bool get isDarkMode => _isDarkMode;
  AppThemeMode get themeMode => _themeMode;

  /// Load theme from SharedPreferences or system preference
  Future<void> _loadTheme(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    String? storedThemeMode = prefs.getString('themeMode');

    if (storedThemeMode == null) {
      _themeMode = AppThemeMode.system;
      await prefs.setString('themeMode', _themeMode.toString());
    } else {
      try {
        _themeMode = AppThemeMode.values.firstWhere(
          (e) => e.toString() == storedThemeMode,
          orElse: () => AppThemeMode.system,
        );
      } catch (e) {
        _themeMode = AppThemeMode.system;
      }
    }

    _updateTheme(context);
    notifyListeners();
  }

  void _updateTheme(BuildContext context) {
    switch (_themeMode) {
      case AppThemeMode.light:
        _isDarkMode = false;
        _themeData = AppTheme.getLightTheme(context);
        break;
      case AppThemeMode.dark:
        _isDarkMode = true;
        _themeData = AppTheme.getDarkTheme(context);
        break;
      case AppThemeMode.system:
        // Get the current system brightness
        final window = WidgetsBinding.instance.platformDispatcher;
        Brightness systemBrightness = window.platformBrightness;
        _isDarkMode = systemBrightness == Brightness.dark;
        _themeData = _isDarkMode
            ? AppTheme.getDarkTheme(context)
            : AppTheme.getLightTheme(context);
        break;
    }
  }

  Future<void> setThemeMode(BuildContext context, AppThemeMode mode) async {
    _themeMode = mode;
    _updateTheme(context);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('themeMode', _themeMode.toString());

    notifyListeners();
  }

  Future<void> toggleTheme(BuildContext context) async {
    _themeMode = _isDarkMode ? AppThemeMode.light : AppThemeMode.dark;
    await setThemeMode(context, _themeMode);
  }

  // Clean up the observer when provider is disposed
  @override
  void dispose() {
    if (_brightnessObserver != null) {
      WidgetsBinding.instance.removeObserver(_brightnessObserver!);
      _brightnessObserver = null;
    }
    super.dispose();
  }
}

//--------------------------------------------------------------------------------------

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:pucho/config/theme/app_theme.dart';

// enum AppThemeMode {
//   light,
//   // dark,
//   // system,
// }

// class ThemeProvider with ChangeNotifier {
//   late ThemeData _themeData;
//   AppThemeMode _themeMode = AppThemeMode.light;
//   bool _isDarkMode = false;

//   ThemeProvider(BuildContext context) {
//     _themeData = AppTheme.getLightTheme(context);
//     _loadTheme(context);
//   }

//   ThemeData get themeData => _themeData;
//   bool get isDarkMode => _isDarkMode;
//   AppThemeMode get themeMode => _themeMode;

//   /// Load theme from SharedPreferences or system preference
//   Future<void> _loadTheme(BuildContext context) async {
//     final prefs = await SharedPreferences.getInstance();
//     String? storedThemeMode = prefs.getString('themeMode');

//     if (storedThemeMode == null) {
//       _themeMode = AppThemeMode.light;
//       await prefs.setString('themeMode', _themeMode.toString());
//     } else {
//       _themeMode = AppThemeMode.values.firstWhere(
//         (e) => e.toString() == storedThemeMode,
//         orElse: () => AppThemeMode.light,
//       );
//     }

//     _updateTheme(context);
//     notifyListeners();
//   }

//   void _updateTheme(BuildContext context) {
//     switch (_themeMode) {
//       case AppThemeMode.light:
//         _isDarkMode = false;
//         _themeData = AppTheme.getLightTheme(context);
//         break;
//       case AppThemeMode.light:
//         _isDarkMode = true;
//         _themeData = AppTheme.getDarkTheme(context);
//         break;
//       case AppThemeMode.light:
//         Brightness systemBrightness = MediaQuery.of(context).platformBrightness;
//         _isDarkMode = systemBrightness == Brightness.dark;
//         _themeData = _isDarkMode
//             ? AppTheme.getDarkTheme(context)
//             : AppTheme.getLightTheme(context);
//         break;
//     }
//   }

//   Future<void> setThemeMode(BuildContext context, AppThemeMode mode) async {
//     _themeMode = mode;
//     _updateTheme(context);

//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('themeMode', _themeMode.toString());

//     notifyListeners();
//   }

//   Future<void> toggleTheme(BuildContext context) async {
//     _themeMode = _isDarkMode ? AppThemeMode.light : AppThemeMode.light;
//     await setThemeMode(context, _themeMode);
//   }
// }
