import 'package:ed_tech/config/app_colors.dart';
import 'package:ed_tech/core/utils/sizeconfig.dart';
import 'package:flutter/material.dart';

class AppTypography {
  static const String anekLatin = 'AnekLatin';
  static const String montserrat = 'Montserrat';
  // Base text style that includes the font family
  static TextStyle _baseStyle(BuildContext context) {
    return const TextStyle(
      fontFamily: anekLatin,
      //color: AppColors.textPrimary,
    );
  }

  // Headings
  static TextStyle h1(BuildContext context) {
    return _baseStyle(context).copyWith(
      fontFamily: anekLatin,
      fontSize: SizeConfig.getFontSize(30),
      fontWeight: FontWeight.w600,
      height: 1.2,
    );
  }

  static TextStyle title(BuildContext context) {
    return _baseStyle(context).copyWith(
        fontFamily: anekLatin,
        fontSize: SizeConfig.getFontSize(24),
        fontWeight: FontWeight.w600,
        height: 1.3);
  }

  static TextStyle title2(BuildContext context) {
    return _baseStyle(context).copyWith(
        fontFamily: anekLatin,
        fontSize: SizeConfig.getFontSize(18),
        fontWeight: FontWeight.w500,
        height: 1.3);
  }

  static TextStyle h2(BuildContext context) {
    return _baseStyle(context).copyWith(
      fontFamily: anekLatin,
      fontSize: SizeConfig.getFontSize(30),
      fontWeight: FontWeight.w500,
      height: 1.3,
    );
  }

// Small Text: 14px, Regular, Line Height 20px - Citations, Tags
  static TextStyle smallText(BuildContext context) {
    return _baseStyle(context).copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 20 / 14, // lineHeight / fontSize
    );
  }

