import 'package:dating_demo/all_file/all_file.dart';

class BtnStyleProps {
  final EdgeInsetsGeometry? padding;

  BtnStyleProps({this.padding});
}

class AppButton {
  static const double DEFAULT_RADIUS = 30;

  static ButtonStyle primaryStyle(BuildContext context,
      {BtnStyleProps? props}) {
    return ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(DEFAULT_RADIUS))),
      padding: props?.padding != null
          ? MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
            (Set<MaterialState> states) => props!.padding!,
      )
          : null,
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) => Theme.of(context).onPrimary(),
      ),
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) => states.contains(MaterialState.disabled)
            ? Theme.of(context).unselectedWidgetColor
            : Theme.of(context).primaryColor,
      ),
      overlayColor: MaterialStateColor.resolveWith((states) => Theme.of(context).onPrimary().withOpacity(0.2)),
    );
  }

  static ButtonStyle ghostStyle(BuildContext context, {BtnStyleProps? props}) {
    return ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(DEFAULT_RADIUS))),
      padding: props?.padding != null
          ? MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
            (Set<MaterialState> states) => props!.padding!,
      )
          : null,
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) => Theme.of(context).textTheme.bodyText2!.color!,
      ),
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) => states.contains(MaterialState.disabled)
            ? Theme.of(context).unselectedWidgetColor
            : Theme.of(context).onPrimary(),
      ),
      overlayColor: MaterialStateColor.resolveWith((states) => Theme.of(context).primaryColor.withOpacity(0.2)),
    );
  }

  static ButtonStyle textStyle(BuildContext context, {Color? backgroundColor}) {
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) => backgroundColor ??Theme.of(context).primaryColor,
      ),
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) => backgroundColor ?? Theme.of(context).primaryColor,
      ),
      elevation: MaterialStateProperty.resolveWith<double?>(
            (Set<MaterialState> states) => 0,
      ),
      overlayColor: MaterialStateColor.resolveWith(
              (states) => backgroundColor ??Theme.of(context).primaryColor.withOpacity(0.1)),
    );
  }

  static ButtonStyle textStyleAccent(BuildContext context) {
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) => Theme.of(context).colorScheme.secondary,
      ),
      overlayColor: MaterialStateColor.resolveWith(
              (states) => Theme.of(context).colorScheme.secondary.withOpacity(0.1)),
    );
  }

  static ButtonStyle textStyleLink(BuildContext context) {
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) => AppColor.tertiary.dynamic,
      ),
      overlayColor: MaterialStateColor.resolveWith(
              (states) => AppColor.tertiary.dynamic.withOpacity(0.1)),
    );
  }

  static ButtonStyle outlineStyleColor(BuildContext context, Color color) {
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) => color,
      ),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.rad_XS),
          side: BorderSide(
              width: 1, color: Theme.of(context).unselectedWidgetColor))),
      overlayColor:
      MaterialStateColor.resolveWith((states) => color.withOpacity(0.1)),
    );
  }

  static ButtonStyle outlineStyle(
      BuildContext context, {
        Color? borderColor,
        Color? textColor,
        double? radius,
      }) {
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) =>
        textColor ?? Theme.of(context).primaryColor,
      ),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? Dimens.rad_XS),
          side: BorderSide(
              width: 1, color: borderColor ?? Theme.of(context).primaryColor))),
      overlayColor: MaterialStateColor.resolveWith((states) =>
      textColor?.withOpacity(0.1) ??
          Theme.of(context).primaryColor.withOpacity(0.1)),
    );
  }

  static ButtonStyle colorStyle(BuildContext context, Color color) {
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) => Theme.of(context).onPrimary(),
      ),
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) => states.contains(MaterialState.disabled)
            ? Theme.of(context).unselectedWidgetColor
            : color,
      ),
      overlayColor: MaterialStateColor.resolveWith((states) => Colors.white10),
    );
  }

  static ButtonStyle primaryWhiteStyle(BuildContext context) {
    return TextButton.styleFrom(
      primary: Theme.of(context).primaryColor,
      backgroundColor: Colors.white,
    );
  }

  static ButtonStyle accentStyle(BuildContext context,
      {BorderRadiusGeometry? borderRadius}) {
    return ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(Dimens.rad_S),
          )),
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) => Theme.of(context).onAccent(),
      ),
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) => states.contains(MaterialState.disabled)
            ? Theme.of(context).unselectedWidgetColor
            : Theme.of(context).colorScheme.secondary,
      ),
      overlayColor: MaterialStateColor.resolveWith((states) => Colors.white10),
    );
  }

  static ButtonStyle lightGrey(BuildContext context) {
    return TextButton.styleFrom(
        primary: Colors.grey[700],
        backgroundColor: Colors.grey[600]!.withOpacity(0.3),
        onSurface: Colors.grey);
  }
}
