import 'package:english_turkish/pages/add_word.dart';
import 'package:english_turkish/pages/all_words.dart';
import 'package:english_turkish/pages/learned_words.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 1;
  var pages = [AddWord(), AllWords(), Learned()];
  var ref = FirebaseDatabase.instance.reference().child("words");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("English - Turkish Words"),
        centerTitle: true,
      ),
      body: pages[index],
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: (indeks) {
        setState(() {
          index = indeks;
        });
      },
      backgroundColor: Colors.indigo,
      selectedItemColor: Colors.cyanAccent,
      unselectedItemColor: Colors.cyan,
      items: [
        BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.add,
              color: Colors.tealAccent,
            ),
            icon: Icon(Icons.add),
            label: "Add Word"),
        BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_sharp), label: "Words"),
        BottomNavigationBarItem(
            activeIcon: Icon(Icons.favorite),
            icon: Icon(Icons.favorite_outline_sharp),
            label: "Learned"),
      ],
    );
  }
}
