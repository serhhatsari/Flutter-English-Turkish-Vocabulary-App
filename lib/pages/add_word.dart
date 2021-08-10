import 'dart:collection';

import 'package:english_turkish/firebase/firebase.dart';
import 'package:flutter/material.dart';

class AddWord extends StatefulWidget {
  const AddWord({Key? key}) : super(key: key);

  @override
  _AddWordState createState() => _AddWordState();
}

class _AddWordState extends State<AddWord> {
  var formkey = GlobalKey<FormState>();
  var tfeng = TextEditingController();
  var tftr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  "English Word",
                  style: TextStyle(
                      color: Colors.tealAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: TextFormField(
                    controller: tfeng,
                    validator: (tfinput) {
                      if (tfinput!.isEmpty) {
                        return "Enter a word please";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      icon: Icon(Icons.language),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "You can enter your word in here",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "Turkish Meaning",
                  style: TextStyle(
                      color: Colors.tealAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: TextFormField(
                    controller: tftr,
                    validator: (tfinput) {
                      if (tfinput!.isEmpty) {
                        return "Enter the meaning please";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      icon: Icon(Icons.language),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "You can enter the meaning in here",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 60,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  bool check = formkey.currentState!.validate();
                  if (check) {
                    var hmp = HashMap<String, dynamic>();
                    hmp["English_word"] = tfeng.text;
                    hmp["Turkish_word"] = tftr.text;
                    hmp["starred"] = 2;
                    ref.push().set(hmp);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.blue.shade300,
                        content: Row(
                          children: [
                            Icon(Icons.done),
                            Spacer(),
                            Text(
                              "WORD HAS ADDED SUCCESFULLY",
                              style: TextStyle(
                                  color: Colors.deepPurple,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                          ],
                        ),
                        duration: Duration(seconds: 2),
                      ),
                    );
                    setState(() {
                      tfeng.text = '';
                      tftr.text = '';
                    });
                  }
                },
                child: Text(
                  "ADD WORD",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
