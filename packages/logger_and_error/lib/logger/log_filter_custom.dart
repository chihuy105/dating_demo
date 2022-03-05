import 'package:logger/logger.dart';

class CustomLogFilter extends LogFilter {
  final bool logEnable;

  CustomLogFilter({this.logEnable = true});

  @override
  bool shouldLog(LogEvent event) {
    return logEnable;
  }

}