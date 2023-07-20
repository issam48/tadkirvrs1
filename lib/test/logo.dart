import 'package:flutter/material.dart';
class logo extends StatelessWidget {
  const logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child:SingleChildScrollView(
            //padding: EdgeInsets.all(20),
          child: Center(
              child: Column(children:[ Image.asset("images/ico5.png",height: 200,),
                SizedBox.fromSize(size: Size(0, 20),),
                Text("Tadkir",style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color:Color.fromARGB(200, 0,204,102),
                  letterSpacing: 5.0,
                  fontStyle: FontStyle.normal
                ) ,)])

          ),)
        ),
    ) ;
  }
}
