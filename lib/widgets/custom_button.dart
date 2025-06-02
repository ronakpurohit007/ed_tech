import 'dart:ui';

import 'package:ed_tech/core/utils/sizeconfig.dart';
import 'package:ed_tech/widgets/CustomLoader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Import your ButtonLoaderManager
// import 'package:ed_tech/widgets/button_loader_manager.dart';

class CustomButton extends StatelessWidget {
  static const String montserrat = 'Montserrat';
  final String buttonId;
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color loaderColor;
  final double? width;
  final double? height;
  final double? borderRadius;
  final double fontSize;
  final FontWeight fontWeight;
  final EdgeInsetsGeometry padding;
  final bool fullWidth;
  final IconData? icon;
  final String? assetIcon;
  final double elevation;
  final Color borderColor;
  final double borderWidth;
  final Color? assetIconColor;
  final bool useLoaderManager; // New parameter to enable/disable loader manager
  final bool isLoading; // Fallback for manual loading state
  final String? loadingText; // Optional loading text

  const CustomButton({
    Key? key,
    required this.buttonId,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.pink,
    this.textColor = Colors.white,
    this.loaderColor = Colors.white,
    this.width,
    this.height,
    this.borderRadius,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
    this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
    this.fullWidth = false,
    this.icon,
    this.assetIcon,
    this.elevation = 2.0,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0.0,
    this.assetIconColor,
    this.useLoaderManager = true, // Default to using loader manager
    this.isLoading = false,
    this.loadingText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    // Set default height & borderRadius dynamically based on screen size
    final double dynamicHeight = height ?? screenSize.height * 0.07;
    final double dynamicBorderRadius = borderRadius ?? screenSize.width * 0.05;

    // Use Consumer if useLoaderManager is true, otherwise use manual loading state
    if (useLoaderManager) {
      return Consumer<ButtonLoaderManager>(
        builder: (context, loaderManager, child) {
          final isButtonLoading = loaderManager.isLoading(buttonId);

          return _buildButton(
            context,
            dynamicHeight,
            dynamicBorderRadius,
            isButtonLoading,
          );
        },
      );
    } else {
      return _buildButton(
        context,
        dynamicHeight,
        dynamicBorderRadius,
        isLoading,
      );
    }
  }

  Widget _buildButton(
    BuildContext context,
    double dynamicHeight,
    double dynamicBorderRadius,
    bool isButtonLoading,
  ) {
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      width: fullWidth ? double.infinity : width ?? screenSize.width * 0.5,
      height: dynamicHeight,
      child: ElevatedButton(
        onPressed: isButtonLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(dynamicBorderRadius),
            side: BorderSide(
              color: borderColor,
              width: borderWidth,
            ),
          ),
          elevation: elevation,
          disabledBackgroundColor: backgroundColor.withOpacity(0.7),
          disabledForegroundColor: textColor.withOpacity(0.7),
        ),
        child: isButtonLoading ? _buildLoadingContent() : _buildButtonContent(),
      ),
    );
  }

  Widget _buildLoadingContent() {
    if (loadingText != null && loadingText!.isNotEmpty) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: SizeConfig.width(4),
            height: SizeConfig.height(2),
            child: CircularProgressIndicator(
              color: loaderColor,
              strokeWidth: 2,
            ),
          ),
          SizedBox(width: 8),
          Text(
            loadingText!,
            style: TextStyle(
              fontSize: SizeConfig.getFontSize(fontSize),
              fontWeight: fontWeight,
              color: textColor,
            ),
          ),
        ],
      );
    } else {
      return SizedBox(
        width: SizeConfig.width(4),
        height: SizeConfig.height(2),
        child: CircularProgressIndicator(
          color: loaderColor,
          strokeWidth: 3,
        ),
      );
    }
  }

  Widget _buildButtonContent() {
    if (icon != null || assetIcon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) Icon(icon, size: 20, color: textColor),
          if (assetIcon != null)
            Image.asset(
              assetIcon!,
              height: 20,
              width: 20,
              fit: BoxFit.contain,
              color: assetIconColor,
            ),
          SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: SizeConfig.getFontSize(fontSize),
              fontWeight: fontWeight,
              color: textColor,
            ),
          ),
        ],
      );
    } else {
      return FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: montserrat,
            fontWeight: fontWeight,
            color: textColor,
          ),
        ),
      );
    }
  }
}
