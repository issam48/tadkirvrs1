import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esay1/test/listtest.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'constants.dart';
import 'quran_model.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
int i=0;
class Homeayas extends StatefulWidget {

  const Homeayas({Key? key}) : super(key: key);
  @override
  State<Homeayas> createState() => _HomeayasState();
}
class _HomeayasState extends State<Homeayas> {
  CollectionReference hifd= FirebaseFirestore.instance.collection("lishifd");
  CollectionReference messageref= FirebaseFirestore.instance.collection("message");
 //يضاف هدا الجدول في الفاير بايز
  GlobalKey<FormState> formstate =new GlobalKey<FormState>();
  addayathifd()async{
     await hifd.add(
          {
            "nmbrofaya": controllerSuraNumber?.text,
            "startaya":controllerStart?.text,
            "endaya" :controllerEnd?.text,
            "userId": FirebaseAuth.instance.currentUser?.uid,
            "hifdtime":FieldValue.serverTimestamp()

          } );

  }
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  void scheduleSpacedRepetitionNotifications(int nbr,int sta,int end) async {

    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

     AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
        nbr.toString(), 'channel_name',channelDescription: 'channel_description',
        importance: Importance.max, priority: Priority.high);
     NotificationDetails notificationDetails =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    DateTime currentTime = DateTime.now();

    DateTime firstRepetitionTime = currentTime.add(Duration(seconds: 20));
    await flutterLocalNotificationsPlugin.schedule(
      i,

      'التذكير الأول',
      'السورة${nbr.toString()}من${sta.toString()}إلى${end.toString()}',

      firstRepetitionTime,
      notificationDetails,
      androidAllowWhileIdle: true,
      payload: '$nbr|$sta|$end'
    );

