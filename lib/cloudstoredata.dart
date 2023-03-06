import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Cloudstordata extends StatefulWidget {
  const Cloudstordata({Key? key}) : super(key: key);

  @override
  State<Cloudstordata> createState() => _CloudstordataState();
}

class _CloudstordataState extends State<Cloudstordata> {
  String da="";

  readdatas()async{
    var fulldata = await FirebaseFirestore.instance.collection("Datas").get();
    var name = fulldata.docs[0].data()["name"];
    print(name);
    da =name;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readdatas();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(child: Text(da),),

    );
  }
}
