import 'package:ed_tech/config/app_colors.dart';
import 'package:ed_tech/config/theme/theme_provider.dart';
import 'package:ed_tech/core/utils/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MTXOHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double height;
  final Color? backgroundColor;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final bool showThemeToggle;

  const MTXOHeader({
    Key? key,
    this.title = "MTXO Labs",
    this.height = 100.0,
    this.backgroundColor,
    this.showBackButton = false,
    this.onBackPressed,
    this.showThemeToggle = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        final isDarkMode = themeProvider.isDarkMode;

        return Container(
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor ??
                (isDarkMode ? AppColors.headerDark : AppColors.headerLight),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black.withOpacity(0.1),
            //     blurRadius: 4,
            //     offset: const Offset(0, 2),
            //   ),
            // ],
          ),
          child: SafeArea(
            child: Padding(
              padding: SizeConfig.getPaddingSymmetric(horizontal: 15),
              child: Row(
                children: [
                  // Back button (optional) - takes fixed space
                  SizedBox(
                    width: showBackButton ? 48 : 0,
                    child: showBackButton
                        ? IconButton(
                            onPressed: onBackPressed ??
                                () => Navigator.of(context).pop(),
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: isDarkMode ? Colors.white : Colors.black87,
                              size: SizeConfig.height(10),
                            ),
                          )
                        : null,
                  ),

                  // MTXO Labs Logo and Brand - Centered
                  Expanded(
                    child: Padding(
                      padding: SizeConfig.getPaddingOnly(left: 40),
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Logo Container
                            Container(
                              width: SizeConfig.width(10),
                              height: SizeConfig.height(4.5),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF19B1FF),
                                    Color(0xFF458CFF),
                                    Color(0xFF8162FF)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Center(
                                child: Text(
                                  'M',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: SizeConfig.width(2)),

                            // Brand Text
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: 'MTXO ',
                                        style: TextStyle(
                                          color: Color(0xFF06B6D4),
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Labs',
                                        style: TextStyle(
                                          color: isDarkMode
                                              ? Colors.white
                                              : Colors.black87,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Theme Toggle Button - Enhanced with multiple theme modes
                  SizedBox(
                    width: showThemeToggle ? 70 : 0,
                    child: showThemeToggle
                        ? _buildThemeToggleButton(
                            context, themeProvider, isDarkMode)
                        : null,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildThemeToggleButton(
      BuildContext context, ThemeProvider themeProvider, bool isDarkMode) {
    return PopupMenuButton<AppThemeMode>(
      onSelected: (AppThemeMode mode) {
        themeProvider.setThemeMode(context, mode);
      },
      itemBuilder: (BuildContext context) => [
        PopupMenuItem<AppThemeMode>(
          value: AppThemeMode.light,
          child: Row(
            children: [
              Icon(
                Icons.light_mode,
                color: themeProvider.themeMode == AppThemeMode.light
                    ? const Color(0xFF06B6D4)
                    : (isDarkMode ? Colors.white70 : Colors.black54),
                size: 20,
              ),
              const SizedBox(width: 12),
              Text(
                'Light',
                style: TextStyle(
                  color: themeProvider.themeMode == AppThemeMode.light
                      ? const Color(0xFF06B6D4)
                      : (isDarkMode ? Colors.white : Colors.black87),
                  fontWeight: themeProvider.themeMode == AppThemeMode.light
                      ? FontWeight.w600
                      : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
        PopupMenuItem<AppThemeMode>(
          value: AppThemeMode.dark,
          child: Row(
            children: [
              Icon(
                Icons.dark_mode,
                color: themeProvider.themeMode == AppThemeMode.dark
                    ? const Color(0xFF06B6D4)
                    : (isDarkMode ? Colors.white70 : Colors.black54),
                size: 20,
              ),
              const SizedBox(width: 12),
              Text(
                'Dark',
                style: TextStyle(
                  color: themeProvider.themeMode == AppThemeMode.dark
                      ? const Color(0xFF06B6D4)
                      : (isDarkMode ? Colors.white : Colors.black87),
                  fontWeight: themeProvider.themeMode == AppThemeMode.dark
                      ? FontWeight.w600
                      : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
        PopupMenuItem<AppThemeMode>(
          value: AppThemeMode.system,
          child: Row(
            children: [
              Icon(
                Icons.brightness_auto,
                color: themeProvider.themeMode == AppThemeMode.system
                    ? const Color(0xFF06B6D4)
                    : (isDarkMode ? Colors.white70 : Colors.black54),
                size: 20,
              ),
              const SizedBox(width: 12),
              Text(
                'System',
                style: TextStyle(
                  color: themeProvider.themeMode == AppThemeMode.system
                      ? const Color(0xFF06B6D4)
                      : (isDarkMode ? Colors.white : Colors.black87),
                  fontWeight: themeProvider.themeMode == AppThemeMode.system
                      ? FontWeight.w600
                      : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ],
      offset: const Offset(0, 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: isDarkMode ? const Color(0xFF374151) : Colors.white,
      elevation: 8,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isDarkMode
              ? const Color(0xFF374151).withOpacity(0.8)
              : const Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color:
                isDarkMode ? const Color(0xFF4B5563) : const Color(0xFFD1D5DB),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _getThemeIcon(themeProvider.themeMode, isDarkMode),
              size: 20,
              color: const Color(0xFF06B6D4),
            ),
            const SizedBox(width: 6),
            Icon(
              Icons.keyboard_arrow_down,
              size: 16,
              color: isDarkMode ? Colors.white70 : Colors.black54,
            ),
          ],
        ),
      ),
    );
  }

  IconData _getThemeIcon(AppThemeMode mode, bool isDarkMode) {
    switch (mode) {
      case AppThemeMode.light:
        return Icons.light_mode;
      case AppThemeMode.dark:
        return Icons.dark_mode;
      case AppThemeMode.system:
        return Icons.brightness_auto;
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
