import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log('Background Message: ${message.messageId}');
  FirebaseMessagingService.showLocalNotification(message);

}

class FirebaseMessagingService {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _localNotifications =

  FlutterLocalNotificationsPlugin();
  static const String _channelId = 'fcm_channel';


  static Function(RemoteMessage message)? onForegroundMessage;
  static Function(RemoteMessage message)? onMessageOpenedApp;
  static Function(RemoteMessage message)? onBackgroundMessage;
  static Function(String token)? onToken;

  static Future<void> init() async {
    await _messaging.requestPermission();

    // Background handler
    FirebaseMessaging.onBackgroundMessage(
      firebaseMessagingBackgroundHandler,
    );

    // Foreground messages
    FirebaseMessaging.onMessage.listen((message) {
      log('Foreground Message: ${message.messageId}');
      onForegroundMessage?.call(message);
    });

    // When app opened from notification
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      log('Opened App Message: ${message.messageId}');
      onMessageOpenedApp?.call(message);
    });

    // Get initial message
    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      log(' Terminated Message: ${initialMessage.messageId}');
      onBackgroundMessage?.call(initialMessage);
    }

    // Token
    final token = await _messaging.getToken();
    if (token != null) {
      log(' FCM Token: $token');
      onToken?.call(token);
    }

    // Token refresh
    _messaging.onTokenRefresh.listen((newToken) {
      log(' Token Refreshed: $newToken');
      onToken?.call(newToken);
    });
    _initLocalNotifications();

  }
  static Future<void> _initLocalNotifications() async {
      const androidSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');

      const settings = InitializationSettings(android: androidSettings);

      await _localNotifications.initialize(settings);

      const androidChannel = AndroidNotificationChannel(
        _channelId,
        'FCM Notifications',
        importance: Importance.max,
      );

      await _localNotifications
          .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(androidChannel);

  }
  static Future<void> showLocalNotification(RemoteMessage message) async {
    final notification = message.notification;
    if (notification == null) return;

    const androidDetails = AndroidNotificationDetails(
      _channelId,
      'FCM Notifications',
      importance: Importance.max,
      priority: Priority.high,
    );

    const details = NotificationDetails(android: androidDetails);

    await _localNotifications.show(
      notification.hashCode,
      notification.title,
      notification.body,
      details,
    );
  }

}
