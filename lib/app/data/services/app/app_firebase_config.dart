import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:dating_demo/all_file/all_file.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Define a top-level named handler which background/terminated messages will call.
///
/// To verify things are working, check out the native platform logs.
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, su ch as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  logger.i('Handling a background message ${message.messageId}');

  // In here you can perform logic such as HTTP requests, perform IO operations (e.g. updating local storage)
}

/// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class AppFirebaseConfigService {
  static AppFirebaseConfigService instance = AppFirebaseConfigService();

  Future<void> init() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    if (!kIsWeb) {
      if (Platform.isAndroid) {
        channel = const AndroidNotificationChannel(
          'high_importance_channel', // id
          'High Importance Notifications', // title
          importance: Importance.high,
        );

        /// Create an Android Notification Channel.
        ///
        /// We use this channel in the `AndroidManifest.xml` file to override the
        /// default FCM channel to enable heads up notifications.
        await flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>()
            ?.createNotificationChannel(channel);
      }
    }

    if (Platform.isIOS) {
      /// Update the iOS foreground notification presentation options to allow
      /// heads up notifications.
      FirebaseMessaging messaging = FirebaseMessaging.instance;

      await messaging.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );

      NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        logger.w('User granted permission');
      } else if (settings.authorizationStatus ==
          AuthorizationStatus.provisional) {
        logger.w('User granted provisional permission');
      } else {
        logger.w('User declined or has not accepted permission');
      }
    }
  }

  Future<void> fcmControl() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
            requestAlertPermission: true,
            requestBadgePermission: true,
            requestSoundPermission: true);
    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);

    //handle when notification is clicked
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? payload) async {
      // logger.e('$payload');

      if (payload != null) {
        try {
          // final Map<String, dynamic> a = {
          //   "Order.OrderId": 10091,
          //   "NotificationType": "Customer",
          //   "SystemName": "OrderPlaced.CustomerNotification",
          //   "Order.OrderNumber": 10091
          // };
          // final b = jsonEncode(a);
          // final result = await jsonDecode(b);
          // logger.e('$result');
          final payloadJson = await jsonDecode(payload);
          logger.i('onNotification clicked: $payloadJson');
          _handleNotificationClicked(payloadJson);
        } catch (e, trace) {
          logger.e(e.toString(), e, trace);
        }
      }
    });

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      logger.w('Tag: FirebaseMessaging \n'
          'getInitialMessage:\n'
          '-- data: ${message?.data.toString()}\n'
          '-- messageId: ${message?.messageId}\n'
          '-- messageType: ${message?.messageType}\n'
          '-- notification: ${message?.notification.toString()}\n'
          '-- from: ${message?.from}');

      if (message != null) {
        // Navigator.pushNamed(context, '/');
        _handleNotificationClicked(message.data);
      }
    });
    // RemoteMessage? initialMessage =
    // await FirebaseMessaging.instance.getInitialMessage();
    //
    // if (initialMessage != null) {
    //   _handleMessage(initialMessage);
    // }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      logger.w('Tag: FirebaseMessaging \n'
          'onMessage:\n'
          '-- data: ${message.data.toString()}\n'
          '-- messageId: ${message.messageId}\n'
          '-- messageType: ${message.messageType}\n'
          '-- notification: ${message.notification.toString()}\n'
          '-- from: ${message.from}');

      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                // TODO add a proper drawable resource to android, for now using
                //      one that already exists in example app.
                icon: 'launch_background',
              ),
            ),
            payload: jsonEncode(message.data));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // print('A new onMessageOpenedApp event was published!');
      logger.w('Tag: FirebaseMessaging \n'
          'onMessageOpenedApp:\n'
          '-- data: ${message.data.toString()}\n'
          '-- messageId: ${message.messageId}\n'
          '-- messageType: ${message.messageType}\n'
          '-- notification: ${message.notification.toString()}\n'
          '-- from: ${message.from}');

      _handleNotificationClicked(message.data);
      // Navigator.pushNamed(context, '/message',
      //     arguments: MessageArguments(message, true));
    });

    // FirebaseMessaging.onBackgroundMessage((message)async{
    //   await Firebase.initializeApp();
    //   logger.w('Tag: FirebaseMessaging \n'
    //       'onBackgroundMessage:\n'
    //       '-- data: ${message.data.toString()}\n'
    //       '-- messageId: ${message.messageId}\n'
    //       '-- messageType: ${message.messageType}\n'
    //       '-- notification: ${message.notification.toString()}\n'
    //       '-- from: ${message.from}');
    // });

    FirebaseMessaging.instance.subscribeToTopic('GENERAL');
    FirebaseMessaging.instance.subscribeToTopic('PROMOTION');
  }

  void _handleNotificationClicked(Map<String, dynamic> jsonData) {
    if (jsonData.containsKey('NotificationType')) {
      switch (jsonData['NotificationType']) {
        case 'Customer':
          {
            // Get.toNamed(Routes.ORDER_DETAIL,
            //     arguments:
            //         int.parse((jsonData['OrderId'] as String?) ?? '0'));
          }
          break;
        default:
          {
            // final generalNotificationId = int.parse((jsonData['GeneralNotificationId'] as String?) ?? '0');
            // Get.offAllNamed(Routes.MAIN, arguments: generalNotificationId);
            // logger.e('TOPIC type');
          }
      }
    }
  }
}
