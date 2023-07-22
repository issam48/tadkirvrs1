

import 'package:esay1/quran_model.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
class quraan extends StatefulWidget {

  int end ;
  int nbrsora;
  List<AyaModel> quranAyats  = [];

  String namesora = "";
  quraan({Key? key,required this.quranAyats,required this.namesora ,required this.end,required this.nbrsora}) : super(key: key);

  @override
  State<quraan> createState() => _quraanState();

}

class _quraanState extends State<quraan> {
  bool isLoading = true; // إضافة حالة متغيرة للتحكم في الانتظار وعرض النص
  // ... بقية الكود هنا

  @override
  void initState() {
    super.initState();
    // قم بتحميل النص هنا، وعندما يكتمل التحميل، قم بتغيير قيمة isLoading إلى false
    loadAyats();
  }

  void loadAyats() async {
    // يجب عليك تحميل النص هنا
    // بمجرد اكتمال التحميل، قم بتغيير قيمة isLoading إلى false
    await Future.delayed(Duration(seconds: 2)); // مثال: انتظار 2 ثانية للتمثيل
    setState(() {
      isLoading = false;
    });
  }
  String ayats ="";
  @override


  Widget build(BuildContext context) {
   /* if (quranAyats.isEmpty){
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.green,
        ),
      );
    }*/
    ayats=getAyat(widget.nbrsora, 1, widget.end, widget.quranAyats);

      return
        Scaffold(

          appBar: AppBar(
            backgroundColor: Color(0xfff1d97c),
            title:Center(child:Text("سورة   ${widget.namesora} ",style: TextStyle(
                fontFamily: "quraani",fontSize: 40,color: Colors.black
            ),)) ,
          ),
          body:
          SingleChildScrollView(

              padding: EdgeInsets.symmetric(horizontal: 10),
              child:
              Column(
                children: [
                  if(widget.nbrsora!=9)
                    Center(

                        child:

                        Text(
                          "بِسْمِ ٱللّٰهِ الرَّحْمٰنِ الرَّحِيْمِ",style: TextStyle(
                            fontFamily: "quraani",fontSize: 40
                        ),
                        )
                    ),
                  isLoading
                      ? CircularProgressIndicator() // إذا كان التطبيق ينتظر تحميل النص
                      : Text(
                    ayats,
                    style: TextStyle(fontFamily: "quran", fontSize: 25),
                  ),

                ],
              )

          )

          ,
        );


  }
}
