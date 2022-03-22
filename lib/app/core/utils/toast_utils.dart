import 'package:dating_demo/all_file/all_file.dart';
import 'package:dating_demo/app/widgets/toast/ios_toast.dart';

class ToastUtils {
  static OverlaySupportEntry? _curToast;

  static void dismissToast() {
    _curToast?.dismiss();
  }

  static showToast({required BuildContext context, required String msg}) {
    if (!msg.isNullOrEmpty()) {
      _curToast?.dismiss();
      _curToast = showOverlay(
        (_, t) {
          return Theme(
            data: Theme.of(context),
            child: Opacity(
              opacity: t,
              child: IosStyleToast(
                msg: msg,
              ),
            ),
          );
        },
        key: const ValueKey('overlay_toast'),
      );
    }
  }

  static show(String msg) {
    dismissToast();
    _curToast = showSimpleNotification(
        MessageNotification(
          subTitle: msg,
        ),
        background: Colors.transparent,
        elevation: 0);
  }

  static done(String msg) {
    dismissToast();
    _curToast = _showSimpleNotification(
        msg: msg,
        icon: FontAwesomeIcons.solidCheckCircle,
        color: AppColor.successColor.dynamic);
  }

  static error({String? msg, dynamic error}) {
    if (error != null) {
      // print('error');
      logger.e(error);
    }
    logger.e(StackTrace.current);
    // print(StackTrace.current);

    dismissToast();
    _curToast = _showSimpleNotification(
        msg: msg ?? 'errorMsg'.tr,
        icon: FontAwesomeIcons.exclamationCircle,
        color: AppColor.error.dynamic);
  }

  static warning({String? msg}) {
    dismissToast();
    _curToast = _showSimpleNotification(
        msg: msg ?? 'errorMsg'.tr,
        icon: FontAwesomeIcons.exclamationCircle,
        color: AppColor.successColor.dynamic);
  }

  static OverlaySupportEntry _showSimpleNotification(
      {required String msg, required IconData icon, required Color color}) {
    return showSimpleNotification(
        MessageNotification(
          subTitle: msg,
          leading: Icon(
            icon,
            color: color,
          ),
        ),
        background: Colors.transparent,
        elevation: 0);
  }
}

class MessageNotification extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final Widget? leading;
  final Widget? trailing;

  const MessageNotification(
      {Key? key, this.title, this.subTitle, this.leading, this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyText2!.color!;

    final Widget titleWidget;
    final Widget? subTitleWidget;
    if (title == null) {
      titleWidget = subTitle?.text.color(textColor).make() ?? Gaps.empty;
      subTitleWidget = null;
    } else {
      titleWidget = title?.text.lg.medium.color(textColor).make() ?? Gaps.empty;
      subTitleWidget = subTitle?.text.color(textColor).make() ?? Gaps.empty;
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      elevation: 5,
      child: SafeArea(
        child: ListTile(
          leading: leading,
          title: titleWidget,
          subtitle: subTitleWidget,
          trailing: trailing,
          horizontalTitleGap: 0.0,
        ),
      ),
    ).pOnly(top: 16);
  }
}
