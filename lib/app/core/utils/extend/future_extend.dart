import 'package:dio/dio.dart';
import 'package:retry/retry.dart';

import 'package:dating_demo/all_file/all_file.dart';

bool _isCanRetry(DioError err) {
  return (err.type == DioErrorType.response ||
          err.type == DioErrorType.connectTimeout ||
          err.type == DioErrorType.sendTimeout ||
          err.type == DioErrorType.receiveTimeout) &&
      err.error != null &&
      (err.error is SocketException || err.error is TimeoutException);
}

extension FutureExtendRequestApi<T> on Future<T?> {
  Future<T> retryRequest({
    int retryTime = 3,
    Duration delayFactor = const Duration(milliseconds: 200),
    Duration maxDelay = const Duration(seconds: 30),
  }) async {
    var a;
    await retry(
        () async {
          // print('retry: ok loop');
          await this.then((value) {
            // print('retry value: $value');
            a = Future.value(value as T);
          });
        },
        maxAttempts: retryTime,
        delayFactor: delayFactor,
        maxDelay: maxDelay,
        // Retry on SocketException or TimeoutException
        retryIf: (e) {
          // print('retry: ok retryIf');
          if (e is DioError) {
            print('retry: start');
            return _isCanRetry(e);
          }
          return false;
        });
    return a;
  }
}
