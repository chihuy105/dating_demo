import 'dart:ui';

import 'package:dating_demo/all_file/all_file.dart';
import 'package:dating_demo/views/widgets/textfiled/outline_textfield.dart';
import 'package:glass_kit/glass_kit.dart';

const String _url =
    'https://i.pinimg.com/originals/ae/ab/3a/aeab3a45b647286c673f69e3e4f253fa.png';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          const Img(_url).scale(scaleValue: 1.3).p32().pOnly(bottom: 180),
          SafeArea(
            child: Column(
              children: [
                'Hi!'.text.bold.xl4.colorOnPrimary(context).make().objectBottomRight().pOnly(right: 40, bottom: 10).expand(flex: 2),
                const LoginInput().pxDefault().expand(flex: 6),
                ''.text.colorHint(context).make().expand(flex: 1),
              ],
            ),
          )
        ],
      ).backgroundColor(AppColor.onBackground.dynamic),
    );
  }
}

class LoginInput extends StatelessWidget {
  const LoginInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _GlassContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const TextFieldOutline(
          hintText: 'Email or Phone',
          contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
        ),
        Gaps.vGap12,
        Btn(
          matchParent: true,
          text: 'Continue',
          onPressed: () {},
        ),
        'or'.text.colorOnPrimary(context).make().objectCenter().py16(),
        _buildSocialBtn(
            const Icon(FontAwesomeIcons.facebookSquare, color: Colors.blue,), 'Continue with Facebook', () {}),
        _buildSocialBtn(const Icon(FontAwesomeIcons.google, color: Colors.red,), 'Continue with Google', () {}),
        _buildSocialBtn(const Icon(FontAwesomeIcons.apple), 'Continue with Apple', () {}),
        Gaps.vGap12,
        Row(
          children: [
            'Dont\'t have an account?'.text.colorOnPrimary(context).make(),
            Gaps.hGap4,
            Btn(
              btnType: BtnType.TEXT,
              text: 'Sign up',
              onPressed: () {},
            ),
          ],
        ),
        Btn(
          btnType: BtnType.TEXT,
          text: 'Forgot your password?',
          onPressed: () {},
        ).objectTopLeft()
      ],
    ).px20().pyDefault());
  }

  Widget _buildSocialBtn(Widget icon, String text, onPress) {
    return Btn(
      btnType: BtnType.GHOST,
      matchParent: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          icon,
          text.text.semiBold.make(),
          icon.opacity(value: 0),
        ],
      ).expand(),
      onPressed: onPress,
    ).pb12();
  }
}

class _GlassContainer extends StatelessWidget {
  const _GlassContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Padding child;

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      height: double.infinity,
      width: 400,
      color: const Color(0xFF363536).withOpacity(0.5),
      borderColor: Colors.transparent,
      elevation: 3.0,
      alignment: Alignment.center,
      borderRadius: BorderRadius.circular(Dimens.rad_XL),
      child: child,
    );
  }
}
