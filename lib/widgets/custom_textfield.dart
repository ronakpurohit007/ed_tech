import 'package:ed_tech/config/app_colors.dart';
import 'package:ed_tech/config/app_typography.dart';
import 'package:ed_tech/config/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry padding;
  final bool autofocus;
  final int? maxLines;
  final double borderRadius;

  /// New parameter to enable theme adaptation.
  /// If `false`, the text field always displays in light mode.
  final bool isThemeAdaptive;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    this.padding = const EdgeInsets.symmetric(vertical: 5.0),
    this.autofocus = false,
    this.maxLines = 1,
    this.borderRadius = 16.0,
    this.isThemeAdaptive = true,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        // If isThemeAdaptive is false, always use light mode colors.
        final bool effectiveIsDarkMode =
            isThemeAdaptive ? themeProvider.isDarkMode : false;

        return Padding(
          padding: padding,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: TextFormField(
              controller: controller,
              obscureText: isPassword,
              keyboardType: keyboardType,
              focusNode: focusNode,
              autofocus: autofocus,
              onChanged: onChanged,
              validator: validator,
              maxLines: maxLines,
              style: AppTypography.inputtextfilled(context).copyWith(
                fontWeight: FontWeight.w400,
                color: effectiveIsDarkMode
                    ? AppColors.buttonsecondry
                    : AppColors.textPrimary,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: AppTypography.inputPlaceholder16(context).copyWith(
                  color: effectiveIsDarkMode
                      ? AppColors.textTertiary
                      : AppColors.textSecondary.withOpacity(0.4),
                ),
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                filled: true,
                fillColor: effectiveIsDarkMode
                    ? AppColors.textPrimary
                    : AppColors.textField,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: BorderSide(
                    color: effectiveIsDarkMode
                        ? AppColors.textSecondary
                        : AppColors.buttonSecondry,
                    width: 0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: BorderSide(
                    color: effectiveIsDarkMode
                        ? AppColors.textSecondary
                        : AppColors.buttonSecondry,
                    width: 1,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: const BorderSide(color: Colors.red, width: 1),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: const BorderSide(color: Colors.red, width: 1),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class PasswordTextField extends StatefulWidget {
  final String hintText;
  final Widget? prefixIcon;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry padding;
  final bool autofocus;
  final double borderRadius;
  final bool isThemeAdaptive;

  const PasswordTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.onChanged,
    this.validator,
    this.focusNode,
    this.padding = const EdgeInsets.symmetric(vertical: 5.0),
    this.autofocus = false,
    this.borderRadius = 16.0,
    this.isThemeAdaptive = true,
    this.prefixIcon,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        final bool effectiveIsDarkMode =
            widget.isThemeAdaptive ? themeProvider.isDarkMode : false;

        return CustomTextField(
          hintText: widget.hintText,
          prefixIcon: widget.prefixIcon,
          controller: widget.controller,
          isPassword: _obscureText,
          focusNode: widget.focusNode,
          onChanged: widget.onChanged,
          validator: widget.validator,
          padding: widget.padding,
          autofocus: widget.autofocus,
          borderRadius: widget.borderRadius,
          isThemeAdaptive: widget.isThemeAdaptive,
          keyboardType: TextInputType.visiblePassword,
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: effectiveIsDarkMode
                  ? AppColors.textTertiary
                  : Colors.grey.shade700,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        );
      },
    );
  }
}
