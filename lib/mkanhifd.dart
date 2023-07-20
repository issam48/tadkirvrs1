import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class contat extends StatefulWidget {

  String a;
  String sta,end,nbr;
   contat({Key? key, required this.a,required this.sta,required this.end,required this.nbr}) : super(key: key);
  @override
  State<contat> createState() => _contatState();
}
class _contatState extends State<contat> {
   final messageTextController = TextEditingController();
  CollectionReference lista = FirebaseFirestore.instance.collection("lishifd");
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference messagerf = FirebaseFirestore.instance.collection("message");
   String? messages;
   void getmessages()async{
      await for(var snapshot in firestore.collection("message").snapshots()){
        for(var mesag in snapshot.docs){
          mesag.data();
        }
      }
   }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],centerTitle: true,
        title: Row(
          children: [
            Image.asset("images/ico.png",height: 25),
            SizedBox(width: 10),
            Text("السورة${widget.nbr}من${widget.sta}إلى${widget.end} ")
          ],
        ),
        actions: [
          IconButton(
              onPressed:(){
              },
              icon: Icon(Icons.close)),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StreamBuilder<QuerySnapshot>(
                stream: messagerf.where("hifdid",isEqualTo: widget.a).snapshots(),
                builder:(context, snapshot){
                  List<affichemessage>messagewidg=[];

                  if(!snapshot.hasData){
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.green,
                      ),
                    );
   }final messagesy = snapshot.data!.docs;
                  for(var me in messagesy){
                    final messageText = me.get("new");
                    final m = affichemessage(text: messageText,);
                    messagewidg.add(m);
                  }
                  return Expanded(
                      child:ListView(
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                        children: messagewidg,
                      ) );
               }),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                        color: Colors.green,
                        width: 2,
                      )
                  )
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child:TextField(
                        controller: messageTextController,
                        onChanged: (value){

                          messages = value;
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          hintText: 'أكتب الأيات المحفوضة',
                          border: InputBorder.none,
                        ),
                      )
                  ),
                  TextButton(
                      onPressed: ()async{
                        messageTextController.clear();
                    /*var querySnapshot=*/await messagerf.
                      where("hifdid",isEqualTo: widget.a).get().then((value){
                        messagerf.doc().set({
                          "new": messages,
                          "hifdid": widget.a,
                          "time": FieldValue.serverTimestamp()
                        });
                         });
                      },
                      child:Text(
                        'ارسال',
                        style:TextStyle(
                          color: Colors.green,fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ) ,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
class affichemessage extends StatelessWidget {
  const affichemessage({required this.text,Key? key}) : super(key: key);
final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.00),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(30),
          color: Colors.green,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            child: Text(
              "$text",
              style: TextStyle(
                fontSize: 15,color: Colors.white
              ),
            ),
          ),
        )
      ],
    ),
    );
  }
}


