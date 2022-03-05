
import 'package:dating_demo/all_file/all_file.dart';

class ScreenUtils {

  static double getPercentWidth({required double percent, double? maxValue}) {
    double rWidth;
    double preWidth = Get.width;
    double preHeight = Get.height;
    if (preWidth > preHeight) {
      rWidth = preHeight * percent;
    } else
      rWidth = preWidth * percent;

    if (maxValue != null) {
      return (rWidth >= maxValue) ? maxValue : rWidth;
    } else
      return rWidth;
  }

  static double getPercentHeight({required double percent, double? maxValue}) {
    double rHeight;
    double preWidth = Get.width;
    double preHeight = Get.height;
    if (preWidth > preHeight) {
      rHeight = preWidth * percent;
    } else
      rHeight = preHeight * percent;

    if (maxValue != null) {
      return (rHeight >= maxValue) ? maxValue : rHeight;
    } else {
      return rHeight;
    }
  }

  static double getWidthResponsive(double percentScreenWidth) {
    if (Get.context != null) {
      final _breakpoint = Breakpoint.fromMediaQuery(Get.context!);
      switch (_breakpoint.window) {
        case WindowSize.xsmall:
          break;
        case WindowSize.small:
        case WindowSize.medium:
        case WindowSize.large:
        case WindowSize.xlarge:
          return getPercentWidth(percent: percentScreenWidth) / 2;
      }
    }
    return getPercentWidth(percent: percentScreenWidth);
  }

  static double getOffsetResponsive(double offsetDefault) {
    if (Get.context != null) {
      final _breakpoint = Breakpoint.fromMediaQuery(Get.context!);
      switch (_breakpoint.window) {
        case WindowSize.xsmall:
          break;
        case WindowSize.small:
        case WindowSize.medium:
        case WindowSize.large:
        case WindowSize.xlarge:
          return offsetDefault * 1.5;
      }
    }
    return offsetDefault;
  }

  static double getStatusBarHeight() => Get.mediaQuery.padding.top;
}