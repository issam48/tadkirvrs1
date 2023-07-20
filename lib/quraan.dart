import 'package:esay1/quran_model.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
class quraann extends StatelessWidget {
int end ;
int nbrsora;
  List<AyaModel> quranAyats  = [];
  String namesora = "";

   quraann({Key? key,required this.quranAyats,required this.namesora ,required this.end,required this.nbrsora}) : super(key: key);
 /* Future<String> ayat()async{
  return ayats = await getAyat(
      int.parse(suranb.toString()),
      int.parse(sta.toString()),
      int.parse(end.toString()),
      quranAyats);

}*/
String ayats ="";

  @override
  /*void initState() {
    getJson().then((value) {
      quranAyats = value;
    });
    super.initState();
  }*/

  @override
    build(BuildContext context){



      return
        Scaffold(

          appBar: AppBar(
            backgroundColor: Colors.green,
            title:Center(child:Text("${namesora}",style: TextStyle(
fontFamily: "quraani",fontSize: 40
            ),)) ,
          ),

          body:
          SingleChildScrollView(

            padding: EdgeInsets.symmetric(horizontal: 10),
            child:
            Column(
              children: [



            if(nbrsora!=9)
                Center(

                  child:

                  Text(
                    "بسم الله الرحمان الرحيم",style: TextStyle(
                    fontFamily: "quraani",fontSize: 40
                  ),
                  )
                ),




                Text(
                ayats=getAyat(nbrsora, 1, end, quranAyats),style: TextStyle(fontFamily:  "quran", fontSize: 25),
                ),
              ],
            )

          )

          ,
        );
    }

    }



