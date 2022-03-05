import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeAgo;
import 'package:dating_demo/all_file/all_file.dart';

enum FormatType {
  DATE,
  USER_DATE_MONTH_TIME,
  TIME,
  DATE_TIME,
  DATE_MONTH,
  MONTH_YEAR,
  CODE
}

class TimeUtils {
  TimeUtils._();

  static final formatSimpleDate = DateFormat('dd/MM/yyyy');
  static final formatSimpleHour = DateFormat('HH:mm');
  static final formatSimpleMonthDate = DateFormat('dd/MM');
  static final formatUserDateTime = DateFormat('hh:mm, dd/MM');
  static final formatUserSimpleMonthDay = DateFormat('MMMMd');
  static final DateFormat _monthFormat = new DateFormat('MMMM yyyy');
  static final DateFormat _dayFormat = DateFormat('dd');
  static final DateFormat _firstDayFormat = DateFormat('MMM dd');
  static final DateFormat _fullDayFormat = DateFormat('EEE MMM dd, yyyy');
  static final DateFormat _apiDayFormat = DateFormat('yyyy-MM-dd');
  static final DateFormat _userFullDayFormat = DateFormat('EEE dd MMM');

  static String getDisplayDateTime(dynamic dateTime,
      {FormatType type = FormatType.DATE, String? locale}) {
    if (dateTime == '' || dateTime == null) return '';
    DateTime dt = (dateTime is DateTime) ? dateTime : DateTime.parse(dateTime);

    switch (type) {
      case FormatType.DATE:
        return DateFormat('dd/MM/yyyy', locale).format(dt);
      case FormatType.TIME:
        return DateFormat.Hm(locale).format(dt);
      case FormatType.DATE_TIME:
        return DateFormat('HH:mm dd-MM-yyyy', locale).format(dt);
      case FormatType.DATE_MONTH:
        return DateFormat('d, MMMM', locale).format(dt);
      case FormatType.MONTH_YEAR:
        return DateFormat('MMMM, yyyy', locale).format(dt);
      case FormatType.CODE:
        return DateFormat('ddMMyyyy', locale).format(dt);
      case FormatType.USER_DATE_MONTH_TIME:
        return DateFormat('ddMMyyyy', locale).format(dt);
      default:
        return DateFormat('HH:mm dd-MM-yyyy', locale).format(dt);
    }
  }

  static String? getTimeAgo(String? datetime) {
    if (datetime == null) {
      return null;
    }
    if (DateTime.parse(datetime).isAfter(DateTime.now())) return null;
    if (DateTime.now().difference(DateTime.parse(datetime)).inDays > 7)
      return getDisplayDateTime(DateTime.now());
    final fifteenAgo = DateTime.parse(datetime);
    timeAgo.setLocaleMessages('vi', timeAgo.ViMessages());
    return timeAgo.format(fifteenAgo, locale: Get.locale!.languageCode);
  }

  static DateTime getCurrentDate() {
    return DateTime.now();
  }

  static DateTime? strUtcToDate(String? str, {String format = "yyyy-MM-ddTHH:mm:ssZ"}) {
    if (str == null) return null;
    return new DateFormat(format).parseUTC(str);
  }

  static String getCurrentDateAsStr() {
    return dateToStr(getCurrentDate());
  }

  static String dateToStr(DateTime rs, {DateFormat? format}) {
    return format != null ? format.format(rs) : formatSimpleDate.format(rs);
  }

  static String? dateStrFormat(String? rs, {DateFormat? format}) {
    if (rs == null) return null;
    var date = strUtcToDate(rs);

    if (date == null) return null;
    return format != null ? format.format(date) : formatSimpleDate.format(date);
  }

  static String formatMonth(DateTime d) => _monthFormat.format(d);

  static String formatDay(DateTime day, {String? strFormat}) {
    return strFormat != null
        ? new DateFormat(strFormat).format(day)
        : _dayFormat.format(day);
  }

  static String formatFirstDay(DateTime d) => _firstDayFormat.format(d);

  static String fullDayFormat(DateTime d) => _fullDayFormat.format(d);

  static String apiDayFormat(DateTime d) => _apiDayFormat.format(d);

  static String userFullDayFormat(DateTime d) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final tomorrow = DateTime(now.year, now.month, now.day + 1);

    final aDate = DateTime(d.year, d.month, d.day);
    if (aDate == today) {
      return 'Today';
    } else if (aDate == yesterday) {
      return 'Yesterday';
    } else if (aDate == tomorrow) {
      return 'Tomorrow';
    }

