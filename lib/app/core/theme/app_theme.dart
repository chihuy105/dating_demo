import 'package:dating_demo/all_file/all_file.dart';

class AppTheme {
  static ThemeData getTheme({bool isDark = false}) {
    var colorScheme = AppColor.colorSchemaFrom(isDark: isDark);
    // For surfaces that use primary color in light themes and surface color in dark
    final Color primarySurfaceColor = isDark ? colorScheme.surface : colorScheme.primary;
    final Color onPrimarySurfaceColor = isDark ? colorScheme.onSurface : colorScheme.onPrimary;

    return ThemeData(
      colorScheme: colorScheme,
      brightness: colorScheme.brightness,
      primaryColor: primarySurfaceColor,
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      bottomAppBarColor: colorScheme.surface,
      cardColor: colorScheme.surface,
      dividerColor: colorScheme.onSurface.withOpacity(0.12),
      backgroundColor: colorScheme.background,
      dialogBackgroundColor: colorScheme.background,
      indicatorColor: onPrimarySurfaceColor,
      errorColor: colorScheme.error,
      textTheme: AppTextTheme.getTextTheme(isDarkMode: isDark),
      applyElevationOverlayColor: isDark,
    );

    // return ThemeData(
    //     brightness: isDarkMode ? Brightness.dark : Brightness.light,
    //
    //     primaryColor: dynamicAppMainColor,
    //     bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
    //
    //     // Icon color
    //     iconTheme: isDarkMode
    //         ? const IconThemeData(color: AppColor.dark_icon)
    //         : const IconThemeData(color: AppColor.icon),
    //     primaryIconTheme: isDarkMode
    //         ? const IconThemeData(color: AppColor.dark_app_main)
    //         : const IconThemeData(color: AppColor.app_main),
    //
    //     errorColor: isDarkMode ? AppColor.dark_red : AppColor.red,
    //     primarySwatch: isDarkMode
    //         ? AppColor.dark_app_main_swatch
    //         : AppColor.app_main_swatch,
    //
    //     // Tab indicator color
    //     indicatorColor: dynamicAppMainColor,
    //
    //     // page background color
    //     scaffoldBackgroundColor: isDarkMode
    //         ? AppColor.dark_scaffold_bg_color
    //         : AppColor.scaffold_bg_color,
    //
    //     // Mainly used for Material background color
    //     canvasColor:
    //         isDarkMode ? AppColor.dark_material_bg : AppColor.material_bg,
    //
    //     // Card, BottomBar, AppBar use Surface
    //     cardTheme: CardTheme(
    //       shadowColor: isDarkMode ? AppColor.dark_shadow : AppColor.shadow,
    //       color: isDarkMode ? AppColor.dark_surface : AppColor.surface,
    //     ),
    //     appBarTheme: AppBarTheme(
    //       elevation: 0.0,
    //       color: isDarkMode ? AppColor.dark_surface : AppColor.surface,
    //       systemOverlayStyle: isDarkMode ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
    //     ),
    //     bottomAppBarColor:
    //         isDarkMode ? AppColor.dark_surface : AppColor.surface,
    //     unselectedWidgetColor: isDarkMode
    //         ? AppColor.dark_unselected_item_color
    //         : AppColor.unselected_item_color,
    //     hintColor: isDarkMode
    //         ? AppColor.dark_hint_color
    //         : AppColor.hint_color,
    //
    //     // Text selection color (copy and paste menu of input box)
    //     // fontFamily: 'SFUIText',
    //     textTheme: AppTextTheme.getTextTheme(isDarkMode: isDarkMode),
    //     primaryTextTheme: AppTextTheme.getTextTheme(isDarkMode: isDarkMode),
    //     textSelectionTheme: TextSelectionThemeData(
    //         selectionColor: dynamicAppMainColor.withAlpha(70),
    //         selectionHandleColor: dynamicAppMainColor),
    //     inputDecorationTheme: InputDecorationTheme(
    //       hintStyle:
    //           isDarkMode ? AppTextTheme.text_hint : AppTextTheme.dark_text_hint,
    //     ),
    //     dividerColor: AppColor.line,
    //     dividerTheme: DividerThemeData(
    //         color: isDarkMode ? AppColor.dark_line : AppColor.line,
    //         space: 2,
    //         thickness: 1
    //     ),
    //     cupertinoOverrideTheme: CupertinoThemeData(
    //       brightness: isDarkMode ? Brightness.dark : Brightness.light,
    //     ));
  }
}

