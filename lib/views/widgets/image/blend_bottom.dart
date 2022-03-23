import 'package:dating_demo/all_file/all_file.dart';

class BlendBottom extends StatelessWidget {
  final Widget child;

  const BlendBottom({Key? key,required this.child}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return const LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors:  [
              Colors.transparent,
              Colors.black,
            ],
            stops: [
              0.5,
              1.0
            ])
            .createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
      },
      blendMode: BlendMode.darken,
      child: child,
    );
  }
}
