import 'package:dating_demo/all_file/all_file.dart';

class Img extends StatelessWidget {
  final String? src;
  final BoxFit fit;

   const Img(this.src, {Key? key, this.fit = BoxFit.fitWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorWidget = Container(
      color: Colors.grey[100],
      child: Assets.img.noImage.image(fit: fit),
    );

    if (src.isNullOrEmpty()) {
      return errorWidget;
    }

    if (src!.startsWith('http')) {
      var url = src!.startsWith('http://')
          ? src!.replaceFirst('http://', 'https://')
          : src!;

      if (src!.endsWith('.svg')) {
        return SvgPicture.network(src!, fit: fit);
      }

      return CachedNetworkImage(
        imageUrl: url,
        fit: fit,
        // progressIndicatorBuilder: (context, url, downloadProgress) =>
        //     CircularProgressIndicator(
        //   color: AppColor.primary,
        // ).centered(),
        errorWidget: (context, url, error) => errorWidget,
      );

      // return Image.network(
      //   url, fit: this.fit, loadingBuilder: (context, url, downloadProgress)=>CircularProgressIndicator(color: AppColor.primary,).centered(),
      //   errorBuilder: (context, url, error) => errorWidget
      // );
    }

    if (src!.contains('assets/')) {
      if (src!.contains('.svg')) {
        return SvgPicture.asset(src!, fit: fit);
      }

      return Image.asset(
        src!,
        fit: fit,
      );
    }

    return Gaps.empty;
  }
}
