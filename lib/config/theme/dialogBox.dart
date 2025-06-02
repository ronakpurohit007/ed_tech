// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:pucho/config/theme/theme_provider.dart';
// import 'package:pucho/shared/languagemanagement/language_provider.dart';

// class ThemeSelectionDialog extends StatelessWidget {
//   final LanguageProvider languageProvider;

//   const ThemeSelectionDialog({
//     Key? key,
//     required this.languageProvider,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);
    
//     return AlertDialog(
//       title: Text(languageProvider.translations['choose_theme'] ?? 'Choose Theme'),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           _buildThemeOption(
//             context,
//             title: languageProvider.translations['light_theme'] ?? 'Light',
//             isSelected: themeProvider.themeMode == ThemeMode.light,
//             onTap: () => _selectTheme(context, ThemeMode.light),
//           ),
//           const SizedBox(height: 12),
//           _buildThemeOption(
//             context,
//             title: languageProvider.translations['dark_theme'] ?? 'Dark',
//             isSelected: themeProvider.themeMode == ThemeMode.dark,
//             onTap: () => _selectTheme(context, ThemeMode.dark),
//           ),
//           const SizedBox(height: 12),
//           _buildThemeOption(
//             context,
//             title: languageProvider.translations['system_theme'] ?? 'System',
//             isSelected: themeProvider.themeMode == ThemeMode.system,
//             onTap: () => _selectTheme(context, ThemeMode.system),
//           ),
//         ],
//       ),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.pop(context),
//           child: Text(languageProvider.translations['cancel'] ?? 'Cancel'),
//         ),
//       ],
//     );
//   }

//   Widget _buildThemeOption(
//     BuildContext context, {
//     required String title,
//     required bool isSelected,
//     required VoidCallback onTap,
//   }) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(8),
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8),
//           color: isSelected
//               ? Theme.of(context).colorScheme.primaryContainer
//               : Colors.transparent,
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               title,
//               style: TextStyle(
//                 fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//                 color: isSelected
//                     ? Theme.of(context).colorScheme.onPrimaryContainer
//                     : Theme.of(context).textTheme.bodyLarge?.color,
//               ),
//             ),
//             if (isSelected)
//               Icon(
//                 Icons.check_circle,
//                 color: Theme.of(context).colorScheme.primary,
//               ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _selectTheme(BuildContext context, ThemeMode mode) {
//     final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
//     themeProvider.setThemeMode(context, mode);
//     Navigator.pop(context);
//   }
// }