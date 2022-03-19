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
class LoggerCustom extends Logger {
  LoggerCustom({bool logEnable = true})
      : super(
          filter: CustomLogFilter(logEnable: logEnable),
          printer: PrefixPrinter(PrettyPrinter(
            methodCount: 0,
            // number of method calls to be displayed
            errorMethodCount: 3,
            // number of method calls if stacktrace is provided
            lineLength: 15,
            // width of the output
            colors: false,
            // Colorful log messages
            printEmojis: true,
            // Print an emoji for each log message
            printTime: false, // Should each log print contain a timestamp
          )),
        );
}

class PrefixPrinter extends LogPrinter {
  final LogPrinter _realPrinter;
  late Map<Level, String> _prefixMap;

  PrefixPrinter(this._realPrinter,
      {debug, verbose, wtf, info, warning, error, nothing})
      : super() {
    _prefixMap = {
      Level.debug: debug ?? '  DEBUG ',
      Level.verbose: verbose ?? 'VERBOSE ',
      Level.wtf: wtf ?? '    WTF ',
      Level.info: info ?? '   INFO ',
      Level.warning: warning ?? 'WARNING ',
      Level.error: error ?? '  ERROR ',
      Level.nothing: nothing ?? 'NOTHING',
    };
  }

  @override
  List<String> log(LogEvent event) {
    return _realPrinter
        .log(event)
        .map((s) => '${_prefixMap[event.level]}$s')
        .toList();
  }
}
