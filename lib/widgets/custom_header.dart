import 'package:flutter/material.dart';

class MTXOHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isDarkMode;
  final VoidCallback? onThemeToggle;
  final double height;
  final Color? backgroundColor;
  final bool showBackButton;
  final VoidCallback? onBackPressed;

  const MTXOHeader({
    Key? key,
    this.title = "Profile",
    this.isDarkMode = true,
    this.onThemeToggle,
    this.height = 100.0,
    this.backgroundColor,
    this.showBackButton = false,
    this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ??
            (isDarkMode ? const Color(0xFF1E293B) : Colors.white),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              // Back button (optional) - takes fixed space
              SizedBox(
                width: showBackButton ? 48 : 0,
                child: showBackButton
                    ? IconButton(
                        onPressed:
                            onBackPressed ?? () => Navigator.of(context).pop(),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: isDarkMode ? Colors.white : Colors.black87,
                          size: 20,
                        ),
                      )
                    : null,
              ),

              // MTXO Labs Logo and Brand - Centered
              Expanded(
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Logo Container
                      Container(
                        width: 40,
                        height: 40,
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
                      const SizedBox(width: 12),

                      // Brand Text
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'MTXO ',
                                  style: TextStyle(
                                    color: const Color(0xFF06B6D4),
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
                          // if (title.isNotEmpty)
                          //   Text(
                          //     title,
                          //     style: TextStyle(
                          //       color: isDarkMode
                          //           ? Colors.white70
                          //           : Colors.black54,
                          //       fontSize: 14,
                          //     ),
                          //   ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Theme Toggle Button - takes fixed space
              SizedBox(
                width: onThemeToggle != null ? 60 : 0,
                child: onThemeToggle != null
                    ? GestureDetector(
                        onTap: onThemeToggle,
                        child: Container(
                          width: 60,
                          height: 32,
                          decoration: BoxDecoration(
                            color: isDarkMode
                                ? const Color(0xFF4C1D95)
                                : const Color(0xFFE5E7EB),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: isDarkMode
                                  ? const Color(0xFF6D28D9)
                                  : const Color(0xFFD1D5DB),
                              width: 1,
                            ),
                          ),
                          child: Stack(
                            children: [
                              AnimatedPositioned(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeInOut,
                                left: isDarkMode ? 30 : 2,
                                top: 2,
                                child: Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    color: isDarkMode
                                        ? const Color(0xFF8B5CF6)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(14),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 2,
                                        offset: const Offset(0, 1),
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    isDarkMode
                                        ? Icons.nightlight_round
                                        : Icons.wb_sunny,
                                    size: 16,
                                    color: isDarkMode
                                        ? Colors.white
                                        : const Color(0xFFF59E0B),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
