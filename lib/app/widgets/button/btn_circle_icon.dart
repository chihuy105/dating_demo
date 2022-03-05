import 'package:dating_demo/all_file/all_file.dart';

class BtnCircleIcon extends StatelessWidget {
  const BtnCircleIcon(
    this.icon, {
    this.onPress,
    this.backgroundColor,
    this.iconColor,
    this.iconSize,
    this.size = Dimens.ic_3XL,
    this.style,
    this.padding,
    Key? key,
  }) : super(key: key);

  final dynamic icon;
  final VoidCallback? onPress;
  final Color? backgroundColor;
  final double? iconSize;
  final Color? iconColor;
  final double? size;
  final ButtonStyle? style;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    var buttonStyle = style ??
        TextButton.styleFrom(
            primary: Colors.grey[700],
            backgroundColor:
                backgroundColor ?? Colors.grey[600]!.withOpacity(0.3),
            onSurface: Colors.grey,
            padding: padding,
            shape: CircleBorder());
    final Widget iconWidget;
    if (this.icon is IconData) {
      iconWidget = FittedBox(
        child: Icon(
          this.icon,
          size: iconSize ?? Dimens.ic_L,
          color: iconColor ?? Colors.white,
        ),
      );
    } else {
      iconWidget = icon;
    }

    return SizedBox(
      height: size,
      width: size,
      child: TextButton(
        style: buttonStyle,
        onPressed: onPress ?? () {},
        child: iconWidget,
      ),
    );
  }
}
