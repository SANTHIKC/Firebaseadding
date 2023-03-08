import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseStoredatas extends StatefulWidget {
  const FirebaseStoredatas({Key? key}) : super(key: key);

  @override
  State<FirebaseStoredatas> createState() => _FirebaseStoredatasState();
}

class _FirebaseStoredatasState extends State<FirebaseStoredatas> {
  TextEditingController nametextcontroller = TextEditingController();
  TextEditingController agetextcontroller = TextEditingController();
  TextEditingController urltextcontroller = TextEditingController();
  adding() async {
    await FirebaseFirestore.instance.collection("Details").add({
      "name": nametextcontroller.text,
      "email": agetextcontroller.text,
      "url": urltextcontroller.text,
    });
  }

  List? datas = [];
  readin() async {
    var fulldata = await FirebaseFirestore.instance.collection("Details").get();
    setState(() {
      datas = fulldata.docs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: nametextcontroller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "name"),
            ),
            TextField(
              controller: agetextcontroller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "age"),
            ),
            TextField(
              controller: urltextcontroller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "url"),
            ),
            ElevatedButton(
                onPressed: () {
                  adding();
                  readin();
                },
                child: Text("add")),
            Expanded(
              child: ListView.builder(
                  itemCount: datas!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListTile(
                        title: Text(datas![index].data()["name"]),
                        subtitle: Text(datas![index].data()["email"]),
                        leading: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(image: NetworkImage(datas![index].data()["url"])),
                              border: Border.all(color: Colors.black),
                              ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
