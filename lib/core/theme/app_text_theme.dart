import 'package:dating_demo/all_file/all_file.dart';

class AppTextTheme {
  AppTextTheme._();

  static const double DEFAULT_FONT_SIZE = Dimens.text;

  static TextStyle text = TextStyle(
    color: AppColor.text.dynamic,
    fontSize: DEFAULT_FONT_SIZE
  );

  static TextStyle textHint = text.copyWith(
    color: AppColor.textHint.dynamic
  );

  static TextTheme getTextTheme({bool isDarkMode = false}) {
    var textDynamic = text.copyWith(
      color: isDarkMode ? AppColor.text.dark : AppColor.text.light
    );
    return TextTheme(
      bodyText2: textDynamic.copyWith(fontSize: 14),
      bodyText1: textDynamic.copyWith(fontSize: 14),
      headline1: textDynamic,
      headline2: textDynamic.copyWith(
          color: isDarkMode ? AppColor.textHeading.dark : AppColor.textHeading.light),
      headline3: textDynamic,
      headline4: textDynamic,
      headline5: textDynamic,
      headline6: textDynamic.copyWith(fontWeight: FontWeight.w400),
      subtitle1: textDynamic,
      subtitle2: textDynamic,
      caption: textDynamic,
      overline: textDynamic,
      button: textDynamic,
    );
  }

  static Map<String, Style> getHtmlStyle(BuildContext context) {
    return {
      "body": Style(margin: EdgeInsets.zero, padding: EdgeInsets.zero),
      "html": Style(margin: EdgeInsets.zero, padding: EdgeInsets.zero),
      "p": Style(textAlign: TextAlign.justify),
      "strong": Style(textAlign: TextAlign.center),
      "li": Style(textAlign: TextAlign.justify),
      "li:not(:last-child)": Style(padding: const EdgeInsets.only(bottom: 6, left: 4),),
      "ul": Style(listStylePosition: ListStylePosition.OUTSIDE, ),
      "h3": Style(color: AppColor.primary.dynamic),
      "h2": Style(
          color: AppColor.primary.dynamic,
          fontWeight: FontWeight.w600),

      "table": Style(
        backgroundColor: Theme.of(context).unselectedWidgetColor.withOpacity(0.1),
        // border: Border.all(color: Theme.of(context).hintColor),
      ),
      "tr": Style(
        border: Border.all(color: Theme.of(context).hintColor.withOpacity(0.3)),
        // border: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      "th": Style(
        padding: const EdgeInsets.all(6),
        backgroundColor: Colors.grey,
      ),
      "td": Style(
        padding: const EdgeInsets.all(6),
      ),
    };
  }

  static Map<String, Style> getHtmlDescriptionStyle(BuildContext context) {
    return {
      "p": Style(textAlign: TextAlign.justify, maxLines: 2, textOverflow: TextOverflow.ellipsis, fontSize: FontSize.medium),
    };
  }
}
