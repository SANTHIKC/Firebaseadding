import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

import 'animation1.dart';

class FirebaseAnimation extends StatefulWidget {
  const FirebaseAnimation({Key? key}) : super(key: key);

  @override
  State<FirebaseAnimation> createState() => _FirebaseAnimationState();
}

class _FirebaseAnimationState extends State<FirebaseAnimation> {
  TextEditingController txt=TextEditingController();
  TextEditingController txt1=TextEditingController();
  void signup() async {
    try{
      var data = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: txt.text, password: txt1.text);

    }
    catch(e){
      String error =e.toString();
      if(error.contains("Password should be at least 6 characters"))
      {
        Fluttertoast.showToast(
            msg: "Password should be at least 6 characters",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );

      }
      if(error.contains(" Given String is empty or null"))
      {
        Fluttertoast.showToast(
            msg: "Given String is empty or null",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );

      }
      if(error.contains(" The email address is already in use by another account."))
      {
        Fluttertoast.showToast(
            msg: "The email address is already in use by another account.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );

      }
      if(error.contains(" The email address is badly formatted."))
      {
        Fluttertoast.showToast(
            msg: "The email address is badly formatted.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );

      }



      print(e);
    }
  }

  login() async {
    try{
      var data = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: txt.text, password: txt1.text);
     

    }
    catch(e)
    {
      String error =e.toString();
      if(error.contains("Given String is empty or null"))
        {
          showDialog(context: context, builder: (BuildContext context) {
            return AlertDialog(
              title: Text("error"),
              content: Text("Given String is empty or null"),
            );
          },);
        }
      if(error.contains(" There is no user record corresponding to this identifier. The user may have been deleted."))
      {
        showDialog(context: context, builder: (BuildContext context) {
          return AlertDialog(
            title: Text("error"),
            content: Text(" There is no user record corresponding to this identifier. The user may have been deleted."),
          );
        },);
      }
      if(error.contains(" The email address is badly formatted."))
      {
        showDialog(context: context, builder: (BuildContext context) {
          return AlertDialog(
            title: Text("error"),
            content: Text(" The email address is badly formatted."),
          );
        },);
      }
      if(error.contains(" The password is invalid or the user does not have a password"))
      {
        showDialog(context: context, builder: (BuildContext context) {
          return AlertDialog(
            title: Text("error"),
            content: Text("The password is invalid or the user does not have a password"),
          );
        },);
      }

      print(e);
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height:200,
              width:200,
              child: Lottie.asset("asset/log.json"),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: txt,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                  hintText: "Email",

                  suffixIcon:Icon(Icons.email),

                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                  controller: txt1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                    hintText: "Password",

                    suffixIcon:Icon(Icons.remove_red_eye),

                  )
              ),
            ),
            ElevatedButton(onPressed: (){
              login();

            }, child: Text("login")),
            ElevatedButton(onPressed: (){
              signup();
            }, child: Text("Sign up")),

          ],
        ),
      ),
    );
  }
}
