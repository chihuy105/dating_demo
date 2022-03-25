import 'package:dating_demo/all_file/all_file.dart';

class BtnStyleProps {
  final EdgeInsetsGeometry? padding;
  final double? elevation;

  BtnStyleProps({this.padding, this.elevation});
}

class AppButton {
  // Default Button Value
  static const double defaultRadius = 6;
  static const double defaultElevation = 2;
  static const EdgeInsets defaultPadding = EdgeInsets.all(Dimens.pad_S);

  static ButtonStyle primaryStyle(BuildContext context,
      {BtnStyleProps? props}) {
    var padding = MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
      (states) => props?.padding ?? defaultPadding,
    );
    var elevation = MaterialStateProperty.resolveWith<double>(
      (states) => props?.elevation ?? defaultElevation,
    );

    return ButtonStyle(
      padding: padding,
      elevation: elevation,
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(defaultRadius))),
      foregroundColor: MaterialStateColor.resolveWith(
        (states) => Theme.of(context).onPrimary(),
      ),
      backgroundColor: MaterialStateColor.resolveWith(
        (states) => states.contains(MaterialState.disabled)
            ? Theme.of(context).unselectedWidgetColor
            : Theme.of(context).primaryColor,
      ),
      overlayColor: MaterialStateColor.resolveWith(
          (states) => Theme.of(context).onPrimary().withOpacity(0.2)),
    );
  }

  static ButtonStyle ghostStyle(BuildContext context, {BtnStyleProps? props}) {
    var padding = MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
          (states) => props?.padding ?? defaultPadding,
    );
    var elevation = MaterialStateProperty.resolveWith<double>(
          (states) => props?.elevation ?? defaultElevation,
    );

    return ButtonStyle(
      padding: padding,
      elevation: elevation,
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(defaultRadius))),
      foregroundColor: MaterialStateColor.resolveWith(
        (Set<MaterialState> states) =>
            Theme.of(context).textTheme.bodyText2!.color!,
      ),
      backgroundColor: MaterialStateColor.resolveWith(
        (Set<MaterialState> states) => states.contains(MaterialState.disabled)
            ? Theme.of(context).unselectedWidgetColor
            : Theme.of(context).onPrimary(),
      ),
      overlayColor: MaterialStateColor.resolveWith(
          (states) => Theme.of(context).primaryColor.withOpacity(0.2)),
    );
  }

  static ButtonStyle textStyle(BuildContext context, {BtnStyleProps? props}) {
    var padding = MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
          (states) => props?.padding ?? const EdgeInsets.all(0),
    );
    var elevation = MaterialStateProperty.resolveWith<double>(
          (states) => props?.elevation ?? 0,
    );
    var backgroundColor = Colors.transparent;
    var primary = Theme.of(context).primaryColor;

    return ButtonStyle(
      padding: padding,
      elevation: elevation,
      foregroundColor: MaterialStateColor.resolveWith(
        (Set<MaterialState> states) {
          return primary;
        },
      ),
      backgroundColor: MaterialStateColor.resolveWith(
        (Set<MaterialState> states) => backgroundColor,
      ),
      overlayColor: MaterialStateColor.resolveWith((states) =>
          primary.withOpacity(0.1)),
    );
  }

  static ButtonStyle textStyleAccent(BuildContext context) {
    return ButtonStyle(
      foregroundColor: MaterialStateColor.resolveWith(
        (Set<MaterialState> states) => Theme.of(context).colorScheme.secondary,
      ),
      overlayColor: MaterialStateColor.resolveWith(
          (states) => Theme.of(context).colorScheme.secondary.withOpacity(0.1)),
    );
  }

  static ButtonStyle textStyleLink(BuildContext context) {
    return ButtonStyle(
      foregroundColor: MaterialStateColor.resolveWith(
        (Set<MaterialState> states) => AppColor.tertiary.dynamic,
      ),
      overlayColor: MaterialStateColor.resolveWith(
          (states) => AppColor.tertiary.dynamic.withOpacity(0.1)),
    );
  }

  static ButtonStyle outlineStyleColor(BuildContext context, Color color) {
    return ButtonStyle(
      foregroundColor: MaterialStateColor.resolveWith(
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
      foregroundColor: MaterialStateColor.resolveWith(
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
      foregroundColor: MaterialStateColor.resolveWith(
        (Set<MaterialState> states) => Theme.of(context).onPrimary(),
      ),
      backgroundColor: MaterialStateColor.resolveWith(
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
      foregroundColor: MaterialStateColor.resolveWith(
        (Set<MaterialState> states) => Theme.of(context).onAccent(),
      ),
      backgroundColor: MaterialStateColor.resolveWith(
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
