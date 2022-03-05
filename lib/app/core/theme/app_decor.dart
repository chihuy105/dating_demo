import 'package:dotted_line/dotted_line.dart';
import 'package:dating_demo/all_file/all_file.dart';

class AppDecor {
  static BoxDecoration bottomShadowDecor(
      {Color surfaceColor = Colors.transparent}) {
    return BoxDecoration(boxShadow: <BoxShadow>[
      BoxShadow(color: Colors.grey, blurRadius: 1.0, offset: Offset(0.0, 1.0))
    ], color: surfaceColor);
  }

  static BoxDecoration boxShadow(
      {double rad = 20,
      BorderRadiusGeometry? borderRadius,
      double spreadRadius = 1.8,
      double blurRadius = 1,
      double shadowOpacity = 0.18,
      Color? shadowColor,
      BoxShape? shape,
      Offset? offset,
      Color? surfaceColor}) {
    return BoxDecoration(
      color: surfaceColor ?? Colors.white,
      borderRadius: shape == BoxShape.circle
          ? null
          : borderRadius ?? BorderRadius.circular(rad),
      shape: shape ?? BoxShape.rectangle,
      boxShadow: [
        BoxShadow(
            color: shadowColor ?? Colors.grey.withOpacity(shadowOpacity),
            spreadRadius: spreadRadius,
            blurRadius: blurRadius,
            offset: offset ?? Offset(0.0, 0.0)),
      ],
    );
  }

  static BoxDecoration borderPrimary(BuildContext context,
      {Color surfaceColor = Colors.transparent}) {
    return BoxDecoration(
        color: surfaceColor,
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.all(Radius.circular(Dimens.rad_S)));
  }

  static BoxDecoration borderWhiteBox(
    BuildContext context,
  ) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.rad),
        color: Theme.of(context).canvasColor,
      boxShadow: [BoxShadow(
        color: Colors.black.withOpacity(0.15),
        offset: Offset(0,0),
        spreadRadius: 1,
        blurRadius: 10,
      )]
    );
  }

  static Widget dividerCircle(BuildContext context) {
    return DottedLine(
      direction: Axis.horizontal,
      lineLength: double.infinity,
      lineThickness: 4.0,
      dashLength: 4.0,
      dashColor: Theme.of(context).unselectedWidgetColor,
      dashRadius: 50.0,
      dashGapLength: 6.0,
      dashGapColor: Colors.transparent,
      dashGapRadius: 0.0,
    );
  }

  static BoxDecoration outlineBorderTopCorner(
    BuildContext context,
  ) {
    return BoxDecoration(
        // border: Border.all(color: Colors.orange, width: 1),
        color: AppColor.primary);
  }

  static BoxDecoration borderTopCorner(
    BuildContext context,
  ) {
    return BoxDecoration(
        border: Border.all(color: Colors.grey.shade300,width: 1),
        color: AppColor.secondary);
  }

  static BoxDecoration outlinePrice(BuildContext context) {
    return BoxDecoration(
        color: AppColor.getPriceColor(),
        border: Border.all(color: AppColor.getPriceBorderColor()),
        borderRadius: BorderRadius.all(Radius.circular(Dimens.rad_XXS)));
  }
}
