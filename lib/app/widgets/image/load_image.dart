
import 'package:dating_demo/all_file/all_file.dart';

/// Picture loading (supports local and network pictures)
class LoadImage extends StatelessWidget {
  const LoadImage(this.image,
      {Key? key,
      required this.width,
      required this.height,
      this.fit = BoxFit.cover,
      this.holderImg = 'none'})
      : super(key: key);

  final String image;
  final double width;
  final double height;
  final BoxFit fit;
  final String holderImg;

  @override
  Widget build(BuildContext context) {
    if (image.isEmptyOrNull || image == 'null') {
      return 'LoadAssetImage Not Impl'.text.make();
    } else {
      if (image.startsWith('http')) {
        return CachedNetworkImage(
          imageUrl: image,
          // placeholder: (_, __) =>
          //     LoadAssetImage(holderImg, height: height, width: width, fit: fit),
          // errorWidget: (_, __, dynamic error) =>
          //     LoadAssetImage(holderImg, height: height, width: width, fit: fit),
          width: width,
          height: height,
          fit: fit,
        );
      } else {
        return 'Load Default AssetImage Not Impl'.text.make();
      }
    }
  }
}