// Section Title: 20px, Medium, Line Height 28px - Cards, Modals
  static TextStyle sectionTitle(BuildContext context) {
    return _baseStyle(context).copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      height: 28 / 20, // lineHeight / fontSize
    );
  }

  static TextStyle welcome(BuildContext context) {
    return _baseStyle(context).copyWith(
      fontFamily: anekLatin,
      fontSize: SizeConfig.getFontSize(40),
      fontWeight: FontWeight.w600,
      height: 1.2,
    );
  }

  static TextStyle h3(BuildContext context) {
    return _baseStyle(context).copyWith(
      fontFamily: anekLatin,
      fontSize: SizeConfig.getFontSize(24),
      fontWeight: FontWeight.w400,
      height: 1.3,
    );
  }

  static TextStyle newtitle(BuildContext context) {
    return _baseStyle(context).copyWith(
      fontFamily: anekLatin,
      fontSize: SizeConfig.getFontSize(24),
      fontWeight: FontWeight.w500,
      height: 1.3,
    );
  }

  static TextStyle sideBar(BuildContext context) {
    return _baseStyle(context).copyWith(
      fontFamily: anekLatin,
      fontSize: SizeConfig.getFontSize(20),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle heading(BuildContext context) {
    return _baseStyle(context).copyWith(
      fontFamily: anekLatin,
      fontSize: SizeConfig.getFontSize(16),
      fontWeight: FontWeight.w600,
    );
  }

  // Input text styles (Montserrat)
  static TextStyle inputText(BuildContext context) {
    return TextStyle(
      fontFamily: montserrat,
      fontSize: SizeConfig.getFontSize(16),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle termsofservice(BuildContext context) {
    return TextStyle(
      fontFamily: montserrat,
      fontSize: SizeConfig.getFontSize(14),
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.underline,
    );
  }

  static TextStyle toggleButtonText(BuildContext context) {
    return TextStyle(
      fontFamily: montserrat,
      fontSize: SizeConfig.getFontSize(12),
      fontWeight: FontWeight.w400,
      height: 1.4,
    );
  }

  // Anek Latin styles
  static TextStyle inputPlaceholder(BuildContext context) {
    return TextStyle(
      fontFamily: anekLatin,
      fontSize: SizeConfig.getFontSize(30),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle inputPlaceholderTest(BuildContext context) {
    return TextStyle(
      fontFamily: anekLatin,
      fontSize: SizeConfig.getFontSize(18),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle inputTextSmall(BuildContext context) {
    return TextStyle(
      fontFamily: anekLatin,
      fontSize: SizeConfig.getFontSize(30),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle caption(BuildContext context) {
    return TextStyle(
      fontFamily: anekLatin,
      fontSize: SizeConfig.getFontSize(16),
      fontWeight: FontWeight.w400,
    );
  }

  // Montserrat style
  static TextStyle suggestion(BuildContext context) {
    return TextStyle(
      fontFamily: montserrat,
      fontSize: SizeConfig.getFontSize(14),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle pathtext14(BuildContext context) {
    return TextStyle(
        fontFamily: anekLatin,
        fontSize: SizeConfig.getFontSize(14),
        fontWeight: FontWeight.w400,
        color: AppColors.textTertiary);
  }

  static TextStyle inputPlaceholderSmall(BuildContext context) {
    return _baseStyle(context).copyWith(
      fontSize: SizeConfig.getFontSize(12),
      fontWeight: FontWeight.w400,
      height: 1.4,
    );
  }

  static TextStyle inputtextfilled(BuildContext context) {
    return _baseStyle(context).copyWith(
      fontFamily: montserrat,
      fontSize: SizeConfig.getFontSize(16),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle bodytext(BuildContext context) {
    return _baseStyle(context).copyWith(
      fontFamily: montserrat,
      fontSize: SizeConfig.getFontSize(16),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle inputPlaceholder16(BuildContext context) {
    return _baseStyle(context).copyWith(
      fontFamily: montserrat,
      fontSize: SizeConfig.getFontSize(16),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle desc16regular(BuildContext context) {
    return _baseStyle(context).copyWith(
      fontFamily: anekLatin,
      fontSize: SizeConfig.getFontSize(16),
      fontWeight: FontWeight.w400,
    );
  }

//settings title
  static TextStyle settingstitle(BuildContext context) {
    return _baseStyle(context).copyWith(
        fontFamily: anekLatin,
        fontSize: SizeConfig.getFontSize(18),
        fontWeight: FontWeight.w500,
        color: AppColors.textprimery);
  }

//settings subtitle
  static TextStyle settingssubtitle(BuildContext context) {
    return _baseStyle(context).copyWith(
        fontFamily: anekLatin,
        fontSize: SizeConfig.getFontSize(14),
        fontWeight: FontWeight.w400,
        color: AppColors.textTertiary);
  }

  // static TextStyle h4(BuildContext context) {
  //   return _baseStyle(context).copyWith(
  //     fontSize: SizeConfig.getFontSize(16),
  //     fontWeight: FontWeight.w400,
  //     height: 1.3,
  //   );
  // }

  static TextStyle h5(BuildContext context) {
    return TextStyle(
      fontFamily: anekLatin,
      fontSize: SizeConfig.getFontSize(14),
      fontWeight: FontWeight.w400,
    );
  }

  // // Big text
  // static TextStyle bigText(BuildContext context) {
  //   return _baseStyle(context).copyWith(
  //     fontSize: SizeConfig.getFontSize(18),
  //     fontWeight: FontWeight.w300,
  //     height: 1.5,
  //   );
  // }

  // // Large, Medium, Small text
  // static TextStyle largeText(BuildContext context) {
  //   return _baseStyle(context).copyWith(
  //     fontSize: SizeConfig.getFontSize(16),
  //     fontWeight: FontWeight.w300,
  //     height: 1.5,
  //   );
  // }

  // static TextStyle mediumText(BuildContext context) {
  //   return _baseStyle(context).copyWith(
  //     fontSize: SizeConfig.getFontSize(14),
  //     fontWeight: FontWeight.w300,
  //     height: 1.5,
  //   );
  // }

  // static TextStyle smallText(BuildContext context) {
  //   return _baseStyle(context).copyWith(
  //     fontSize: SizeConfig.getFontSize(12),
  //     fontWeight: FontWeight.w300,
  //     height: 1.5,
  //   );
  // }

  // // Menu
  // static TextStyle menuText(BuildContext context) {
  //   return _baseStyle(context).copyWith(
  //     fontSize: SizeConfig.getFontSize(9),
  //     fontWeight: FontWeight.w400,
  //     height: 1.2,
  //   );
  // }

  // // Inputs / Buttons
  // static TextStyle buttonText(BuildContext context) {
  //   return _baseStyle(context).copyWith(
  //     fontSize: SizeConfig.getFontSize(14),
  //     fontWeight: FontWeight.w500,
  //     height: 1.4,
  //   );
  // }

  // static TextStyle inputPlaceholder(BuildContext context) {
  //   return _baseStyle(context).copyWith(
  //     fontSize: SizeConfig.getFontSize(14),
  //     fontWeight: FontWeight.w400,
  //     height: 1.4,
  //   );
  // }

  // static TextStyle inputPlaceholderSmall(BuildContext context) {
  //   return _baseStyle(context).copyWith(
  //     fontSize: SizeConfig.getFontSize(12),
  //     fontWeight: FontWeight.w400,
  //     height: 1.4,
  //   );
  // }

  // static TextStyle captionText(BuildContext context) {
  //   return _baseStyle(context).copyWith(
  //     fontSize: SizeConfig.getFontSize(12),
  //     fontWeight: FontWeight.w400,
  //     height: 1.4,
  //   );
  // }

  // // Underlined text
  // static TextStyle underlinedTextMedium(BuildContext context) {
  //   return _baseStyle(context).copyWith(
  //     fontSize: SizeConfig.getFontSize(14),
  //     fontWeight: FontWeight.w500,
  //     height: 1.4,
  //     decoration: TextDecoration.underline,
  //   );
  // }

  // static TextStyle underlinedTextSmall(BuildContext context) {
  //   return _baseStyle(context).copyWith(
  //     fontSize: SizeConfig.getFontSize(12),
  //     fontWeight: FontWeight.w500,
  //     height: 1.4,
  //     decoration: TextDecoration.underline,
  //   );
  // }

  static TextTheme getTheme(BuildContext context) {
    return TextTheme(
      displayLarge: h1(context),
      displayMedium: h2(context),
      bodyLarge: inputText(context),
      bodyMedium: caption(context),
      bodySmall: suggestion(context),
    );
  }
}
