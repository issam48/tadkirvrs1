import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  void scheduleSpacedRepetitionNotifications1(int nbr,int sta,int end) async {

    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

    AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
        nbr.toString(), 'channel_name',channelDescription: 'channel_description',
        importance: Importance.high, priority: Priority.high);
    NotificationDetails notificationDetails =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    DateTime currentTime = DateTime.now();

    DateTime firstRepetitionTime = currentTime.add(Duration(minutes: 1));

    await flutterLocalNotificationsPlugin.schedule(
        0,
        'التذكير الأول',
        'السورة${nbr.toString()}من${sta.toString()}إلى${end.toString()}',

        firstRepetitionTime,
        notificationDetails,
        androidAllowWhileIdle: true,
        payload: '$nbr|$sta|$end'
    );

    DateTime secondRepetitionTime = currentTime.add(Duration(minutes: 4));
    await flutterLocalNotificationsPlugin.schedule(
        1,
        'التذكيرالثاني',
        'السورة${nbr.toString()}من${sta.toString()}إلى${end.toString()}',
        secondRepetitionTime,
        notificationDetails,
        androidAllowWhileIdle: true,
        payload: '$nbr|$sta|$end'

    );
    DateTime thirdRepetitionTime = currentTime.add(Duration(minutes: 6));
    await flutterLocalNotificationsPlugin.schedule(
        2,
        'التذكير الثالث',
        'السورة${nbr.toString()}من${sta.toString()}إلى${end.toString()}',
        thirdRepetitionTime,
        notificationDetails,
        androidAllowWhileIdle: true,
        payload: '$nbr|$sta|$end'
    );  DateTime fouthRepetitionTime = currentTime.add(Duration(minutes: 8));
    await flutterLocalNotificationsPlugin.schedule(
        3,
        'التذكير الرابع',
        'السورة${nbr.toString()}من${sta.toString()}إلى${end.toString()}',
        fouthRepetitionTime,
        notificationDetails,
        androidAllowWhileIdle: true,
        payload: '$nbr|$sta|$end'
    );  DateTime fifthRepetitionTime = currentTime.add(Duration(minutes: 9));
    await flutterLocalNotificationsPlugin.schedule(
        4,
        'التذكير الخامس',
        'السورة${nbr.toString()}من${sta.toString()}إلى${end.toString()}',
        fifthRepetitionTime,
        notificationDetails,
        androidAllowWhileIdle: true,
        payload: '$nbr|$sta|$end'
    );  DateTime sixthRepetitionTime = currentTime.add(Duration(minutes: 10));
    await flutterLocalNotificationsPlugin.schedule(
        5,
        'التذكير السادس',
        'السورة${nbr.toString()}من${sta.toString()}إلى${end.toString()}',
        sixthRepetitionTime,
        notificationDetails,
        androidAllowWhileIdle: true,
        payload: '$nbr|$sta|$end'
    );  DateTime seventhRepetitionTime = currentTime.add(Duration(minutes: 11));
    await flutterLocalNotificationsPlugin.schedule(
        6,
        'التذكير السابع',
        'السورة${nbr.toString()}من${sta.toString()}إلى${end.toString()}',
        seventhRepetitionTime,
        notificationDetails,
        androidAllowWhileIdle: true,
        payload: '$nbr|$sta|$end'
    );
    DateTime eighthRepetitionTime = currentTime.add(Duration(minutes: 12));
    await flutterLocalNotificationsPlugin.schedule(
        7,
        'التذكير الثامن',
        'السورة${nbr.toString()}من${sta.toString()}إلى${end.toString()}',
        eighthRepetitionTime,
        notificationDetails,
        androidAllowWhileIdle: true,
        payload: '$nbr|$sta|$end'
    );
  }
  void scheduleSpacedRepetitionNotifications2(int nbr,int sta,int end) async {

    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

    AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
        "2", 'name',channelDescription: 'description',
        importance: Importance.high, priority: Priority.high);
    NotificationDetails notificationDetails =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    DateTime currentTime = DateTime.now();

    DateTime firstRepetitionTime = currentTime.add(Duration(minutes: 1));

    await flutterLocalNotificationsPlugin.schedule(
        0,
        'التذكير الأول',
        'السورة${nbr.toString()}من${sta.toString()}إلى${end.toString()}',

        firstRepetitionTime,
        notificationDetails,
        androidAllowWhileIdle: true,
        payload: '$nbr|$sta|$end'
    );

    DateTime secondRepetitionTime = currentTime.add(Duration(minutes: 4));
    await flutterLocalNotificationsPlugin.schedule(
        1,
        'التذكيرالثاني',
        'السورة${nbr.toString()}من${sta.toString()}إلى${end.toString()}',
        secondRepetitionTime,
        notificationDetails,
        androidAllowWhileIdle: true,
        payload: '$nbr|$sta|$end'

    );
    DateTime thirdRepetitionTime = currentTime.add(Duration(minutes: 6));
    await flutterLocalNotificationsPlugin.schedule(
        2,
        'التذكير الثالث',
        'السورة${nbr.toString()}من${sta.toString()}إلى${end.toString()}',
        thirdRepetitionTime,
        notificationDetails,
        androidAllowWhileIdle: true,
        payload: '$nbr|$sta|$end'
    );  DateTime fouthRepetitionTime = currentTime.add(Duration(minutes: 8));
    await flutterLocalNotificationsPlugin.schedule(
        3,
        'التذكير الرابع',
        'السورة${nbr.toString()}من${sta.toString()}إلى${end.toString()}',
        fouthRepetitionTime,
        notificationDetails,
        androidAllowWhileIdle: true,
        payload: '$nbr|$sta|$end'
    );  DateTime fifthRepetitionTime = currentTime.add(Duration(minutes: 9));
    await flutterLocalNotificationsPlugin.schedule(
        4,
        'التذكير الخامس',
        'السورة${nbr.toString()}من${sta.toString()}إلى${end.toString()}',
        fifthRepetitionTime,
        notificationDetails,
        androidAllowWhileIdle: true,
        payload: '$nbr|$sta|$end'
    );  DateTime sixthRepetitionTime = currentTime.add(Duration(minutes: 10));
    await flutterLocalNotificationsPlugin.schedule(
        5,
        'التذكير السادس',
        'السورة${nbr.toString()}من${sta.toString()}إلى${end.toString()}',
        sixthRepetitionTime,
        notificationDetails,
        androidAllowWhileIdle: true,
        payload: '$nbr|$sta|$end'
    );  DateTime seventhRepetitionTime = currentTime.add(Duration(minutes: 11));
    await flutterLocalNotificationsPlugin.schedule(
        6,
        'التذكير السابع',
        'السورة${nbr.toString()}من${sta.toString()}إلى${end.toString()}',
        seventhRepetitionTime,
        notificationDetails,
        androidAllowWhileIdle: true,
        payload: '$nbr|$sta|$end'
    );
    DateTime eighthRepetitionTime = currentTime.add(Duration(minutes: 12));
    await flutterLocalNotificationsPlugin.schedule(
        7,
        'التذكير الثامن',
        'السورة${nbr.toString()}من${sta.toString()}إلى${end.toString()}',
        eighthRepetitionTime,
        notificationDetails,
        androidAllowWhileIdle: true,
        payload: '$nbr|$sta|$end'
    );
  }
  void scheduleSpacedRepetitionNotifications3(int nbr,int sta,int end) async {

    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

    AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
        "k", 'channel',channelDescription: 'channel',
        importance: Importance.high, priority: Priority.high);
    NotificationDetails notificationDetails =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    DateTime currentTime = DateTime.now();

    DateTime firstRepetitionTime = currentTime.add(Duration(minutes: 1));

    await flutterLocalNotificationsPlugin.schedule(
        0,
        'التذكير الأول',
        'السورة${nbr.toString()}من${sta.toString()}إلى${end.toString()}',

        firstRepetitionTime,
        notificationDetails,
        androidAllowWhileIdle: true,
        payload: '$nbr|$sta|$end'
    );

    DateTime secondRepetitionTime = currentTime.add(Duration(minutes: 4));
    await flutterLocalNotificationsPlugin.schedule(
        1,
        'التذكيرالثاني',
        'السورة${nbr.toString()}من${sta.toString()}إلى${end.toString()}',
        secondRepetitionTime,
        notificationDetails,
        androidAllowWhileIdle: true,
        payload: '$nbr|$sta|$end'

    );
    DateTime thirdRepetitionTime = currentTime.add(Duration(minutes: 6));
    await flutterLocalNotificationsPlugin.schedule(
        2,
        'التذكير الثالث',
        'السورة${nbr.toString()}من${sta.toString()}إلى${end.toString()}',
        thirdRepetitionTime,
        notificationDetails,
        androidAllowWhileIdle: true,
        payload: '$nbr|$sta|$end'
    );  DateTime fouthRepetitionTime = currentTime.add(Duration(minutes: 8));
    await flutterLocalNotificationsPlugin.schedule(
        3,
        'التذكير الرابع',
        'السورة${nbr.toString()}من${sta.toString()}إلى${end.toString()}',
        fouthRepetitionTime,
        notificationDetails,
        androidAllowWhileIdle: true,
        payload: '$nbr|$sta|$end'
    );  DateTime fifthRepetitionTime = currentTime.add(Duration(minutes: 9));
    await flutterLocalNotificationsPlugin.schedule(
        4,
        'التذكير الخامس',
        'السورة${nbr.toString()}من${sta.toString()}إلى${end.toString()}',
        fifthRepetitionTime,
        notificationDetails,
        androidAllowWhileIdle: true,
        payload: '$nbr|$sta|$end'
    );  DateTime sixthRepetitionTime = currentTime.add(Duration(minutes: 10));
    await flutterLocalNotificationsPlugin.schedule(
        5,
        'التذكير السادس',
        'السورة${nbr.toString()}من${sta.toString()}إلى${end.toString()}',
        sixthRepetitionTime,
        notificationDetails,
        androidAllowWhileIdle: true,
        payload: '$nbr|$sta|$end'
    );  DateTime seventhRepetitionTime = currentTime.add(Duration(minutes: 11));
    await flutterLocalNotificationsPlugin.schedule(
        6,
        'التذكير السابع',
        'السورة${nbr.toString()}من${sta.toString()}إلى${end.toString()}',
        seventhRepetitionTime,
        notificationDetails,
        androidAllowWhileIdle: true,
        payload: '$nbr|$sta|$end'
    );
    DateTime eighthRepetitionTime = currentTime.add(Duration(minutes: 12));
    await flutterLocalNotificationsPlugin.schedule(
        7,
        'التذكير الثامن',
        'السورة${nbr.toString()}من${sta.toString()}إلى${end.toString()}',
        eighthRepetitionTime,
        notificationDetails,
        androidAllowWhileIdle: true,
        payload: '$nbr|$sta|$end'
    );
  }
  /*void scheduleSpacedRepetitionNotifications() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
        'channel_id', 'channel_name',channelDescription: 'channel_description',
        importance: Importance.high, priority: Priority.high);
    const NotificationDetails notificationDetails =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    DateTime currentTime = DateTime.now();

    DateTime firstRepetitionTime = currentTime.add(Duration(minutes: 1));
    await flutterLocalNotificationsPlugin.schedule(
      0,
      'إشعار التكرار المتباعد',
      'حان وقت الإشعار الأول!',
      firstRepetitionTime,
      notificationDetails,
      androidAllowWhileIdle: true,
    );

    DateTime secondRepetitionTime = currentTime.add(Duration(minutes: 2));
    await flutterLocalNotificationsPlugin.schedule(
      1,
      'إشعار التكرار المتباعد',
      'حان وقت الإشعار الثاني!',
      secondRepetitionTime,
      notificationDetails,
      androidAllowWhileIdle: true,
    );
  }*/



