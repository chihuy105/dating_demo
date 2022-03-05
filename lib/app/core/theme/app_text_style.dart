import 'package:dating_demo/all_file/all_file.dart';

class AppTextStyle {
  AppTextStyle._();

  static const double DEFAULT_FONT_SIZE = Dimens.text_XL;

  static TextTheme getTextTheme({bool isDarkMode = false}) {
    var textDynamic = isDarkMode ? AppTextStyle.dark_text : AppTextStyle.text;
    return TextTheme(
      bodyText2: textDynamic.copyWith(fontSize: 14),
      bodyText1: textDynamic.copyWith(fontSize: 14),
      headline1: textDynamic,
      headline2: textDynamic.copyWith(
          color:
              isDarkMode ? AppColor.dark_text_heading : AppColor.text_heading),
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

  static const TextStyle text = TextStyle(
    color: AppColor.text,
  );

  static const TextStyle dark_text = TextStyle(
    color: AppColor.dark_text,
  );

  static const TextStyle text_hint = TextStyle(
      color: AppColor.text_gray, textBaseline: TextBaseline.alphabetic);

  static const TextStyle dark_text_hint = TextStyle(
      color: AppColor.dark_text_gray, textBaseline: TextBaseline.alphabetic);

  static Map<String, Style> getHtmlStyle(BuildContext context) {
    return {
      "body": Style(margin: EdgeInsets.zero, padding: EdgeInsets.zero),
      "html": Style(margin: EdgeInsets.zero, padding: EdgeInsets.zero),
      "p": Style(textAlign: TextAlign.justify),
      "strong": Style(textAlign: TextAlign.center),
      "li": Style(textAlign: TextAlign.justify),
      "li:not(:last-child)": Style(padding: const EdgeInsets.only(bottom: 6, left: 4),),
      "ul": Style(listStylePosition: ListStylePosition.OUTSIDE, ),
      "h3": Style(color: AppColor.primary),
      "h2": Style(
          color: AppColor.h2Color,
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
        padding: EdgeInsets.all(6),
        backgroundColor: Colors.grey,
      ),
      "td": Style(
        padding: EdgeInsets.all(6),
      ),
    };
  }

  static Map<String, Style> getHtmlDescriptionStyle(BuildContext context) {
    return {
      "p": Style(textAlign: TextAlign.justify, maxLines: 2, textOverflow: TextOverflow.ellipsis, fontSize: FontSize.medium),
    };
  }

  static TextStyle getPrimaryText(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).primaryColor ,
    );
  }
}
