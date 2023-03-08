import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TextDatas extends StatefulWidget {
  const TextDatas({Key? key}) : super(key: key);

  @override
  State<TextDatas> createState() => _TextDatasState();
}

class _TextDatasState extends State<TextDatas> {
  adding() async {
    await FirebaseFirestore.instance
        .collection("Dataa")
        .add({"name": textcontrol.text});
  }

  List? num = [];
  readn() async {
    var fulldatas = await FirebaseFirestore.instance.collection("Dataa").get();
    setState(() {
      num = fulldatas.docs;
    });
    print(num);
  }

  TextEditingController textcontrol = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: textcontrol,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            ElevatedButton(
                onPressed: () {
                  adding();
                  readn();
                },
                child: Text("+")),
            SizedBox(
              height: 200,
              child: ListView.builder(
                  itemCount: num!.length,
                  itemBuilder: (context, index) {
                    return Text(num![index].data()["name"]);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