    return _userFullDayFormat.format(d);
  }

  static DateTime today() {
    return DateTime.now();
  }

  /**
   * List of day between 1 day
   * @range: Ex range = 3 => get 3 days on the left and 3 days on the right => total 7 days
   */
  static List<DateTime> daysBetween(DateTime date, int range) {
    final first = date.subtract(new Duration(days: range));
    final last = date.add(new Duration(days: range + 1));

    return daysInRange(first, last).toList();
  }

  /// The list of days in a given month
  static List<DateTime> daysInMonth(DateTime month) {
    var first = firstDayOfMonth(month);
    var daysBefore = first.weekday;
    var firstToDisplay = first.subtract(new Duration(days: daysBefore));
    var last = lastDayOfMonth(month);

    var daysAfter = 7 - last.weekday;

    // If the last day is sunday (7) the entire week must be rendered
    if (daysAfter == 0) {
      daysAfter = 7;
    }

    var lastToDisplay = last.add(new Duration(days: daysAfter));
    return daysInRange(firstToDisplay, lastToDisplay).toList();
  }

  static bool isFirstDayOfMonth(DateTime day) {
    return isSameDay(firstDayOfMonth(day), day);
  }

  static bool isLastDayOfMonth(DateTime day) {
    return isSameDay(lastDayOfMonth(day), day);
  }

  static DateTime firstDayOfMonth(DateTime month) {
    return new DateTime(month.year, month.month);
  }

  static DateTime firstDayOfWeek(DateTime day) {
    /// Handle Daylight Savings by setting hour to 12:00 Noon
    /// rather than the default of Midnight
    day = new DateTime.utc(day.year, day.month, day.day, 12);

    /// Weekday is on a 1-7 scale Monday - Sunday,
    /// This Calendar works from Sunday - Monday
    var decreaseNum = day.weekday % 7;
    return day.subtract(new Duration(days: decreaseNum));
  }

  static DateTime lastDayOfWeek(DateTime day) {
    /// Handle Daylight Savings by setting hour to 12:00 Noon
    /// rather than the default of Midnight
    day = new DateTime.utc(day.year, day.month, day.day, 12);

    /// Weekday is on a 1-7 scale Monday - Sunday,
    /// This Calendar's Week starts on Sunday
    var increaseNum = day.weekday % 7;
    return day.add(new Duration(days: 7 - increaseNum));
  }

  /// The last day of a given month
  static DateTime lastDayOfMonth(DateTime month) {
    var beginningNextMonth = (month.month < 12)
        ? new DateTime(month.year, month.month + 1, 1)
        : new DateTime(month.year + 1, 1, 1);
    return beginningNextMonth.subtract(new Duration(days: 1));
  }

  /// Returns a [DateTime] for each day the given range.
  ///
  /// [start] inclusive
  /// [end] exclusive
  static Iterable<DateTime> daysInRange(DateTime start, DateTime end) sync* {
    var i = start;
    var offset = start.timeZoneOffset;
    while (i.isBefore(end)) {
      yield i;
      i = i.add(new Duration(days: 1));
      var timeZoneDiff = i.timeZoneOffset - offset;
      if (timeZoneDiff.inSeconds != 0) {
        offset = i.timeZoneOffset;
        i = i.subtract(new Duration(seconds: timeZoneDiff.inSeconds));
      }
    }
  }

  /// Whether or not two times are on the same day.
  static bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  static bool isSameWeek(DateTime a, DateTime b) {
    /// Handle Daylight Savings by setting hour to 12:00 Noon
    /// rather than the default of Midnight
    a = new DateTime.utc(a.year, a.month, a.day);
    b = new DateTime.utc(b.year, b.month, b.day);

    var diff = a.toUtc().difference(b.toUtc()).inDays;
    if (diff.abs() >= 7) {
      return false;
    }

    var min = a.isBefore(b) ? a : b;
    var max = a.isBefore(b) ? b : a;
    var result = max.weekday % 7 - min.weekday % 7 >= 0;
    return result;
  }

  static DateTime previousMonth(DateTime m) {
    var year = m.year;
    var month = m.month;
    if (month == 1) {
      year--;
      month = 12;
    } else {
      month--;
    }
    return new DateTime(year, month);
  }

  static DateTime nextMonth(DateTime m) {
    var year = m.year;
    var month = m.month;

    if (month == 12) {
      year++;
      month = 1;
    } else {
      month++;
    }
    return new DateTime(year, month);
  }

  static DateTime previousWeek(DateTime w) {
    return w.subtract(new Duration(days: 7));
  }

  static DateTime nextWeek(DateTime w) {
    return w.add(new Duration(days: 7));
  }
}

