abstract class Routes {
  Routes._();

  static const HOME = '/' + RouterPaths.HOME;
  static const SWIPE = '/' + RouterPaths.SWIPE;
  static const LIKED_LIST = '/' + RouterPaths.LIKED_LIST;
  static const SECOND_LOOK = '/' + RouterPaths.SECOND_LOOK;
}

abstract class RouterPaths {
  RouterPaths._();

  static const HOME = 'home';
  static const SWIPE = 'swipe';
  static const LIKED_LIST = 'liked-list';
  static const SECOND_LOOK = 'second-look';
}
