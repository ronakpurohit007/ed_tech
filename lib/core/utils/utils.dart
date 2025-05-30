// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:pucho/shared/constants/asset_constant.dart';
// import 'package:pucho/shared/languagemanagement/language_provider.dart';

// class Utils {
//   static String _getFileExtension(String filename) {
//     return filename.contains('.') ? filename.split('.').last : '';
//   }

//   static String getIconForFileType(String filename) {
//     final extension = _getFileExtension(filename).toLowerCase();

//     switch (extension) {
//       // Documents
//       case 'doc':
//         return AssetConstant.doc;
//       case 'docx':
//         return AssetConstant.docx;
//       case 'pdf':
//         return AssetConstant.pdf;
//       case 'txt':
//         return '';
//       case 'rtf':
//         return "";
//       case 'xls':
//       case 'xlsx':
//         return "";
//       case 'ppt':
//       case 'pptx':
//         return "";

//       // Images
//       case 'jpg':
//         return AssetConstant.png;
//       case 'jpeg':
//         return AssetConstant.png;
//       case 'png':
//         return AssetConstant.png;
//       case 'gif':
//         return AssetConstant.png;
//       case 'bmp':
//         return AssetConstant.png;
//       case 'webp':
//         return AssetConstant.png;

//       // Audio
//       case 'mp3':
//         return "";
//       case 'wav':
//         return "";
//       case 'ogg':
//         return "";
//       case 'aac':
//         return "";

//       // Video
//       case 'mp4':
//         return "";
//       case 'avi':
//         return "";
//       case 'mov':
//         return "";
//       case 'wmv':
//         return "";
//       case 'mkv':
//         return "";

//       // Archives
//       case 'zip':
//         return "";
//       case 'rar':
//         return "";
//       case '7z':
//         return "";
//       case 'tar':
//         return "";
//       case 'gz':
//         return "";

//       // Code
//       case 'html':
//         return "";
//       case 'css':
//         return "";
//       case 'js':
//         return "";
//       case 'json':
//         return "";
//       case 'dart':
//         return "";
//       case 'java':
//         return "";
//       case 'py':
//         return "";
//       case 'cpp':
//         return "";

//       // Default
//       default:
//         return AssetConstant.png;
//     }
//   }
// }

// final List<Map<String, String>> languages = [
//   {'code': 'hi', 'name': 'Hindi', 'native': 'हिंदी', 'pucho': 'पूछो'},
//   {'code': 'en', 'name': 'English', 'native': 'English', 'pucho': 'Pucho'},
//   {'code': 'gu', 'name': 'Gujarati', 'native': 'ગુજરાતી', 'pucho': 'પૂછો'},
//   // {'code': 'bn', 'name': 'Bengali', 'native': 'বাংলা', 'pucho': 'পুছো'},
//   // {'code': 'kn', 'name': 'Kannada', 'native': 'ಕನ್ನಡ', 'pucho': 'ಪೂಛೊ'},
//   // {'code': 'pa', 'name': 'Punjabi', 'native': 'ਪੰਜਾਬੀ', 'pucho': 'ਪੁੱਛੋ'},
//   // {'code': 'ta', 'name': 'Tamil', 'native': 'தமிழ்', 'pucho': 'புச்சோ'},
//   // {'code': 'ml', 'name': 'Malayalam', 'native': 'മലയാളം', 'pucho': 'പുചോ'},
//   // {'code': 'ar', 'name': 'Arabic', 'native': 'عربي', 'pucho': 'بوتشو'},
//   // {'code': 'or', 'name': 'Odia', 'native': 'ଓଡ଼ିଆ', 'pucho': 'ପୁଛୋ'},
// ];

// class LanguageUtils {
//   /// Gets the list of supported languages in the application
//   static final List<Map<String, String>> languages = [
//     {'code': 'hi', 'name': 'Hindi', 'native': 'हिंदी', 'pucho': 'पूछो'},
//     {'code': 'en', 'name': 'English', 'native': 'E', 'pucho': 'Pucho'},
//     {'code': 'gu', 'name': 'Gujarati', 'native': 'ગુજરાતી', 'pucho': 'પૂછો'},
//     // {'code': 'bn', 'name': 'Bengali', 'native': 'বাংলা', 'pucho': 'পুছো'},
//     // {'code': 'kn', 'name': 'Kannada', 'native': 'ಕನ್ನಡ', 'pucho': 'ಪೂಛೊ'},
//     // {'code': 'pa', 'name': 'Punjabi', 'native': 'ਪੰਜਾਬੀ', 'pucho': 'ਪੁੱਛੋ'},
//     // {'code': 'ta', 'name': 'Tamil', 'native': 'தமிழ்', 'pucho': 'புச்சோ'},
//     // {'code': 'ml', 'name': 'Malayalam', 'native': 'മലയാളം', 'pucho': 'പുചോ'},
//     // {'code': 'ar', 'name': 'Arabic', 'native': 'عربي', 'pucho': 'بوتشو'},
//     // {'code': 'or', 'name': 'Odia', 'native': 'ଓଡ଼ିଆ', 'pucho': 'ପୁଛୋ'},
//   ];

//   static Map<String, String>? getLanguageByCode(String code) {
//     try {
//       return languages.firstWhere((lang) => lang['code'] == code);
//     } catch (e) {
//       return null;
//     }
//   }

//   static Map<String, String>? getLanguageByName(String name) {
//     try {
//       return languages.firstWhere((lang) => lang['name'] == name);
//     } catch (e) {
//       return null;
//     }
//   }

//   /// Returns a subset of languages for preview or limited displays
//   static List<Map<String, String>> getPreviewLanguages() {
//     // Returns just the first 3 languages for previews
//     return languages.take(3).toList();
//   }
// }

// // pucho logo multi language

// class LogoHelper {
//   static String getLocalizedLogo(BuildContext context) {
//     bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

//     final languageProvider =
//         Provider.of<LanguageProvider>(context, listen: false);
//     final currentLanguage = languageProvider.selectedAppLanguage;

//     switch (currentLanguage) {
//       case 'Gujarati':
//         return isDarkMode
//             ? AssetConstant.logodarkgunew
//             : AssetConstant.logolightgunew;
//       case 'Hindi':
//         return isDarkMode
//             ? AssetConstant.logodarkhinew
//             : AssetConstant.logolighthinew;
//       case 'English':
//       default:
//         return isDarkMode
//             ? AssetConstant.logodarkennew
//             : AssetConstant.logolightennew;
//     }
//   }
// }
