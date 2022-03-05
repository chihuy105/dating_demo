import 'package:dating_demo/all_file/all_file.dart';

class ThemeConfig {

  Widget buildLoadingWidget(BuildContext context,{bool withBackground = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SpinKitThreeBounce(
          color: withBackground ? Colors.white : Theme.of(context).primaryColor,
          size: 30,
        ),
        SizedBox(
          height: 20,
        ),
        FadeAnimatedTextKit(
          text: [
            'Please wait for a while!'.tr,
          ],
          textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            decoration: TextDecoration.none,
            color: withBackground ? Colors.white : Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }

  void showBottomSheet({required BuildContext context, Widget? child}) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          );
        });
  }

}

final ThemeConfig themeConfig = ThemeConfig();
