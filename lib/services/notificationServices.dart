import 'dart:io';
import 'dart:ui';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:rxdart/subjects.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  NotificationService();
  final text = Platform.isIOS;
  final BehaviorSubject<String> behaviorSubject = BehaviorSubject();

  final _localNotifications = FlutterLocalNotificationsPlugin();
  Future<void> initializePlatformNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('ic_stat_notifications');

    final IOSInitializationSettings initializationSettingsIOS =
    IOSInitializationSettings(
        requestSoundPermission: true,
        requestBadgePermission: true,
        requestAlertPermission: true,
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    final InitializationSettings initializationSettings =
    InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    tz.initializeTimeZones();


    await _localNotifications.initialize(
      initializationSettings,
      onSelectNotification: selectNotification,
    );
  }

  Future<NotificationDetails> _notificationDetails() async {


    AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'channel id',
      'channel name',
      groupKey: 'com.justcatering.tiptopplaza',
      channelDescription: 'channel description',
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
      ticker: 'ticker',

      color: const Color(0xff2196f3),
    );

    IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails(
        threadIdentifier: "thread1",);

    final details = await _localNotifications.getNotificationAppLaunchDetails();
    if (details != null && details.didNotificationLaunchApp) {
      behaviorSubject.add(details.payload!);
    }

    NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics, iOS: iosNotificationDetails);

    return platformChannelSpecifics;
  }

  // Future<NotificationDetails> _groupedNotificationDetails() async {
  //   const List<String> lines = <String>[
  //     'group 1 First drink',
  //     'group 1   Second drink',
  //     'group 1   Third drink',
  //     'group 2 First drink',
  //     'group 2   Second drink'
  //   ];
  //   const InboxStyleInformation inboxStyleInformation = InboxStyleInformation(
  //       lines,
  //       contentTitle: '5 messages',
  //       summaryText: 'missed drinks');
  //   AndroidNotificationDetails androidPlatformChannelSpecifics =
  //   const AndroidNotificationDetails(
  //     'channel id',
  //     'channel name',
  //     groupKey: 'com.example.flutter_push_notifications',
  //     channelDescription: 'channel description',
  //     setAsGroupSummary: true,
  //     importance: Importance.max,
  //     priority: Priority.max,
  //     playSound: true,
  //     ticker: 'ticker',
  //     styleInformation: inboxStyleInformation,
  //     color: Color(0xff2196f3),
  //   );
  //
  //   const IOSNotificationDetails iosNotificationDetails =
  //   IOSNotificationDetails(threadIdentifier: "thread2");
  //
  //   final details = await _localNotifications.getNotificationAppLaunchDetails();
  //   if (details != null && details.didNotificationLaunchApp) {
  //     behaviorSubject.add(details.payload!);
  //   }
  //
  //   NotificationDetails platformChannelSpecifics = NotificationDetails(
  //       android: androidPlatformChannelSpecifics, iOS: iosNotificationDetails);
  //
  //   return platformChannelSpecifics;
  // }

  // Future<void> showScheduledLocalNotification({
  //   required int id,
  //   required String title,
  //   required String body,
  //   required String payload,
  //   required int seconds,
  // }) async {
  //   final platformChannelSpecifics = await _notificationDetails();
  //   await _localNotifications.zonedSchedule(
  //     id,
  //     title,
  //     body,
  //     tz.TZDateTime.now(tz.local).add(Duration(seconds: seconds)),
  //     platformChannelSpecifics,
  //     payload: payload,
  //     uiLocalNotificationDateInterpretation:
  //     UILocalNotificationDateInterpretation.absoluteTime,
  //     androidAllowWhileIdle: true,
  //   );
  // }

  Future<void> showLocalNotification({
    required int id,
    required String title,
    required String body,
    required String payload,
  }) async {
    final platformChannelSpecifics = await _notificationDetails();
    await _localNotifications.show(
      id,
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );
  }

  // Future<void> showPeriodicLocalNotification({
  //   required int id,
  //   required String title,
  //   required String body,
  //   required String payload,
  // }) async {
  //   final platformChannelSpecifics = await _notificationDetails();
  //   await _localNotifications.periodicallyShow(
  //     id,
  //     title,
  //     body,
  //     RepeatInterval.everyMinute,
  //     platformChannelSpecifics,
  //     payload: payload,
  //     androidAllowWhileIdle: true,
  //   );
  // }
  //
  // Future<void> showGroupedNotifications({
  //   required String title,
  // }) async {
  //   final platformChannelSpecifics = await _notificationDetails();
  //   final groupedPlatformChannelSpecifics = await _groupedNotificationDetails();
  //   await _localNotifications.show(
  //     0,
  //     "group 1",
  //     "First drink",
  //     platformChannelSpecifics,
  //   );
  //   await _localNotifications.show(
  //     1,
  //     "group 1",
  //     "Second drink",
  //     platformChannelSpecifics,
  //   );
  //   await _localNotifications.show(
  //     3,
  //     "group 1",
  //     "Third drink",
  //     platformChannelSpecifics,
  //   );
  //   await _localNotifications.show(
  //     4,
  //     "group 2",
  //     "First drink",
  //     Platform.isIOS
  //         ? groupedPlatformChannelSpecifics
  //         : platformChannelSpecifics,
  //   );
  //   await _localNotifications.show(
  //     5,
  //     "group 2",
  //     "Second drink",
  //     Platform.isIOS
  //         ? groupedPlatformChannelSpecifics
  //         : platformChannelSpecifics,
  //   );
  //   await _localNotifications.show(
  //     6,
  //     Platform.isIOS ? "group 2" : "Attention",
  //     Platform.isIOS ? "Third drink" : "5 missed drinks",
  //     groupedPlatformChannelSpecifics,
  //   );
  // }

  void onDidReceiveLocalNotification(
      int id,
      String? title,
      String? body,
      String? payload,
      ) {
    print('id $id');
  }

  void selectNotification(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      behaviorSubject.add(payload);
    }
  }

  void cancelAllNotifications() => _localNotifications.cancelAll();
}

