import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:esay1/colercoler.dart';

import 'constants.dart';
class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);
  @override
  State<Signup> createState() => _SignupState();
}
class _SignupState extends State<Signup> {
  var  username,mypasword, myemail;
  GlobalKey<FormState>formstate=new GlobalKey<FormState>();
    Singupt() async{
      var formdata = formstate.currentState;
        if(formdata!.validate()){
          formdata.save();
          print("تم ب نجاح");
          try {
            UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: myemail,
              password: mypasword);
                return userCredential;
              }
          on FirebaseAuthException catch (e) {
            if (e.code == 'weak-password') {
              AwesomeDialog(context:context, title :"error",body:Text("كلمة السر ضعيفة"));
            } else if (e.code == 'email-already-in-use') {
                AwesomeDialog(context:context, title :"error",body:Text("الحساب موجود سابقا"));
              }
          } catch (e) {print(e);
              }
        }else{
          print("غير صالح");}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:Container(
            alignment: Alignment.center
            ,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration:BoxDecoration(

              gradient: LinearGradient(colors: [
                hexStringToColor("e7f0ea") ,
                hexStringToColor("75f7a0") ,
                hexStringToColor("57eff8")
              ],begin: Alignment.topCenter, end: Alignment.bottomCenter
              ),
            ) ,


            child:SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child:Center(

                  child:Column(

                    children: [

                      Center(child: Image.asset("images/ico5.png",width: 200,height: 200,)),
                      Container(

                        padding: EdgeInsets.only(top: 50),
                        child:Form(
                            key: formstate,
                            child: Column(children: [
                          TextFormField(
                            onSaved: (val){
                              username=val;
                            },
                          validator: (val){

                            if(val!.length > 100){
                              return "اسم المستخدم كبير جدا";
                            }
                            if(val!.length<2){
                              return "اسم المستخدم صغير جدا";
                            }
                            return null;
                          },
                            decoration: InputDecoration(

                              prefixIcon: Icon(Icons.person,color: Colors.white,),

                              hintText: "اسم المستخدم",
                              hintStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.3),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0,style: BorderStyle.none),
                                  borderRadius: BorderRadius.circular(30.0)
                              ),
                            ),

                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            onSaved: (val){
                              myemail=val;
                            },
                            validator: (val){
    if (val!.isEmpty) {
    return 'الرجاء إدخال عنوان البريد الإلكتروني';
    }
    if (!valideremail(val)) {
    return 'عنوان البريد الإلكتروني غير صالح';
    }

                              if(val!.length > 100){
                                return "البريد الالكتروني كبير جدا";
                              }
                              if(val!.length<4){
                                return "البريد الالكتروني صغير جدا";
                              }
                              return null;
                            },
                            decoration: InputDecoration(

                              prefixIcon: Icon(Icons.email,color: Colors.white),
                              hintText: "البريد الالكتروني",

                              filled: true,
                              hintStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                              fillColor: Colors.white.withOpacity(0.3),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0,style: BorderStyle.none),
                                  borderRadius: BorderRadius.circular(30.0)
                              ),
                            ),

                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            onSaved: (val){
                              mypasword=val;
                            },
                            validator: (val){
                              if(val!.length > 100){
                                return "كلمة السر  كبير جدا";
                              }
                              if(val!.length<4){
                                return "كلمةالسر صغير جدا";
                              }
                              return null;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock_outline,color: Colors.white,),

                                hintStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                                hintText:"كلمة السر",
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.3),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 0,style: BorderStyle.none),
                                    borderRadius: BorderRadius.circular(30.0)
                                )
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Row(children: [
                              Text("لتسجيل الدخول ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20), ),
                              InkWell(
                                onTap: (){
                                  Navigator.pushReplacementNamed(context, 'login');
                                },
                                child: Text("اضغط هنا",
                                  style: TextStyle(color:Colors.green,fontWeight: FontWeight.bold,fontSize: 20)),)
                            ],),),
                          Container(

                            child: ElevatedButton(

                              child: Text("تسجيل الدخول"),
                              onPressed: ()async{
                                var respose =  await Singupt();
                              if(respose != null){

                                await FirebaseFirestore.instance.collection("users").add(
                                    {"username": username,
                                      "email":myemail
                                    });
                                Navigator.of(context).pushReplacementNamed("index");
                              }
                              },

                              style: ElevatedButton.styleFrom(

                                backgroundColor:Colors.greenAccent.shade400,
                                padding: EdgeInsets.only(left: 30,top: 10,bottom: 10,right: 30),
                                textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),

                              ),
                            ),)
                        ],)

                        ),
                      )
                    ],
                  )),
            ))
    );
  }

}

