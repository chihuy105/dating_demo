import 'package:logger/logger.dart';
import 'package:logger_and_error/logger/log_filter_custom.dart';

var logger = LoggerCustom(logEnable: true);

/* to show log of Map inside a string expression, you need add intent into your Map
 * example:
 * Map<String,dynamic> mockData = {
    "id": "2705",
    "employee": {
    "name": "Nancy Ball"
    }
    }
 * final prettyString = JsonEncoder.withIndent(' ').convert(mockData);
 * logger.i('Show Map object: $prettyString');
 */
class LoggerCustom extends Logger{
  LoggerCustom({bool logEnable = true})
      :super(
      filter: CustomLogFilter(logEnable: logEnable),
      printer: PrettyPrinter(
          methodCount: 2,
          // number of method calls to be displayed
          errorMethodCount: 8,
          // number of method calls if stacktrace is provided
          lineLength: 15,
          // width of the output
          colors: true,
          // Colorful log messages
          printEmojis: true,
          // Print an emoji for each log message
          printTime: false // Should each log print contain a timestamp
      ),
  );
}