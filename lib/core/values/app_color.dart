import 'package:dating_demo/all_file/all_file.dart';

///
/// Color generator: https://material-foundation.github.io/material-theme-builder/#/custom
///
class AppColor {
  AppColor._();

  static ColorScheme get schema => Get.isDarkMode ? _colorSchemeDark : _colorScheme;

  static ColorScheme colorSchemaFrom({required bool isDark}){
    return isDark ? _colorSchemeDark : _colorScheme;
  }

  //// *** Primary *** ////

  static const AppColorData primary = AppColorData(
      light: Color(0xFF006783),
      dark: Color(0xff54d5ff)
  );

  static const AppColorData onPrimary = AppColorData(
      light: Color(0xFFffffff),
      dark: Color(0xff003545)
  );

  static const AppColorData primaryContainer = AppColorData(
      light: Color(0xFFb7eaff),
      dark: Color(0xff004d62)
  );

  static const AppColorData onPrimaryContainer = AppColorData(
      light: Color(0xFF001f2a),
      dark: Color(0xffb7eaff)
  );

  //// *** Secondary *** ////

  static const AppColorData secondary = AppColorData(
      light: Color(0xFF4c616b),
      dark: Color(0xffb3cad5)
  );

  static const AppColorData onSecondary = AppColorData(
      light: Color(0xFFffffff),
      dark: Color(0xff1e333c)
  );

  static const AppColorData secondaryContainer = AppColorData(
      light: Color(0xFFcfe6f1),
      dark: Color(0xff354a53)
  );

  static const AppColorData onSecondaryContainer = AppColorData(
      light: Color(0xFF071e26),
      dark: Color(0xffcfe6f1)
  );

  //// *** Tertiary *** ////

  static const AppColorData tertiary = AppColorData(
      light: Color(0xFF5b5b7e),
      dark: Color(0xffc4c3ea)
  );

  static const AppColorData onTertiary = AppColorData(
      light: Color(0xFFffffff),
      dark: Color(0xff2d2d4d)
  );

  static const AppColorData tertiaryContainer = AppColorData(
      light: Color(0xFFe1dfff),
      dark: Color(0xff444465)
  );

  static const AppColorData onTertiaryContainer = AppColorData(
      light: Color(0xFF181837),
      dark: Color(0xffe1dfff)
  );

  //// *** Error *** ////

  static const AppColorData error = AppColorData(
      light: Color(0xFFba1b1b),
      dark: Color(0xffffb4a9)
  );

  static const AppColorData onError = AppColorData(
      light: Color(0xFFffffff),
      dark: Color(0xff680003)
  );

  static const AppColorData errorContainer = AppColorData(
      light: Color(0xFFffdad4),
      dark: Color(0xff930006)
  );

  static const AppColorData onErrorContainer = AppColorData(
      light: Color(0xFF410001),
      dark: Color(0xffffdad4)
  );

  //// *** Background *** ////

  static const AppColorData background = AppColorData(
      light: Color(0xFFfbfcfe),
      dark: Color(0xff191c1e)
  );

  static const AppColorData onBackground = AppColorData(
      light: Color(0xFF191c1e),
      dark: Color(0xffe1e3e5)
  );

  static const AppColorData surface = AppColorData(
      light: Color(0xFFfbfcfe),
      dark: Color(0xff191c1e)
  );

  static const AppColorData onSurface = AppColorData(
      light: Color(0xFF191c1e),
      dark: Color(0xffe1e3e5)
  );

  static const AppColorData outline = AppColorData(
      light: Color(0xFF70787d),
      dark: Color(0xff8a9296)
  );

  static const AppColorData surfaceVariant = AppColorData(
      light: Color(0xFFdce4e8),
      dark: Color(0xff40484c)
  );

  static const AppColorData onSurfaceVariant = AppColorData(
      light: Color(0xFF40484c),
      dark: Color(0xffc0c8cc)
  );

  //// *** TEXT Color *** ////

  static const AppColorData text = AppColorData(
      light: Color(0xFF171717),
      dark: Color(0xFFFAFBFC));

  static const AppColorData textGray = AppColorData(light: Color(0xff727272), dark: Color(0xFF666666));

  static const AppColorData textHint = AppColorData(light: Color(0xE6989898), dark: Color(0xFF989898));

