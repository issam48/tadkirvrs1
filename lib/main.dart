import 'package:esay1/Myapp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
bool? ide;
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

void main() async{WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
var user =FirebaseAuth.instance.currentUser;
if(user==null){
  ide=false;
}
else{
  ide=true;
}
// Initialize the FlutterLocalNotificationsPlugin
const AndroidInitializationSettings initializationSettingsAndroid =
AndroidInitializationSettings('@mipmap/ic_launcher');
final InitializationSettings initializationSettings =
InitializationSettings(android: initializationSettingsAndroid);
await flutterLocalNotificationsPlugin.initialize(initializationSettings);
runApp(
  Myapp()
//),
);

}
