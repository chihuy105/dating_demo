
class AppConfig {
  static const APP_NAME = 'Bscx';

  static const DEVICE_TYPE = 'mobile';

  static const IN_PRODUCTION = false;

  /// Server
  static const MONKS_TOKEN = 'IhqTZ9UPLQjZKQkyt0FbBrH5a7f7LtJr5YKqhGJt5qoyUxkMFzSDarC3Tj8b';
  static const MONKS_TIME_FORMAT = 'yyyy-MM-dd HH:mm:ss';

  static const releaseServer = 'https://soccer.sportmonks.com/api/v2.0/';
  static const testServer = 'https://soccer.sportmonks.com/api/v2.0/';
  static const SERVER_URL = IN_PRODUCTION ? releaseServer : testServer;

  static const PRODUCTION_GRAPHQL_SERVER =
      'https://admin.bacsicayxanh.vn/public/graphql';
  static const TEST_GRAPHQL_SERVER =
      'https://test.bacsicayxanh.vn/public/graphql';
  static const GRAPHQL_SERVER =
      IN_PRODUCTION ? PRODUCTION_GRAPHQL_SERVER : TEST_GRAPHQL_SERVER;

  /// Rate App In Store ///
  static const GOOGLE_PLAY_ID = 'vn.dotb.sea';
  static const APP_STORE_ID = '1475488445';

  /// Integrate ///
  static const GG_API = 'AIzaSyDhZui0xT-yUqHvaRzaolX0nhi_kL5nsG0';
  static const GG_MAP_API = 'AIzaSyDhZui0xT-yUqHvaRzaolX0nhi_kL5nsG0';

  /// Debug ///
  static const SHOW_LOG = true;
}
