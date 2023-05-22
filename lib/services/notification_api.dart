import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();
  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');

    var initializationSettingIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingIOS,
    );

    await _notifications.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {});
  }

  static Future notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'channel name',
        channelDescription: 'channel description',
        importance: Importance.max,
        icon: "@mipmap/ic_launcher",
      ),
      //iOS: IOSNotificationDetails(),
    );
  }

  Future showNotification(
      {int id = 0, String? title, String? body, String? payload}) async {
    return _notifications.show(id, title, body, await notificationDetails());
  }



}
