

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
          stream: FirebaseFirestore.instance.collection("Students").snapshots(),
          builder: (context,snapshot) {
              if (snapshot.connectionState==ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator(),);}
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context,index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Center(
                              child: Container(
                                height: 100,
                                width: 100,
                                color: Colors.blue,
                                child: Text(snapshot.data!.docs[index].data()["url"]),
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

                          Row(
                            children: [
                              InkWell(
                                onTap: (){
                                  visible=!visible;

                                },
                                  child: Container(
                                      height: 50,
                                        width: 80,
                                        color: Colors.blue,
                                        child: Text("show Mark")),


                              ),


                            ],
                          ),

                        ],
                      );
                    }
                  );
                }
             else
           {
           return Text("somthing wrong");
            }
              }


        ),
      ),
    );
  }
}
