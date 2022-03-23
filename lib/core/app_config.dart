
class AppConfig {
  static const APP_NAME = 'Dating';

  static const DEVICE_TYPE = 'mobile';

  static const IN_PRODUCTION = false;

  /// Server

  static const APP_ID = '6223080f511238a420e532c4';

  static const releaseServer = 'https://dummyapi.io/';
  static const testServer = 'https://dummyapi.io/';
  static const SERVER_URL = IN_PRODUCTION ? releaseServer : testServer;


  /// Debug ///

  static const SHOW_LOG = true;
}