  static const AppColorData textHeading = AppColorData(light: Color(0xFF392a25), dark: Color(0xFF666666));

  static const AppColorData textDisable = AppColorData(light: Color(0xFFD4E2FA), dark: Color(0xFFCEDBF2));

  //// *** Current Project Color *** ////

  static const AppColorData successColor = AppColorData(light: Colors.green, dark: Colors.lightGreen);

  static const AppColorData warningColor = AppColorData(light: Colors.orange, dark: Color(0xFFF7C262));

  //// ******   Dynamic Colors   ****** ////


  static const Color loginGradientStart = Color(0xFFfbab66);
  static const Color loginGradientEnd = Color(0xFFf7418c);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: <Color>[loginGradientStart, loginGradientEnd],
    stops: <double>[0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static MaterialColor get materialWhite =>
      const MaterialColor(
        0xFFFFFFFF,
        <int, Color>{
          50: Color(0xFFFFFFFF),
          100: Color(0xFFFFFFFF),
          200: Color(0xFFFFFFFF),
          300: Color(0xFFFFFFFF),
          400: Color(0xFFFFFFFF),
          500: Color(0xFFFFFFFF),
          600: Color(0xFFFFFFFF),
          700: Color(0xFFFFFFFF),
          800: Color(0xFFFFFFFF),
          900: Color(0xFFFFFFFF),
        },
      );

  static getTransparentGrey() {
    return Colors.grey[600]!.withOpacity(0.3);
  }
}

class AppColorData {
  final Color light;
  final Color dark;

  const AppColorData({required this.light, required this.dark});

  Color get dynamic => Get.isDarkMode ? dark : light;
}

final ColorScheme _colorScheme = ColorScheme(brightness: Brightness.light,
  primary: AppColor.primary.light,
  onPrimary: AppColor.onPrimary.light,
  primaryContainer: AppColor.primaryContainer.light,
  onPrimaryContainer: AppColor.onPrimaryContainer.light,

  secondary: AppColor.secondary.light,
  onSecondary: AppColor.onSecondary.light,
  secondaryContainer: AppColor.secondaryContainer.light,
  onSecondaryContainer: AppColor.onSecondaryContainer.light,

  tertiary: AppColor.tertiary.light,
  onTertiary: AppColor.onTertiary.light,
  tertiaryContainer: AppColor.tertiaryContainer.light,
  onTertiaryContainer: AppColor.onTertiaryContainer.light,

  error: AppColor.error.light,
  onError: AppColor.onError.light,
  errorContainer: AppColor.errorContainer.light,
  onErrorContainer: AppColor.onErrorContainer.light,

  background: AppColor.background.light,
  onBackground: AppColor.onBackground.light,
  surface: AppColor.surface.light,
  onSurface: AppColor.onSurface.light,
  outline: AppColor.outline.light,
  surfaceVariant: AppColor.surfaceVariant.light,
  onSurfaceVariant: AppColor.onSurfaceVariant.light,
);


final ColorScheme _colorSchemeDark = ColorScheme(brightness: Brightness.dark,
  primary: AppColor.primary.dark,
  onPrimary: AppColor.onPrimary.dark,
  primaryContainer: AppColor.primaryContainer.dark,
  onPrimaryContainer: AppColor.onPrimaryContainer.dark,

  secondary: AppColor.secondary.dark,
  onSecondary: AppColor.onSecondary.dark,
  secondaryContainer: AppColor.secondaryContainer.dark,
  onSecondaryContainer: AppColor.onSecondaryContainer.dark,

  tertiary: AppColor.tertiary.dark,
  onTertiary: AppColor.onTertiary.dark,
  tertiaryContainer: AppColor.tertiaryContainer.dark,
  onTertiaryContainer: AppColor.onTertiaryContainer.dark,

  error: AppColor.error.dark,
  onError: AppColor.onError.dark,
  errorContainer: AppColor.errorContainer.dark,
  onErrorContainer: AppColor.onErrorContainer.dark,

  background: AppColor.background.dark,
  onBackground: AppColor.onBackground.dark,
  surface: AppColor.surface.dark,
  onSurface: AppColor.onSurface.dark,
  outline: AppColor.outline.dark,
  surfaceVariant: AppColor.surfaceVariant.dark,
  onSurfaceVariant: AppColor.onSurfaceVariant.dark,
);

