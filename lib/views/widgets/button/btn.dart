import 'package:dating_demo/all_file/all_file.dart';

enum BtnType { PRIMARY, GHOST }

class Btn extends StatelessWidget {
  // Data
  final Widget? child;
  final Widget? leading;
  final String? text;
  final bool loading;

  // Style
  final BtnType? btnType;
  final EdgeInsetsGeometry? padding;
  final ButtonStyle? style;
  final bool matchParent;

  // Text Style
  final FontWeight? fontWeight;
  final double? fontSize;

  // Action
  final VoidCallback? onPressed;

  const Btn({
    Key? key,
    this.btnType,
    this.padding,
    this.child,
    this.text,
    this.leading,
    this.loading = false,
    this.style,
    this.matchParent = false,
    this.fontWeight,
    this.fontSize,
    this.onPressed,
  }) : super(key: key);

  const Btn.big({
    Key? key,
    this.child,
    this.text,
    this.leading,
    this.padding = const EdgeInsets.all(Dimens.pad_S),
    this.loading = false,
    this.btnType,
    this.style,
    this.fontWeight = FontWeight.w700,
    this.fontSize = 14,
    this.matchParent = false,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final childWidget = text == null
        ? child
        : text?.text
            .size(fontSize ?? AppTextTheme.DEFAULT_FONT_SIZE)
            .fontWeight(fontWeight ?? FontWeight.w400)
            .make();

    // Style
    final ButtonStyle finalStyle;
    if (style != null) {
      finalStyle = style!;
    } else {
      switch (btnType) {
        case BtnType.PRIMARY:
        case null:
          finalStyle = AppButton.primaryStyle(context,
              props: BtnStyleProps(padding: padding));
          break;
        case BtnType.GHOST:
          finalStyle = AppButton.ghostStyle(context,
              props: BtnStyleProps(padding: padding));
          break;
      }
    }

    final btnBody = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: matchParent ? MainAxisSize.max : MainAxisSize.min,
      children: [
        leading != null ? leading!.marginOnly(right: 4) : Gaps.empty,
        childWidget ?? Gaps.empty
      ],
    );

    return ElevatedButton(
      onPressed: loading ? () {} : onPressed,
      style: finalStyle,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _buildLoading(context),
          (btnBody).opacity(value: loading ? 0 : 1)
        ],
      ),
    );
  }

  Widget _buildLoading(BuildContext context) {
    return loading
        ? SizedBox(
            width: 18,
            height: 18,
            child: AppLoading.defaultLoadingBox(
                strokeWidth: 2, size: 18, color: Theme.of(context).onPrimary()),
          )
        : Gaps.empty;
  }
}
