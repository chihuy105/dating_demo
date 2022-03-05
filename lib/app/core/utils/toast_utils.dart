import 'package:dating_demo/all_file/all_file.dart';

class ToastUtils {
  static showToast(String msg) {
    if (!msg.isNullOrEmpty())
      toast(msg);
  }

  static show(String msg) {
    showSimpleNotification(
        MessageNotification(
          subTitle: msg,
        ),
        background: Colors.transparent,
        elevation: 0);
  }

  static done(String msg) {
    showSimpleNotification(
        MessageNotification(
            subTitle: msg,
            leading: Icon(
              FontAwesomeIcons.solidCheckCircle,
              color: AppColor.getSuccessColor(),
            )),
        background: Colors.transparent,
        elevation: 0);
  }

  static error({String? msg, dynamic error}) {
    if (error != null) {
      // print('error');
      print(error);
      logger.e(error);
    }
    logger.e(StackTrace.current);
    // print(StackTrace.current);

    final String errMsg = msg ?? 'errorMsg'.tr;

    showSimpleNotification(
        MessageNotification(
          subTitle: errMsg,
          leading: Icon(
            FontAwesomeIcons.exclamationCircle,
            color: AppColor.getErrorColor(),
          ),
        ),
        background: Colors.transparent,
        elevation: 0);
  }

  static warning({String? msg}) {
    showSimpleNotification(
        MessageNotification(
          subTitle: msg ?? 'errorMsg'.tr,
          leading: Icon(
            FontAwesomeIcons.exclamationTriangle,
            color: AppColor.getWarningColor(),
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
    if(title == null){
      titleWidget = subTitle?.text.color(textColor).make() ?? Gaps.empty;
      subTitleWidget = null;
    }else{
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
