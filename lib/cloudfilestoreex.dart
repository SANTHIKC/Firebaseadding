import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'cloudstoredata.dart';

class CloudFirestoreEx extends StatefulWidget {
  const CloudFirestoreEx({Key? key}) : super(key: key);

  @override
  State<CloudFirestoreEx> createState() => _CloudFirestoreExState();
}

class _CloudFirestoreExState extends State<CloudFirestoreEx> {
  adding() async {
    await FirebaseFirestore.instance
        .collection("Datas")
        .add({"name": txt.text, "age": txt1.text});
  }

  readf() async {
    var fulldata = await FirebaseFirestore.instance.collection("Datas").get();
    var name = fulldata.docs[0].data()["name"];
    print(name);
  }

  TextEditingController txt = TextEditingController();
  TextEditingController txt1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            onPressed: () {
              adding();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return Cloudstordata();
                },
              ));
            },
            child: Text("+"),
          ),
          FloatingActionButton(
            onPressed: () {
              readf();

            },
            child: Text("read"),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: txt,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "name"),
            ),
            TextField(
              controller: txt1,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: "age"),
            ),
          ],
        ),
      ),
    );
  }
}
