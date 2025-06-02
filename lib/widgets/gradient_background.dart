import 'package:ed_tech/config/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: themeProvider.isDarkMode
              ? const [
                  Color(0xFF1a365d), // Dark blue at top
                  Color(0xFF2d3748), // Dark gray-blue in middle
                  Color(0xFF1a202c), // Very dark gray at bottom
                ]
              : const [
                  Color(0xFFE6F3FF), // Light blue at top
                  Color(0xFFF0F8FF), // Very light blue in middle
                  Color(0xFFE6F3FF), // Light blue at bottom
                ],
        ),
      ),
      child: child,
    );
  }
}
