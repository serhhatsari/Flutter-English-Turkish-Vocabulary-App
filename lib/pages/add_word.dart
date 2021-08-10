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
                      color: Colors.white,
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
                      color: Colors.white,
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
                        return "Enter a word please";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      icon: Icon(Icons.language),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "You can enter meaning in here",
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
                onPressed: () {},
                child: Text(
                  "ADD WORD",
                  style: TextStyle(
                    fontSize: 20,
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
