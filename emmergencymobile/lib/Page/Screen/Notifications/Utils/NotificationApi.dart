import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
class NotificationApi{
  static final _notifications = FlutterLocalNotificationsPlugin();

  static  Future<NotificationDetails> _notificationDetails() async{
    return NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'channel description',
        importance: Importance.max
      ),

    );
  }
  static Future showNotification({
    int id = 0,
    String? titre,
    String? body,
    String? payload,

}) async =>
      _notifications.show(id, titre, body, await _notificationDetails(),payload: payload);


}
