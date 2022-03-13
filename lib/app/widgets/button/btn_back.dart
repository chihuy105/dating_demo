import 'package:dating_demo/all_file/all_file.dart';

class BtnBack extends StatelessWidget {
  final VoidCallback? onPress;
  final double size;
  final Color? iconColor;
  final Color? backgroundColor;
  final bool? checkCanPop;

  const BtnBack(
      {Key? key,
      this.onPress,
      this.size = 25,
      this.iconColor,
      this.backgroundColor,
      this.checkCanPop = true})
      : super(key: key);

  static BtnBack transparent(BuildContext context){
    return BtnBack(
      iconColor: Theme.of(context).canvasColor,
      backgroundColor: Colors.transparent,
    );
  }

  static BtnBack forHeader(BuildContext context, bool isTransparent){
    final iconColor = isTransparent ? Colors.white : Theme.of(context).primaryColor;
    final iconBackground = isTransparent ? Colors.grey[600]!.withOpacity(0.3) : Colors.transparent;

    return BtnBack(
      iconColor: iconColor,
      backgroundColor: iconBackground,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (checkCanPop == true) {
      if ((ModalRoute.of(context)?.canPop ?? false) == false) {
        return Gaps.empty;
      }
    }

    final iconColorUse = iconColor ?? AppColor.getIconDark();
    final backgroundColorUse = backgroundColor ?? Colors.transparent;

    return BtnCircleIcon(
      Assets.icons.common.icBack.svg(width: size, height: size, color: iconColorUse),
      onPress: onPress ?? () => Get.back(),
      backgroundColor: backgroundColorUse,
      iconColor: iconColorUse,
    );
  }
}
