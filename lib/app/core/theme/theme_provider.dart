import 'package:flutter/services.dart';
import 'package:dating_demo/all_file/all_file.dart';
import 'package:flutter/cupertino.dart';

class ThemeProvider {
  static ThemeData getTheme({bool isDarkMode = false}) {
    return ThemeData(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,

        primaryColor: isDarkMode ? AppColor.dark_app_main : AppColor.app_main,
        // accentColor: isDarkMode ? AppColor.dark_accent : AppColor.accent,
        bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.transparent),

        // Icon color
        iconTheme: isDarkMode
            ? IconThemeData(color: AppColor.dark_icon)
            : IconThemeData(color: AppColor.icon),
        primaryIconTheme: isDarkMode
            ? IconThemeData(color: AppColor.dark_app_main)
            : IconThemeData(color: AppColor.app_main),
        // accentIconTheme: isDarkMode
        //     ? IconThemeData(color: AppColor.dark_accent)
        //     : IconThemeData(color: AppColor.accent),

        errorColor: isDarkMode ? AppColor.dark_red : AppColor.red,
        primarySwatch: isDarkMode
            ? AppColor.dark_app_main_swatch
            : AppColor.app_main_swatch,

        // Tab indicator color
        indicatorColor: isDarkMode ? AppColor.dark_app_main : AppColor.app_main,

        // page background color
        scaffoldBackgroundColor: isDarkMode
            ? AppColor.dark_scaffold_bg_color
            : AppColor.scaffold_bg_color,

        // Mainly used for Material background color
        canvasColor:
            isDarkMode ? AppColor.dark_material_bg : AppColor.material_bg,

        // Card, BottomBar, AppBar use Surface
        cardTheme: CardTheme(
          shadowColor: isDarkMode ? AppColor.dark_shadow : AppColor.shadow,
          color: isDarkMode ? AppColor.dark_surface : AppColor.surface,
        ),
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          color: isDarkMode ? AppColor.dark_surface : AppColor.surface,
          systemOverlayStyle: isDarkMode ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
        ),
        bottomAppBarColor:
            isDarkMode ? AppColor.dark_surface : AppColor.surface,
        unselectedWidgetColor: isDarkMode
            ? AppColor.dark_unselected_item_color
            : AppColor.unselected_item_color,
        hintColor: isDarkMode
            ? AppColor.dark_hint_color
            : AppColor.hint_color,

        // Text selection color (copy and paste menu of input box)
        fontFamily: 'SFUIText',
        textSelectionTheme: TextSelectionThemeData(
            selectionColor: AppColor.app_main.withAlpha(70),
            selectionHandleColor: AppColor.app_main),
        textTheme: AppTextStyle.getTextTheme(isDarkMode: isDarkMode),
        primaryTextTheme: AppTextStyle.getTextTheme(isDarkMode: isDarkMode),
        // accentTextTheme: AppTextStyle.getTextTheme(isDarkMode: true),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle:
              isDarkMode ? AppTextStyle.text_hint : AppTextStyle.dark_text_hint,
        ),
        dividerColor: AppColor.line,
        dividerTheme: DividerThemeData(
            color: isDarkMode ? AppColor.dark_line : AppColor.line,
            space: 2,
            thickness: 1
        ),
        cupertinoOverrideTheme: CupertinoThemeData(
          brightness: isDarkMode ? Brightness.dark : Brightness.light,
        ));
  }
}
