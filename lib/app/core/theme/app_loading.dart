import 'package:dating_demo/all_file/all_file.dart';

class AppLoading {
  static Widget defaultLoading({
    bool isLoading = true,
    bool center = true,
    double? strokeWidth,
    Color? color,
  }) {
    var loading = isLoading
        ? CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
                color ?? AppColor.secondary.dynamic),
            strokeWidth: strokeWidth ?? 2,
          )
        : Gaps.empty;

    return center ? loading.centered() : loading;
  }

  static Widget defaultLoadingBox(
      {bool isLoading = true,
      double? strokeWidth,
      Color? color,
      double size = 40,
      double? height,
      double? width,
      bool center = true}) {
    if (!isLoading) return Gaps.empty;

    return SizedBox(
        height: height ?? size,
        width: width ?? size,
        child: AppLoading.defaultLoading(
            isLoading: isLoading,
            strokeWidth: strokeWidth,
            color: color,
            center: center));
  }
}