    DateTime secondRepetitionTime = currentTime.add(Duration(minutes: 1));
    await flutterLocalNotificationsPlugin.schedule(
      i=i+1,
      'التذكيرالثاني',
      'السورة${nbr.toString()}من${sta.toString()}إلى${end.toString()}',
      secondRepetitionTime,
      notificationDetails,
      androidAllowWhileIdle: true,
        payload: '$nbr|$sta|$end'

    );
    DateTime thirdRepetitionTime = currentTime.add(Duration(minutes: 2));
    await flutterLocalNotificationsPlugin.schedule(
        i=i+1,
      'التذكير الثالث',
      'السورة${nbr.toString()}من${sta.toString()}إلى${end.toString()}',
      thirdRepetitionTime,
      notificationDetails,
      androidAllowWhileIdle: true,
        payload: '$nbr|$sta|$end'
    );  DateTime fouthRepetitionTime = currentTime.add(Duration(minutes: 3));
    await flutterLocalNotificationsPlugin.schedule(
        i=i+1,
      'التذكير الرابع',
      'السورة${nbr.toString()}من${sta.toString()}إلى${end.toString()}',
      fouthRepetitionTime,
      notificationDetails,
      androidAllowWhileIdle: true,
        payload: '$nbr|$sta|$end'
    );  DateTime fifthRepetitionTime = currentTime.add(Duration(minutes: 4));
    await flutterLocalNotificationsPlugin.schedule(
        i=i+1,
      'التذكير الخامس',
      'السورة${nbr.toString()}من${sta.toString()}إلى${end.toString()}',
      fifthRepetitionTime,
      notificationDetails,
      androidAllowWhileIdle: true,
        payload: '$nbr|$sta|$end'
    );  DateTime sixthRepetitionTime = currentTime.add(Duration(minutes: 5));
    await flutterLocalNotificationsPlugin.schedule(
        i=i+1,
      'التذكير السادس',
      'السورة${nbr.toString()}من${sta.toString()}إلى${end.toString()}',
      sixthRepetitionTime,
      notificationDetails,
      androidAllowWhileIdle: true,
        payload: '$nbr|$sta|$end'
    );  DateTime seventhRepetitionTime = currentTime.add(Duration(minutes: 6));
    await flutterLocalNotificationsPlugin.schedule(
        i=i+1,
      'التذكير السابع',
      'السورة${nbr.toString()}من${sta.toString()}إلى${end.toString()}',
      seventhRepetitionTime,
      notificationDetails,
      androidAllowWhileIdle: true,
        payload: '$nbr|$sta|$end'
    );
    DateTime eighthRepetitionTime = currentTime.add(Duration(minutes: 7));
    await flutterLocalNotificationsPlugin.schedule(
        i=i+1,
      'التذكير الثامن',
      'السورة${nbr.toString()}من${sta.toString()}إلى${end.toString()}',
      eighthRepetitionTime,
      notificationDetails,
      androidAllowWhileIdle: true,
        payload: '$nbr|$sta|$end'
    );
  }
  String ayats = "";
  List<AyaModel> quranAyats = [];
  bool isAyaExist(int ayaNumber, int suraNumber, List<AyaModel> quranAyats) {
    return quranAyats
    // cherche on ayat list if exist the aya number and the aya sura
        .where((aya) => aya.ayaNo == ayaNumber && aya.suraNo == suraNumber)
    // if exist return notEmpty, else return empty
        .isEmpty;}
  /*// getAyat: get ayat text from ayat list model
  getAyat(int suraNumber, int start, int end, List<AyaModel> quranAyats) {
    String ayatsText = "";
    List<String> ayats = [];
    // du début aya à la fin a, boucle à travers tous les ayats
    for (var i = start; i <= end; i++) {
      // ajouté aya en ayats
      ayats.add(quranAyats
      //recherche de aya avec i nombre de aya et suraNumber
          .where((aya) => aya.ayaNo == i && aya.suraNo == suraNumber)
      // obtenir le modèle aya
          .first
      // obtenir uniquement ayaText
          .ayaText);
    }
    // joindre le texte de la liste d'ayat à un texte
    ayatsText = ayats.join(" ");
    return ayatsText;
  }
  Future<List<AyaModel>> getJson() async {
    // Load json file from 'assets/quran.json'
    String jsonString = await rootBundle.loadString('assets/quraan.json');

    // Decoding json data
    var jsonData = json.decode(jsonString);

    // Get quran (Ayats) json data
    List<dynamic> jsonArray = jsonData[
    'quran']; // Assuming 'quran' is the key for the array in your JSON

    // looping throught ayats json list and convert each aya json to aya model
    List<AyaModel> quranAyats =
    jsonArray.map((aya) => AyaModel.fromJson(aya)).toList();
    return quranAyats;
  }*/
  @override
  void initState() {
    //fbm.getToken().then((value) {
      //print("=================");
      //print(value);
      //print("===============");
    //});
    getJson().then((value) {
      quranAyats = value;
    });
    super.initState();
    //notification.initialize(flutterLocalNotificationsPlugin);
  }

  bool _formValidator() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      return true;
    } else {
      return false;
    }
  }
  final TextEditingController? controllerSuraNumber = TextEditingController();
  final TextEditingController? controllerStart = TextEditingController();
  final TextEditingController? controllerEnd = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controllerSuraNumber,
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال رقم';
                      }
                      int? parsedNumber = int.tryParse(value);
                      if (parsedNumber == null) {
                        return 'من فضلك أدخل رقما صالحا';
                      }
                      if (parsedNumber >= 114) {
                        return 'يجب أن يكون رقم السورة أقل من 114';
                      }
                      return null;
                    }),
                    decoration:
                    const InputDecoration(label: Text("رقم السورة")),
                  ),
                  TextFormField(
                    controller: controllerStart,
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال رقم';
                      }
                      int? parsedNumber = int.tryParse(value);
                      if (parsedNumber == null) {
                        return 'من فضلك أدخل رقما صالحا';
                      }

                      return null;
                    }),
                    decoration:
                    const InputDecoration(label: Text("من الاية:")),
                  ),
                  TextFormField(
                    controller: controllerEnd,
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'الرجاء إدخال رقم';
                      }
                      int? parsedNumber = int.tryParse(value);
                      if (parsedNumber == null) {
                        return 'من فضلك أدخل رقما صالحا';
                      }

                      return null;
                    }),
                    decoration: const InputDecoration(label: Text("إلى الاية:")),
                  ),
                  Row(

                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      ElevatedButton(

                          style:  ElevatedButton.styleFrom(
                        backgroundColor: Colors.green
                          ),
                          onPressed: () {
                            // check if form is validate
                            if (_formValidator()) {
                              // check if start aya is > then end aya
                              if (int.parse(controllerStart!.text) >
                                  int.parse(controllerEnd!.text)) {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      content: const Text(
                                          "رقم آية البداية اكبر من رقم آية النهاية"),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text("حسنا"))
                                      ],
                                    ));
                              } else
                                // check if start aya number is exist
                              if (isAyaExist(
                                  int.parse(controllerStart!.text),
                                  int.parse(controllerSuraNumber!.text),
                                  quranAyats)) {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      content: Text(
                                          "الاية ${int.parse(controllerStart!.text)
                                          } لاتوجد في السورة ${int.parse(controllerSuraNumber!.text)}"),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text("حسنا"))
                                      ],
                                    ));
                              } else
                                // check if end aya number is exist
                              if (isAyaExist(
                                  int.parse(controllerEnd!.text),
                                  int.parse(controllerSuraNumber!.text),
                                  quranAyats)) {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      content: Text(
                                          "الاية ${int.parse(controllerEnd!.text)
                                          } غير موجودة في السورة ${int.parse(controllerSuraNumber!.text)}"),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text("حسنا"))
                                      ],
                                    ));
                              } else {
                                // set ayats text
                                setState(() {
                                  ayats = getAyat(
                                      int.parse(controllerSuraNumber!.text),
                                      int.parse(controllerStart!.text),
                                      int.parse(controllerEnd!.text),
                                      quranAyats);
                                });
                              }
                            }
                          },
                          child: const Text("اضهار الايات")),
                      Text("                     "),
                      ElevatedButton(

                          style:  ElevatedButton.styleFrom(
                              backgroundColor: Colors.green
                          ),
                          onPressed: () async{
                            // check if form is validate
                            if (_formValidator()) {
                              // check if start aya is > then end aya
                              if (int.parse(controllerStart!.text) >
                                  int.parse(controllerEnd!.text)) {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      content: const Text(
                                          "بداية الأية اكبر من النهاية"),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text("حسنا"))
                                      ],
                                    ));
                              } else
                                // check if start aya number is exist
                              if (isAyaExist(
                                  int.parse(controllerStart!.text),
                                  int.parse(controllerSuraNumber!.text),
                                  quranAyats)) {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      content: Text(
                                          "الأية ${int.parse(controllerStart!.text)
                                          } لا توجد في السورة ${int.parse(controllerSuraNumber!.text)}"),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text("حسنا"))
                                      ],
                                    ));
                              } else
                                // check if end aya number is exist
                              if (isAyaExist(
                                  int.parse(controllerEnd!.text),
                                  int.parse(controllerSuraNumber!.text),
                                  quranAyats)) {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      content: Text(
                                          "الأية ${int.parse(controllerEnd!.text)} لاتوجد في السورة ${int.parse(controllerSuraNumber!.text)}"),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {

                                            },
                                            child: const Text("حسنا"))
                                      ],
                                    ));
                              } else {
                                scheduleSpacedRepetitionNotifications(int.parse(controllerSuraNumber!.text),
                                    int.parse(controllerStart!.text),int.parse(controllerEnd!.text));
                                                            await addayathifd();
                               await Navigator.of(context).push(MaterialPageRoute(builder:(context){
                                  return list();}));
                                  controllerEnd?.clear();
                                  controllerStart?.clear();
                                  controllerSuraNumber?.clear();
                              }
                            }
                          },
                          child: const Text("إضافة للتذكيرات")),],),
                  const SizedBox(
                    height: 30,
                  ),

                  Text(
                    ayats,
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(fontFamily: "quran", fontSize: 22),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
