import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:esay1/colercoler.dart';
import 'constants.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}
class _LoginState extends State<Login> {
  var  mypasword, myemail;
  GlobalKey<FormState>formstate=new GlobalKey<FormState>();
  signIn()async{
    //connexion et ladisponibilité de email est password
    var formdata = formstate.currentState;
     if(formdata!.validate()){
       formdata.save();
       try {
         final Credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
           //connexion avec email et pasword
             email: myemail,
             password: mypasword
         );
         return Credential;
       } on FirebaseAuthException
       catch (e) {
         //error email ou password
         if (e.code == 'user-not-found') {
           AwesomeDialog(context:context, title :"error",body:Text("الحساب غير موجود"))..show();
         } else if (e.code == 'wrong-password') {
           AwesomeDialog(context:context, title :"error",body:Text("كلمة السر خاطئة"))..show();
         }
       }
     }else{
       print("errur");
     }
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
                hexStringToColor("e7f0ea")  ,
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

                hintStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),hintText:"كلمة السر",
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
            Text("انشاء حساب ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),
            InkWell(
              onTap: (){
                Navigator.pushReplacementNamed(context, 'Singup');
              },
              child: Text("اضغط هنا",
              style: TextStyle(color:Colors.blueAccent ,fontWeight: FontWeight.bold,fontSize: 20),),)
          ],),),
          Container(

            child: ElevatedButton(
              
              child: Text("تسجيل الدخول",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
                  color: Colors.white) ,),
              onPressed: () async {
                   final user=await signIn();
                   if(user != null){
                     Navigator.of(context).pushReplacementNamed("index");
                   }

              },
              style: ElevatedButton.styleFrom(

                backgroundColor:Colors.greenAccent.shade400,
                    padding: EdgeInsets.only(left: 30,top: 10,bottom: 10,right: 30),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                
              ),
            ),)
        ],)

        ),
        )
      ],
    )),
    )));
  }

}

