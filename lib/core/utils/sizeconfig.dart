import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;
  static late bool isPortrait;
  static late bool isMobilePortrait;

  static double _scaleFactor = 1.0;

  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;
  static late double safeBlockHorizontal;
  static late double safeBlockVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;

    isPortrait = _mediaQueryData.orientation == Orientation.portrait;
    isMobilePortrait = isPortrait && screenWidth < 450;

    // Calculate scale factor based on screen height
    _scaleFactor = _calculateScaleFactor();
  }

  static double _calculateScaleFactor() {
    // Base height of 800 is chosen as a reference
    double factor = screenHeight / 800;

    // Adjust scale factor based on device size
    if (screenHeight < 600) {
      // Smaller devices need less aggressive scaling
      factor = factor * 0.95;
    } else if (screenHeight > 1000) {
      // Larger devices need less aggressive scaling
      factor = factor * 0.9;
    }

    // Clamp the scale factor to prevent extreme scaling
    return factor.clamp(0.8, 1.2);
  }

  // Get exact font size with minimal scaling
  static double getFontSize(double size) {
    return size * _scaleFactor;
  }

  // Get size that scales more with screen size (for layouts)
  static double getScaledSize(double size) {
    return size * blockSizeVertical / 8;
  }

  // Get proportionate height
  static double height(double height) {
    return blockSizeVertical * height;
  }

  // Get proportionate width
  static double width(double width) {
    return blockSizeHorizontal * width;
  }

  // Get safe area height (considering notches and system UI)
  static double safeHeight(double height) {
    return safeBlockVertical * height;
  }

  // Get safe area width (considering notches and system UI)
  static double safeWidth(double width) {
    return safeBlockHorizontal * width;
  }

  // Get padding that scales with screen size
  static EdgeInsets getPadding(double all) {
    return EdgeInsets.all(getScaledSize(all));
  }

  // Get padding that scales with screen size (different values)
  static EdgeInsets getPaddingLTRB(
      double left, double top, double right, double bottom) {
    return EdgeInsets.fromLTRB(
      getScaledSize(left),
      getScaledSize(top),
      getScaledSize(right),
      getScaledSize(bottom),
    );
  }

  // Get symmetric padding that scales with screen size
  static EdgeInsets getPaddingSymmetric(
      {double horizontal = 0, double vertical = 0}) {
    return EdgeInsets.symmetric(
      horizontal: getScaledSize(horizontal),
      vertical: getScaledSize(vertical),
    );
  }

  // Get specific edge padding that scales with screen size
  static EdgeInsets getPaddingOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return EdgeInsets.only(
      left: getScaledSize(left),
      top: getScaledSize(top),
      right: getScaledSize(right),
      bottom: getScaledSize(bottom),
    );
  }

  // static double getHeaderExpandedHeight(
  //     BuildContext context, bool showClockOut) {
  //   final screenHeight = MediaQuery.of(context).size.height;
  //   final screenWidth = MediaQuery.of(context).size.width;
  //   final aspectRatio = screenWidth / screenHeight;
  //   final statusBarHeight = MediaQuery.of(context).padding.top;

  //   // Base heights for different device sizes
  //   double baseHeight;
  //   if (screenHeight < 600) {
  //     print('small device');
  //     baseHeight = 0.29; // Small devices
  //   } else if (screenHeight < 800) {
  //     print('medium device');
  //     baseHeight = 0.28; // Medium devices
  //   } else if (screenHeight < 900) {
  //     baseHeight = 0.30; // Large devices
  //   } else {
  //     baseHeight = 0.25; // Extra large devices
  //   }

  //   // Reduce height when clock out section is not visible

  //   if (!showClockOut) {
  //     baseHeight -= 0.07; // Decrease height by 8% when hiding clock out section
  //   }

  //   return screenHeight * baseHeight + statusBarHeight;
  // }

  //this file is tested on all devices so after edit please test it again
  // static double getHeaderExpandedHeight(
  //     BuildContext context, bool showClockOut) {
  //   final screenHeight = MediaQuery.of(context).size.height;
  //   final screenWidth = MediaQuery.of(context).size.width;
  //   final statusBarHeight = MediaQuery.of(context).padding.top;
  //   final isTablet = screenWidth > 600;

  //   // Base heights for different device sizes
  //   double baseHeight;
  //   if (isTablet) {
  //     print('tablet/iPad device height: $screenHeight, width: $screenWidth');
  //     baseHeight = 0.200; // Tablet/iPad specific height
  //   } else {
  //     if (screenHeight < 600) {
  //       print('small device height: $screenHeight');
  //       baseHeight = 0.32; // For very small devices
  //     } else if (screenHeight <= 667) {
  //       print('iPhone SE height: $screenHeight');
  //       baseHeight = 0.23; // Specific for iPhone SE
  //     } else if (screenHeight < 800) {
  //       print('medium device height: $screenHeight');
  //       baseHeight = 0.22; // For medium devices
  //     } else if (screenHeight < 900) {
  //       print('large device height: $screenHeight');
  //       baseHeight = 0.18; // For large devices
  //     } else {
  //       print('extra large device height: $screenHeight');
  //       baseHeight = 0.175; // For extra large devices
  //     }

  //     // Add additional height when clock out section is visible
  //     if (showClockOut) {
  //       baseHeight += 0.06;
  //     }
  //   }

  //   return screenHeight * baseHeight + statusBarHeight;
  // }

  // static EdgeInsets getHeaderPadding(BuildContext context, bool showClockOut) {
  //   final screenHeight = MediaQuery.of(context).size.height;
  //   final statusBarHeight = MediaQuery.of(context).padding.top;

  //   final topPadding = statusBarHeight + (screenHeight < 700 ? 10 : 20);
  //   final bottomPadding = showClockOut ? 20.0 : 12.0;

  //   return EdgeInsets.fromLTRB(20, topPadding, 20, bottomPadding);
  // }

  static double getHeaderExpandedHeight(
      BuildContext context, bool showClockOut) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    // ConsoleAppLogger().d(
    //     "Screen Size - Height: ${screenHeight.toStringAsFixed(2)}, Width: ${screenWidth.toStringAsFixed(2)}");

    // Define standard breakpoints for device categories
    const double phoneSmall = 667.0; // iPhone SE, smaller phones
    const double phoneMedium = 845.0; // iPhone 12/13/14
    const double phoneLarge = 896.0; // iPhone Pro Max, larger phones
    const double tabletBreakpoint = 600.0;
    const double iphoneProHeight = 852.0;

    // Base heights as proportion of screen height
    double baseHeight;

    // First check if it's a tablet
    if (screenWidth > tabletBreakpoint) {
      baseHeight = 0.18;
      // ConsoleAppLogger().d("Device Type: Tablet - baseHeight: 0.18");
    } else {
      // For phones
      if (screenHeight <= phoneSmall) {
        baseHeight = 0.25;
        // ConsoleAppLogger().d(
        //     "Device Type: Small Phone - baseHeight: 0.25 (height <= ${PHONE_SMALL})");
      } else if (screenHeight <= phoneMedium) {
        baseHeight = 0.22;
        // ConsoleAppLogger().d(
        //     "Device Type: Medium Phone - baseHeight: 0.22 (height <= ${PHONE_MEDIUM})");
      } else if (screenHeight <= phoneLarge) {
        if (screenHeight <= iphoneProHeight) {
          // Adjust baseHeight for screens around 825-852 height to prevent overflow
          if (screenHeight < 830) {
            baseHeight = 0.23; // Slightly reduced for shorter heights
            // ConsoleAppLogger().d(
            //     "Device Type: iPhone Pro (Adjusted) - baseHeight: 0.175 (height < 830)");
          } else {
            baseHeight = 0.185;
            // ConsoleAppLogger().d(
            //     "Device Type: iPhone Pro - baseHeight: 0.185 (height <= ${IPHONE_PRO_HEIGHT})");
          }
        } else {
          baseHeight = 0.19;
          // ConsoleAppLogger().d(
          //     "Device Type: Larger Phone - baseHeight: 0.19 (height <= ${PHONE_LARGE})");
        }
      } else {
        baseHeight = 0.19;
        // ConsoleAppLogger().d(
        //     "Device Type: Extra Large Phone - baseHeight: 0.19 (height > ${PHONE_LARGE})");
      }
    }

    // Apply clock out adjustment
    if (showClockOut) {
      // Add a consistent proportion for the clock out section
      baseHeight += screenHeight <= phoneSmall ? 0.05 : 0.05;
    }

    // Calculate minimum and maximum absolute heights
    const double minHeight = 140.0;
    const double maxHeight = 300.0;

    // Calculate the raw height
    double rawHeight = (screenHeight * baseHeight) + statusBarHeight;

    // Clamp the final height between min and max values
    return rawHeight.clamp(minHeight, maxHeight);
  }

  // Complementary method for consistent header padding
  static EdgeInsets getHeaderPadding(BuildContext context, bool showClockOut) {
    final screenHeight = MediaQuery.of(context).size.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final screenWidth = MediaQuery.of(context).size.width;

    // Define standard padding values
    double horizontalPadding = screenWidth > 600 ? 24.0 : 20.0;
    double topPadding = statusBarHeight + (screenHeight < 700 ? 12.0 : 16.0);
    double bottomPadding = showClockOut ? 16.0 : 12.0;

    return EdgeInsets.fromLTRB(
        horizontalPadding, topPadding, horizontalPadding, bottomPadding);
  }

  // Helper method to get content scaling factor
  static double getHeaderContentScale(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    if (screenHeight < 700) {
      return 0.9; // Smaller scale for small devices
    } else if (screenHeight > 896) {
      return 1.1; // Slightly larger scale for very large devices
    }
    return 1.0; // Standard scale for medium devices
  }

  // static double getProfileCardSpacing(BuildContext context) {
  //   final screenHeight = MediaQuery.of(context).size.height;
  //   return screenHeight < 700 ? 8.0 : 16.0;
  // }
  static double getProfileCardSpacing(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Define breakpoints
    const double phoneSmall = 667.0; // iPhone SE, smaller phones
    const double phoneMedium = 812.0; // iPhone 12/13/14
    const double phoneLarge = 896.0; // iPhone Pro Max, larger phones
    const double tabletBreakpoint = 600.0;

    // Check if device is a tablet first
    if (screenWidth > tabletBreakpoint) {
      return 24.0; // Larger spacing for tablets
    }

    // For phones, use height-based spacing
    if (screenHeight <= phoneSmall) {
      return 8.0; // Minimum spacing for small devices
    } else if (screenHeight <= phoneMedium) {
      return 12.0; // Medium spacing
    } else if (screenHeight <= phoneLarge) {
      return 16.0; // Standard spacing
    } else {
      return 20.0; // Larger spacing for very tall phones
    }
  }

  static fromLTRB(int i, int j, int k, int l) {}
}
