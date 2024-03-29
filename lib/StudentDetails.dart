import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_login/studentdetails1.dart';
import 'package:flutter/material.dart';

class StudentDetails extends StatefulWidget {
  const StudentDetails({Key? key}) : super(key: key);

  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  adding() async {

   var documentid=
      await  FirebaseFirestore.instance
          .collection("Students")
          .add({"name": nametextcontroller.text,
                "class": classtextcontroller.text,
                 "phone":phonetextcontroller.text,
                 "url":urlstextcontroller.text,
        });
   print("..${documentid.id}");
   FirebaseFirestore.instance.collection("Students").doc(documentid.id).collection("marks").add({
     "physics" :physicstextcontroller.text,
     "Chemistry":chemistrytextcontroller.text,
     "biology":biologytextcontroller.text,
     "english":englishtextcontroller.text,
     "malayalam":malayalamtextcontroller.text,
   });
  }




  List? details = [];
  readf() async {
    var fulldata = await FirebaseFirestore.instance.collection("NSS Student").get();

  }



  TextEditingController nametextcontroller=TextEditingController();
  TextEditingController classtextcontroller=TextEditingController();
  TextEditingController phonetextcontroller=TextEditingController();
  TextEditingController urlstextcontroller=TextEditingController();
  TextEditingController physicstextcontroller=TextEditingController();
  TextEditingController chemistrytextcontroller=TextEditingController();
  TextEditingController biologytextcontroller=TextEditingController();
  TextEditingController englishtextcontroller=TextEditingController();
  TextEditingController malayalamtextcontroller=TextEditingController();
  var formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Nss Students",),
        actions: [InkWell(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder:(context) {
              return StudentDetails1();
            },));
          },
            child: Container(
              height: 30,
                width: 100,
                color: Colors.green,
                child: Center(child: Text("show details"))))],
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView (
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text("Student Details",style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: nametextcontroller,
                  validator: (v) {
                    if(v!.isEmpty)
                      {
                        return "enter name";
                      }
                  },
                  decoration:InputDecoration(hintText: "Name",label: Text("Enter name"),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))) ,


                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration:InputDecoration(hintText: "Class",label: Text("Enter class"),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))) ,
                  controller: classtextcontroller,
                  validator: (r) {
                    if(r!.isEmpty)
                    {
                      return "enter class";
                    }
                  },

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration:InputDecoration(hintText: "Phone",label: Text("Enter Phonenumber"),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))) ,
                  controller: phonetextcontroller,
                  validator: (s) {
                    if(s!.isEmpty)
                    {
                      return "enter phone no";
                    }
                  },

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration:InputDecoration(hintText: "url",label: Text("Enter url"),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))) ,
                  controller: urlstextcontroller,
                  validator: (t) {
                    if(t!.isEmpty)
                    {
                      return "enter url";
                    }
                  },

                ),
              ),
              Text("Subject details"),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration:InputDecoration(hintText: "physics",label: Text("Marks of physics"),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))) ,
                  controller: physicstextcontroller,
                  validator: (u) {
                    if(u!.isEmpty)
                    {
                      return "enter mark";
                    }
                  },

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration:InputDecoration(hintText: "Chemistry",label: Text("Marks of Chemistry"),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))) ,
                  controller: chemistrytextcontroller,
                  validator: (w) {
                    if(w!.isEmpty)
                    {
                      return "enter marks";
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration:InputDecoration(hintText: "Biology",label: Text("Marks of Biology"),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))) ,
                  controller: biologytextcontroller,
                  validator: (x) {
                    if(x!.isEmpty)
                    {
                      return "enter marks";
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration:InputDecoration(hintText: "English",label: Text("Marks of English"),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))) ,
                  controller: englishtextcontroller,
                  validator: (y) {
                    if(y!.isEmpty)
                    {
                      return "enter marks";
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration:InputDecoration(hintText: "Physics",label: Text("Marks of Malayalam"),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))) ,
                  controller: malayalamtextcontroller,
                  validator: (z) {
                    if(z!.isEmpty)
                    {
                      return "enter marks";
                    }
                  },

                ),
              ),
              ElevatedButton(onPressed: (){
                adding();
                readf();

                bool validaters = formkey.currentState!.validate();
                if(validaters==false)
                  {
                    return;
                  }
                else
                  {
                    adding();

                    showDialog(context: context, builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("messege"),
                        content: Text("datas are success fully completed"),
                      );

                    },);
                  }
              }, child: Text("add")),

            ],
          ),
        ),
      ),
    );
  }
}
