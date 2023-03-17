import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StudentDetails1 extends StatefulWidget {
  const StudentDetails1({Key? key}) : super(key: key);

  @override
  State<StudentDetails1> createState() => _StudentDetails1State();
}

class _StudentDetails1State extends State<StudentDetails1> {
  bool visible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection("Students").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasData) {
                print(snapshot.data!.docs[0].id);
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Center(
                              child: Container(
                                height: 100,
                                width: 100,
                                color: Colors.blue,
                                child:Image(image: NetworkImage(snapshot.data!.docs[index].data()["url"]),) ,

                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text("Name:"),
                              Text(snapshot.data!.docs[index].data()["name"]),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Class:"),
                              Text(snapshot.data!.docs[index].data()["class"]),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Phone Number:"),
                              Text(snapshot.data!.docs[index].data()["phone"]),
                            ],
                          ),
                          Visibility(
                            visible: visible,
                            child: Container(
                              child: StreamBuilder(
                                  stream: FirebaseFirestore.instance
                                      .collection("Students")
                                      .doc(snapshot.data!.docs[index].id).collection("marks").snapshots(),
                                  builder: (context, snapshot1) {
                                    return Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text("Physics:"),
                                            Text(snapshot1.data!.docs[0].data()["physics"].toString()),

                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("Chemistry:"),
                                            Text(snapshot1.data!.docs[0].data()["Chemistry"].toString()),

                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("Biology:"),
                                            Text(snapshot1.data!.docs[0].data()["biology"].toString()),

                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("English:"),
                                            Text(snapshot1.data!.docs[0].data()["english"].toString()),

                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text("Malayalam:"),
                                            Text(snapshot1.data!.docs[0].data()["malayalam"].toString()),

                                          ],
                                        ),
                                      ],
                                    );
                                  }),

                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                visible = !visible;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(visible ? 'Hide' : 'Show mark'),
                            ),
                          ),
                        ],
                      );
                    });
              } else {
                return Text("somthing wrong");
              }
            }),
      ),
    );
  }
}
