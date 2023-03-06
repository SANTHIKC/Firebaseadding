import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
        showDialog(
          context: context,
            builder: (BuildContext context){return AlertDialog(
              title: Text("error"),
                content: Text("Password should be at least 6 characters"),);


            });
        // if(error.contains("Given String is empty or null"))
        // {
        //   showDialog(
        //       context: context,
        //       builder: (BuildContext context){return AlertDialog(
        //         title: Text("error"),
        //         content: Text("Given String is empty or null"),);
        //
        //
        //       });


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

      print(e);
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Animation1(),));

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
