// ignore_for_file: invalid_use_of_protected_member

import 'package:dating_demo/all_file/all_file.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:math' as math;

bool canPop(BuildContext context) => ModalRoute.of(context)?.canPop ?? false;

class SliverListExtend {
  static SliverList separator(
      {required Widget Function(int index) delegateBuilder,
      required int childCount,
      required Widget separator,
      Widget? tail}) {
    final tailCount = tail != null ? 1 : 0;

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final int itemIndex = index ~/ 2;
          if (index.isEven) {
            if (tailCount == 1 && itemIndex == childCount){
              return tail;
            }

            return delegateBuilder(itemIndex);
          }
          return separator;
        },
        semanticIndexCallback: (Widget widget, int localIndex) {
          if (localIndex.isEven) return localIndex ~/ 2;
          return null;
        },
        childCount: math.max(0, (childCount + tailCount) * 2 - 1) ,
      ),
    );
  }
}

extension NullExtend on dynamic {
  dynamic checkEmpty() {
    if (this == null) return Gaps.empty;
    return this;
  }
}

// ignore: unnecessary_this
extension ThemeExtend on ThemeData {
  Color onPrimary() {
    return primaryTextTheme.bodyText2!.color!;
  }

  Color onAccent() {
    return primaryTextTheme.bodyText2!.color!;
  }

  Color lightGrey() {
    return hintColor.withOpacity(0.6);
  }

  Color darkText() {
    return Get.isDarkMode ? Colors.white : Colors.black;
  }
}

extension ListWidgetExtend<T extends Widget> on List<T> {
  List<Widget> withDivider(Widget divider) {
    if (isNullOrEmpty()) return [];

    List<Widget> rs = [];
    forEach((element) {
      rs.add(element);
      rs.add(divider);
    });
    rs.removeLast();
    return rs;
  }
}

extension VxTextBuilderExtend on VxTextBuilder {

  VxTextBuilder colorPrimary(BuildContext context) {
    velocityColor = Theme.of(context).primaryColor;
    return this;
  }

  VxTextBuilder colorError(BuildContext context) {
    velocityColor = Theme.of(context).errorColor;
    return this;
  }

  VxTextBuilder colorTransparent(BuildContext context) {
    velocityColor = Colors.transparent;
    return this;
  }

  VxTextBuilder colorOnPrimary(BuildContext context) {
    velocityColor = Theme.of(context).onPrimary();
    return this;
  }

  VxTextBuilder colorOnAccent(BuildContext context) {
    velocityColor = Theme.of(context).onAccent();
    return this;
  }

  VxTextBuilder colorLink(BuildContext context) {
    velocityColor = AppColor.getLinkColor();
    return this;
  }

  VxTextBuilder colorHint(BuildContext context) {
    velocityColor = Theme.of(context).hintColor.withOpacity(0.8);
    return this;
  }

  VxTextBuilder price() {
    return this;
  }
}

extension WidgetExtend on Widget {
  Padding pDefault({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.all(Vx.dp20),
        child: this,
      );

  Padding pDefaultL({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.all(Vx.dp24),
        child: this,
      );

  // 430 screen width on mobile
  ConstrainedBox maxWidth({Key? key, double maxWidth = 430}) {
    return ConstrainedBox(
      key: key,
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: this,
    );
  }

  ConstrainedBox maxHeight(double maxHeight, {Key? key}) {
    return ConstrainedBox(
      key: key,
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: this,
    );
  }

  ConstrainedBox minWidth({Key? key, double minWidth = 430}) {
    return ConstrainedBox(
      key: key,
      constraints: BoxConstraints(minWidth: minWidth),
      child: this,
    );
  }

  ConstrainedBox minHeight(double minHeight, {Key? key}) {
    return ConstrainedBox(
      key: key,
      constraints: BoxConstraints(minHeight: minHeight),
      child: this,
    );
  }

  Padding pb24({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.only(bottom: Vx.dp24),
        child: this,
      );

  Padding pb20({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.only(bottom: Vx.dp20),
        child: this,
      );

  Padding pb16({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.only(bottom: Vx.dp16),
        child: this,
      );

  Padding pb12({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.only(bottom: Vx.dp12),
        child: this,
      );

  Padding pb4({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.only(bottom: Vx.dp4),
        child: this,
      );

  Padding pb8({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.only(bottom: Vx.dp8),
        child: this,
      );

  Padding pt24({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.only(top: Vx.dp24),
        child: this,
      );

  Padding pt20({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.only(top: Vx.dp20),
        child: this,
      );

  Padding pt16({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.only(top: Vx.dp16),
        child: this,
      );

  Padding pt12({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.only(top: Vx.dp12),
        child: this,
      );

  Padding pt8({Key? key}) => Padding(
        key: key,
        padding: const EdgeInsets.only(top: Vx.dp8),
        child: this,
      );
}
