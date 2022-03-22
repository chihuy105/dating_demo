import 'package:flutter/cupertino.dart';
import 'package:dating_demo/all_file/all_file.dart';

class BottomSheetOption {
  late String label;
  dynamic callback;
}

void showCustomBottomSheet(BuildContext context,
    {required String label, List<BottomSheetOption>? options, Widget? child}) {
  assert(options != null || child != null);
  List<Widget?> _list = [
    SizedBox(
      width: ScreenUtils.getPercentWidth(percent: 1),
      child: ListTile(
        title: Center(
          child: label.tr.text.headline6(context).make(),
        ),
      ),
    ),
    const Divider(height: 0),
  ];
  if (options != null) {
    Widget _buildOption(String label, dynamic callBack) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            onTap: () {
              Get.back();
              callBack();
            },
            title: Text(
              label.tr,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: Theme.of(context).textTheme.bodyText2!.fontSize),
            ),
          ),
          const Divider(height: 0),
        ],
      );
    }

    for (var option in options) {
      _list.add(
        _buildOption(option.label, option.callback),
      );
    }
  } else {
    _list.add(child);
  }
  showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      backgroundColor: Colors.white,
      context: Get.context!,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: _list as List<Widget>),
        );
      });
}

void openAddEntryDialog(Widget scaffold) {
  Navigator.of(Get.context!).push(MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return scaffold;
      },
      fullscreenDialog: true));
}

void fDialogShowIOS(BuildContext context, {required String title, String? content, required Function() negative, required Function() positive}) {
  showCupertinoDialog(
    barrierDismissible: true,
    context: context,
    builder: (builder) => CupertinoAlertDialog(
      title: Text(title),
      content: Text(content??''),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text('no'.tr,style: TextStyle(
            color: AppColor.error.dynamic
          ),),
          onPressed: (){
            negative();
          },
        ),
        CupertinoDialogAction(
          isDefaultAction: true,
          child: Text('yes'.tr,style: AppTextTheme.text,),
          onPressed: (){
            positive();
          },
        ),
      ],
    ),
  );
}

void fDialogConfirmIOS(BuildContext context, {required String title, String? content, required Function() positive}) {
  showCupertinoDialog(
    barrierDismissible: true,
    context: context,
    builder: (builder) => CupertinoAlertDialog(
      title: Text(title),
      content: content!=null?Text(content):Container(),
      actions: <Widget>[
        CupertinoDialogAction(
          isDefaultAction: true,
          child: Text('LBL_CONFIRM'.tr,style: AppTextTheme.text,),
          onPressed: (){
            positive();
          },
        ),
      ],
    ),
  );
}

Future<void> showAlertDialog(BuildContext context, {required String title, String? content}) async{
  return showCupertinoDialog(
    context: context,
    builder: (builder) => SimpleDialog(
      title: title.text.center.semiBold.make().centered(),
      children: [
        // content?.text.make().centered().checkEmpty(),
        Gaps.vGap16,
        Row(
          children: <Widget>[
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    side: BorderSide(color: Colors.red, width: 1.0), // HERE
                  ),
                  side:
                  const BorderSide(color: Colors.red, width: 1.0)), // AND HERE
              onPressed: () {
                Get.back(result: true);
              },
              child: 'Cancel'.text.color(Colors.red).make(),
            ).pOnly(left: 16).expand(flex: 1),
            Gaps.hGap16,
            TextButton(
              onPressed: () {
                Get.back(result: false);
              },
              child: 'OK'.text.white.make().px(15),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColor.primary.dynamic),
              ),
            ).pOnly(right: 16).expand(flex: 1),
          ],
        ),
      ],
    ),
  );
}
