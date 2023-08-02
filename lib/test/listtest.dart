import 'package:esay1/mkanhifd.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class list extends StatefulWidget {
  const list({Key? key}) : super(key: key);

  @override
  State<list> createState() => _listState();
}
class _listState extends State<list> {

  CollectionReference lista = FirebaseFirestore.instance.collection("lishifd");
  CollectionReference messagerf = FirebaseFirestore.instance.collection("message");
  //getUser() {
    //var user = FirebaseAuth.instance.currentUser;
  //}
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('التذكيرات'),
      ),
      body: Container(
        child: FutureBuilder(
          future: lista.where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid).orderBy("hifdtime",descending: true).get() ,
          builder: ( context,  snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context,i){
                return ListTile(
                  title: Text("  السورة رقم${snapshot.data!.docs[i]['nmbrofaya']}  من الاية${snapshot.data!.docs[i]['startaya']} الى ${snapshot.data!.docs[i]['endaya']}   ",
                    style: const TextStyle(

                      fontSize: 20,
                      color: Colors.black87,
                      fontFamily: 'quran',
                      shadows: [
                        Shadow(
                          offset: Offset(.5, .5),
                          blurRadius: 1.0,
                          color: Color.fromARGB(255, 130, 130, 130),
                        )
                      ]),),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  shape: Border(
                    bottom: BorderSide(color: Colors.black,width: 1.0)
                  ),
                  onTap: ()async{
                    print("========= ${snapshot.data!.docs[i].id}");
                    print("${snapshot.data!.docs[i].get("startaya")}");
                    Navigator.of(context).push(MaterialPageRoute(builder:(context){
                      return contat(
                        a:snapshot.data!.docs[i].id,
                        sta:snapshot.data!.docs[i].get("startaya").toString() ,
                        end: snapshot.data!.docs[i].get("endaya"),
                        nbr: snapshot.data!.docs[i].get("nmbrofaya"),

                      );}));
                  },
                );
                    //Text("${snapshot.data!.docs[i].data()}");
              });
            } else {
              // Handle the case when snapshot doesn't have data
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.green,
                ),
              ); // Placeholder error message
            }
          },
        ),
      ),
    );
  }
}
