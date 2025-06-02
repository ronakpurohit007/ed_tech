import 'package:ed_tech/config/app_typography.dart';
import 'package:flutter/material.dart';

class CustomSnackbar extends StatelessWidget {
  final String message;
  final IconData? icon;
  final Duration duration;
  final VoidCallback? onDismissed;

  const CustomSnackbar({
    super.key,
    required this.message,
    this.icon,
    this.duration = const Duration(seconds: 4),
    this.onDismissed,
  });

  static void show(BuildContext context,
      {required String message,
      IconData? icon,
      Duration? duration,
      VoidCallback? onDismissed}) {
    print("objectnew 11111111");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: CustomSnackbar(
          message: message,
          icon: icon,
          duration: duration ?? const Duration(seconds: 4),
          onDismissed: onDismissed,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        duration: duration ?? const Duration(seconds: 4),
        behavior: SnackBarBehavior.floating,
        // margin: const EdgeInsets.all(16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.white),
        color: const Color(0xFF3F67F4),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF3F67F4).withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
            const SizedBox(width: 12),
          ],
          Expanded(
            child: Text(message,
                style: AppTypography.toggleButtonText(context)
                    .copyWith(color: Colors.white)),
          ),
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              if (onDismissed != null) onDismissed!();
            },
            child: const Icon(
              Icons.close,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
