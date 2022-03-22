// ignore_for_file: unnecessary_this

import 'package:dating_demo/all_file/all_file.dart';
import 'package:intl/intl.dart';

final oCcy = NumberFormat.currency(locale: "vi_VN", symbol: "₫");

const _vietnamese = 'aAeEoOuUiIdDyY';
final _vietnameseRegex = <RegExp>[
  RegExp(r'à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ'),
  RegExp(r'À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ'),
  RegExp(r'è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ'),
  RegExp(r'È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ'),
  RegExp(r'ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ'),
  RegExp(r'Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ'),
  RegExp(r'ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ'),
  RegExp(r'Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ'),
  RegExp(r'ì|í|ị|ỉ|ĩ'),
  RegExp(r'Ì|Í|Ị|Ỉ|Ĩ'),
  RegExp(r'đ'),
  RegExp(r'Đ'),
  RegExp(r'ỳ|ý|ỵ|ỷ|ỹ'),
  RegExp(r'Ỳ|Ý|Ỵ|Ỷ|Ỹ')
];

extension DataExtendNum on num? {
  String toPrice({String? symbol}) {
    if (this == null) return '';

    if (symbol != null) {
      return NumberFormat.currency(locale: "vi_VN", symbol: symbol)
          .format(this);
    }
    return oCcy.format(this);
  }

  String toCurrencyAcronyms() {
    var result = (this ?? 0) / 1000;
    return '${result.ceil()}k';
  }

  String? intValidator() => this == null ? 'inputErrorMsg'.tr : null;
}

extension DataExtendString on String? {

  T isEmptyOrValue<T>(T value) {
    if (this == null || this!.isEmpty) {
      return value;
    }
    return this as T;
  }

  bool get isEmptyOrNull => this == null || this!.isEmpty;

  String? capitalizeOnly() {
    if (this.isNullOrEmpty()) return null;
    return this
        ?.split(RegExp(r"\n"))
        .map((e) => e.capitalizeFirstOnly())
        .join('\n')
        .split(' ')
        .map((e) => e.capitalizeFirstOnly())
        .join(' ');
  }

  String? capitalizeFirstOnly() {
    if (this.isNullOrEmpty()) return null;
    return this![0].toUpperCase() + this!.substring(1);
  }

  String? unsigned() {
    if (this.isNullOrEmpty()) return this;

    var result = this;
    for (var i = 0; i < _vietnamese.length; ++i) {
      result = result?.replaceAll(_vietnameseRegex[i], _vietnamese[i]);
    }
    return result;
  }

  String? unsignedLower() {
    return this.unsigned()?.toLowerCase();
  }

  String get toPrice => oCcy.format(this);

  bool isNullOrEmpty() => this == null || this?.trim() == '';

  String? stringValidator() => this.isNullOrEmpty() ? 'inputErrorMsg'.tr : null;

  String? mobileValidator() =>
      this.validateMobile() ? null : 'phoneNotValid'.tr;

  bool validateMobile() {
    if (this.isNullOrEmpty()) {
      return false;
    }

    String pattern = r'(^(09|03|07|08|05)+[0-9]{8}$)';
    RegExp regExp = RegExp(pattern);

    if (!regExp.hasMatch(this!)) {
      return false;
    }
    return true;
  }

  dynamic emailValidator() {
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern.toString());
    if (!regex.hasMatch(this!) || this.isNullOrEmpty()) {
      return 'entervalidemail'.tr;
    } else {
      return null;
    }
  }

  String getDate() {
    return this?.substring(0, 10).split('-').reversed.join('/') ?? '';
  }

  String getDatetime() {
    String date = this?.substring(0, 10) ?? '';
    String time = this?.substring(11, 19) ?? '';
    var dateTime =
        DateFormat("yyyy-MM-dd HH:mm:ss").parse(date + ' ' + time, true);
    var dateLocal = dateTime.toLocal();
    return dateLocal.toString().substring(0, 16);
  }

  String getShippingStatus() {
    switch (this) {
      case 'Pending':
        return 'Pending'.tr;
      case 'Processing':
        return 'Processing'.tr;
      case 'Complete':
        return 'Complete'.tr;
      case 'Cancelled':
        return 'Cancelled'.tr;
      case 'ReceivedConfirmed':
        return 'ReceivedConfirmed'.tr;
    }
    return '';
  }
}

extension RangeExtension on int {
  List<int> toNum(int maxInclusive, {int step = 1}) =>
      [for (int i = this; i <= maxInclusive; i += step) i];
}

extension DateTimeExtension on DateTime {
  DateTime clearTime() {
    return DateTime(this.year, this.month, this.day);
  }
}
