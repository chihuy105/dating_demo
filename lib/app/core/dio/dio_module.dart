import 'package:dio/dio.dart';
import 'package:dating_demo/all_file/all_file.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// Author: Kyo Huu
/// Create date: 7/28/2020
///
/// This module provide a Dio instance to all the Service that's needed it
/// It will also contain the base url and all other Dio option
///

class DioModule extends DisposableInterface {
  DioModule();

  Dio? _dio;

  Dio get dio {
    if (_dio != null) {
      return _dio!;
    }

    print('**** Dio create');
    BaseOptions options = new BaseOptions(
      baseUrl: AppConfig.SERVER_URL,
      connectTimeout: 11000,
      receiveTimeout: 11000,
      sendTimeout: 11000,
    );
    // Get Data for mobile on server
    options.headers["device"] = AppConfig.DEVICE_TYPE;
    options.headers["app-id"] = AppConfig.APP_ID;

    _dio = Dio(options);

    if (!AppConfig.IN_PRODUCTION) {
      _dio!.interceptors.add(PrettyDioLogger(
          request: false,
          requestBody: false,
          responseBody: false,
          requestHeader: false));
    }

    return _dio!;
  }

  // TODO Add token to Interceptor
  void addTokenInterceptor(String? token) {
    // dio.interceptors.add(InterceptorsWrapper(onError: (error, handler) async {
    //   if (error.response?.statusCode == 401) {
    //     final authController = Get.find<AuthController>();
    //     if (authController.firebaseUserLD.value != null) {
    //       addToken(await authController.getToken());
    //
    //       var request = error.requestOptions;
    //       final Options options = Options(
    //         headers: request.headers,
    //         method: request.method,
    //       );
    //       try {
    //         var response = await dio.request(
    //           request.path,
    //           data: request.data,
    //           queryParameters: request.queryParameters,
    //           cancelToken: request.cancelToken,
    //           options: options,
    //           onReceiveProgress: request.onReceiveProgress,
    //         );
    //         return handler.resolve(response);
    //       } catch (e) {}
    //     }
    //   }
    //
    //   return handler.next(error);
    // }, onResponse: (response, handler) {
    //   return handler.next(response);
    // }));
  }

  void addToken(String? token) {
    if (token == null) return;
    print('DioModule.addToken =>');

    dio.options.headers["authorization"] = 'Bearer ' + token;
  }

  void removeToken() {
    print('DioModule.removeToken =>');
    dio.options.headers["authorization"] = null;
  }

  @override
  void onClose() {
    print('**** Dio clear');
    //dio.clear();
  }
}
