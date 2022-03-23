import 'package:dating_demo/all_file/all_file.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// TODO:
/// 1. Add this to manifest
/// <meta-data
///      android:name="com.google.firebase.messaging.default_notification_channel_id"
///      android:value="high_importance_channel" />
/// 2. IOS: https://firebase.flutter.dev/docs/messaging/apple-integration
/// 3. If use IOS lower IOS 10 then add onDidReceiveLocalNotification for flutter_local_notifications
/// 4. Subscribe to  Global Topics
///

const _iconLocation = '@mipmap/ic_launcher';

/// This must be top-level method
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  // In here you can perform logic such as HTTP requests, perform IO operations (e.g. updating local storage)
  logger.i("Handling a background message: ${message.notification?.title}");
}

class FirebaseNotificationService {
  FirebaseNotificationService._();

  static final FirebaseNotificationService _instance =
      FirebaseNotificationService._();

  static FirebaseNotificationService get instance {
    return _instance;
  }

  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
  AndroidNotificationChannel? channel;

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> init() async {
    await _requestPermission();
    await _initFlutterLocalNotificationPlugin();

    await _enableHeadUpMessage();
    await _setupMessageListener();
    await _setupInteractedMessage();

    _firebaseMessaging.getToken().then((value) {
      logger.i('FirebaseMessaging Token: ' + (value?.toString() ?? ''));
    });
  }

  Future<void> _requestPermission() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.denied ||
        settings.authorizationStatus == AuthorizationStatus.notDetermined) {
      logger
          .e('PushNotification: User declined or has not accepted permission');
    }
  }

  ///
  /// Init flutter_local_notifications for local notification
  ///
  Future<void> _initFlutterLocalNotificationPlugin() async {
    // Android Setting
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(_iconLocation);
    // IOS Setting
    const IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    // Combine
    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    // Handle when FlutterLocalNotificationPlugin notification is clicked
    flutterLocalNotificationsPlugin?.initialize(initializationSettings,
        onSelectNotification: (String? payload) async {
      if (payload != null) {
        try {
          final payloadJson = await jsonDecode(payload);
          _handleNotificationClicked(payloadJson);
        } catch (e, trace) {
          logger.e(e.toString(), e, trace);
        }
      }
    });
  }

  void _showMessageHeadUp(RemoteMessage? message) {
    logger.i('_showMessageHeadUp');
    if (message != null) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null &&
          android != null &&
          channel != null &&
          flutterLocalNotificationsPlugin != null) {
        logger.i('_showMessageHeadUp show');
        flutterLocalNotificationsPlugin?.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel!.id,
                channel!.name,
                // other properties...
              ),
            ),
            payload: jsonEncode(message.data));
      }
    }
  }

  Future<void> _setupMessageListener() async {
    // On Foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _logMessage(message);
      _showMessageHeadUp(message);
    });

    // On Background/Terminated
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  ///
  /// App in Background/Terminated -> this will show message both on the navigation and on the screen as well in
  ///
  Future<void> _enableHeadUpMessage() async {
    if (Platform.isIOS) {
      _firebaseMessaging.setForegroundNotificationPresentationOptions(
        alert: true, // Required to display a heads up notification
        badge: true,
        sound: true,
      );
    }

    if (Platform.isAndroid) {
      channel = const AndroidNotificationChannel(
        'high_importance_channel',
        // id string - create also in Android Manifest
        'High Importance Notifications', // title
        importance: Importance.max,
      );

      await flutterLocalNotificationsPlugin
          ?.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel!);
    }
  }

  Future<void> _setupInteractedMessage() async {
    // Get any messages which caused the application to open from a terminated state.
    _firebaseMessaging.getInitialMessage().then((RemoteMessage? message) {
      _logMessage(message);
      _onMessageClick(message);
    });

    // Also handle any interaction when the app is in the background via a Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageClick);
  }

  Future<void> subscribeToTopic(String topicName) async {
    _firebaseMessaging.subscribeToTopic(topicName);
  }

  void _onMessageClick(RemoteMessage? message) {
    if (message == null) {
      return;
    }

    logger.i('_onMessageClick ', message);
    _handleNotificationClicked(message.data);
  }

  void _handleNotificationClicked(Map<String, dynamic>? jsonData) {
    logger.i('_handleNotificationClicked');
    // Owner owner = Owner.fromMap(jsonDecode(jsonData['owner']));
    if (jsonData != null && jsonData.containsKey('NotificationType')) {
      switch (jsonData['NotificationType']) {
        // case 'Customer':
        //   {
        //     Get.toNamed(Routes.ORDER_DETAIL,
        //         arguments:
        //         int.parse((jsonData['OrderId'] as String?) ?? '0'));
        //   }break;
        // default:{
        //   final generalNotificationId = int.parse((jsonData['GeneralNotificationId'] as String?) ?? '0');
        //   Get.offAllNamed(Routes.MAIN, arguments: generalNotificationId);
        //   // logger.e('TOPIC type');
        // }
      }
    }
  }

  void _logMessage(RemoteMessage? message) {
    if (message == null) {
      return;
    }

    logger.w('Tag: FirebaseMessaging \n'
        'getInitialMessage:\n'
        '-- data: ${message.data.toString()}\n'
        '-- messageId: ${message.messageId}\n'
        '-- title: ${message.notification?.title}\n'
        '-- messageType: ${message.messageType}\n'
        '-- notification: ${message.notification.toString()}\n'
        '-- from: ${message.from}');
  }
}
