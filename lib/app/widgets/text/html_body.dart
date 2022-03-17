import 'package:dating_demo/all_file/all_file.dart';

// ImageRender _networkImageRenderC({
//   Map<String, String>? headers,
//   double? width,
//   double? height,
//   Widget Function(String)? altWidget,
// }) =>
//     (context, attributes, element) {
//       // print("parent: ${element!.parent!.localName}");
//       if(element?.parent?.parent?.localName == 'picture'){
//         return Container();
//       }
//       return Image.network(
//         attributes["src"] ?? '',
//         headers: headers,
//         width: width,
//         height: height,
//       );
//     };
//
// final Map<ImageSourceMatcher, ImageRender> _defaultImageRenders = {
//   assetUriMatcher(): _networkImageRenderC(),
//   assetUriMatcher(): _networkImageRenderC(),
//   networkSourceMatcher(extension: "svg"): _networkImageRenderC(),
//   networkSourceMatcher(): _networkImageRenderC(),
// };

class HtmlBody extends StatelessWidget {
  final String? data;
  final Map<String, Style>? mapStyle;

  HtmlBody({Key? key, this.data, this.mapStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (data.isNullOrEmpty()) {
      return Gaps.empty;
    }

    final htmlStyle = AppTextTheme.getHtmlStyle(context);
    if (mapStyle != null) {
      htmlStyle.addAll(mapStyle!);
    }

    return Html(
      style: htmlStyle,
      shrinkWrap: false,

      // customImageRenders: _defaultImageRenders,
      // customRender: {
      //   "table": (context, child) {
      //     return SingleChildScrollView(
      //       scrollDirection: Axis.horizontal,
      //       child:
      //       (context.tree as TableLayoutElement).toWidget(context),
      //     );
      //   },
      //   "picture": (context,child){
      //     var a = context.tree.children;
      //     var b;
      //     a.forEach((element) {
      //       // print('element: ${element.attributes["type"]}');
      //       if(element.attributes["type"] == "image/webp"){
      //         String src = (element.attributes["srcset"])??"";
      //         // print('src $src');
      //         b =  Image.network(src);
      //       }
      //     });
      //     return b;
      //   },
      //   "source": (context,child){}
      // },
      tagsList: Html.tags..addAll(["picture","source"]),
      data: data!,
    );
  }
}
