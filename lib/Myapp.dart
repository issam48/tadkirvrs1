import 'package:esay1/Login.dart';
import 'package:esay1/definetheayats.dart';
import 'package:esay1/indexpqge.dart';
import 'package:esay1/test/listtest.dart';
import 'package:flutter/material.dart';
import 'package:esay1/Signup.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'main.dart';
class Myapp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
       GlobalMaterialLocalizations.delegate,
       GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: {Locale("ar","AE")},
      locale: Locale("ar","AE"),
      home: ide==false ? Login() : index(),
      routes: {
        "Homeayas": (context)=> Homeayas(),
        "list": (context)=> list(),
        "index":(context)=> index(),
        "login": (context)=> Login(),
        "Singup" : (context)=> Signup()
      },
    );
  }
}