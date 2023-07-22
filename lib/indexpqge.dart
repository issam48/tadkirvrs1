import 'package:esay1/qura.dart';
import 'package:esay1/quraan.dart';
import 'package:esay1/quran_model.dart';
import 'package:esay1/test/listtest.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'definetheayats.dart';
class index extends StatefulWidget {
  const index({Key? key}) : super(key: key);

  @override
  State<index> createState() => _indexState();
}

class _indexState extends State<index> {
  String ayats = "";
  List<AyaModel> quranAyats = [];
  @override
  void initState(){
    getJson().then((value) {
      quranAyats = value;
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child:
        ListView(
          children: [
            UserAccountsDrawerHeader(accountName: Text("Tadkir"),
                accountEmail: Text("قائمة الخيرات"),
            decoration: BoxDecoration(
              color: Colors.green
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white.withOpacity(0.5),
              child: ClipOval(
                child: Image.asset("images/ico5.png"),
              ),
            ),
            ),
            ListTile(
              
                title:
                Text("الحفظ",),leading: Icon(Icons.book),onTap:(){
              Navigator.of(context).push(MaterialPageRoute(builder:(context){
                return Homeayas();}));
            }),
            ListTile(
                title:
                Text("قائمة التذكيرات",),leading: Icon(Icons.book),onTap:(){
              Navigator.of(context).push(MaterialPageRoute(builder:(context){
                return list();}));
            }),
            ListTile(
                title:
                Text("تسجيل الخروج",),leading: Icon(Icons.exit_to_app),onTap:()async{
             await FirebaseAuth.instance.signOut();
             Navigator.of(context).pushReplacementNamed("login");
            })
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "السور",
          style: TextStyle(
            color: Color(0xff0c0c0c),
            fontFamily: "quraani",
              fontSize: 50,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                    offset: Offset(1, 1),
                    blurRadius: 2.0,

                    color: Color.fromARGB(255, 0, 0, 0)
                )
              ]
          ),
        ),
        backgroundColor: Color(0xfff1d97c),
        //backgroundColor: const Color.fromARGB(255, 56, 115, 59),
      )
          ,body:

    indexCreator(context) ,
     /* body: FutureBuilder(
        future: getJson(),
        builder: (
            BuildContext context,
            AsyncSnapshot snapshot,
            ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              return indexCreator(snapshot.data, context);
            } else {
              return const Text('Empty data');
            }
          } else {
            return Text('State: ${snapshot.connectionState}');
          }
        },
      ),*/
    );

  }
  Container indexCreator(/*quran,*/context){
    return Container(
color: const Color(0xffcac0a5),
//color: const Color.fromARGB(255, 57, 201, 45),
      child:
      ListView(

        children: [
          
          for (int i = 0; i < 114; i++)
            Container(

              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/dd.png"),
                      fit:BoxFit.cover
                  )
              ),


              width: 400,
transformAlignment: Alignment.center,
              
             // color:
             // i % 2 == 0
               //   ? const Color.fromARGB(255, 253, 247, 230)
               //   : const Color.fromARGB(255, 253, 251, 240),
              child: TextButton(


                child: Row(

mainAxisAlignment: MainAxisAlignment.center,
                  children: [


                   Container(

                    child: Text(
                      arabicName[i]['name'],
                      style: const TextStyle(

                          fontSize: 30,
                          color: Colors.black87,
                          fontFamily: 'quraani',
                          shadows: [
                            Shadow(
                              offset: Offset(.5, .5),
                              blurRadius: 1.0,
                              color: Color.fromARGB(255, 130, 130, 130),
                            )
                          ]),
                     // textDirection: TextDirection.rtl,
                    ),),
                  ],
                ),
               onPressed: () {
                  /*setState(() {
                   ayats= getAyat(i+1, 1, noOfVerses[i], quranAyats);

                  });*/
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => quraan(



                            namesora: arabicName[i]["name"],
                            end: noOfVerses[i],
                            nbrsora: i+1,
                            quranAyats: quranAyats,

                          )

                      )

                  );


                 // Navigator.of(context).push(MaterialPageRoute(builder:(context){
                   // return logo();}));

                 /* Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => quraan(
                            suranb:i+1,
                            sta:1,
                            end:noOfVerses[i],
                          )));*/

                },

              ),

            ),

        ],

      ),

    );
  }
}
