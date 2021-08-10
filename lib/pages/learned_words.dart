import 'dart:collection';

import 'package:english_turkish/firebase/firebase.dart';
import 'package:english_turkish/models/word_pair.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Learned extends StatefulWidget {
  const Learned({Key? key}) : super(key: key);

  @override
  _LearnedState createState() => _LearnedState();
}

class _LearnedState extends State<Learned> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Event>(
      stream: ref.onValue,
      builder: (context, event) {
        if (event.hasData) {
          List<Word> words = [];
          var datas = event.data!.snapshot.value;
          if (datas != null) {
            datas.forEach((key, nesne) {
              var word = Word.fromJson(key, nesne);
              words.add(word);
            });
          }
          return ListView.builder(
            itemCount: words.length,
            itemBuilder: (context, indeks) {
              var word = words[indeks];
              if (word.starred == 2) {
                return GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    height: 90,
                    child: Card(
                      color: Colors.tealAccent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 120,
                            child: Text(
                              word.English_word,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 50,
                            child: Icon(Icons.arrow_forward),
                          ),
                          Text(
                            word.Turkish_word,
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          IconButton(
                              onPressed: () {
                                var hashm = HashMap<String, dynamic>();
                                hashm["English_word"] = word.English_word;
                                hashm["Turkish_word"] = word.Turkish_word;
                                hashm["starred"] = 1;
                                ref.child(word.key).update(hashm);
                              },
                              icon: Icon(Icons.favorite)),
                        ],
                      ),
                    ),
                  ),
                );
              }
              return Center();
            },
          );
        } else {
          return Center();
        }
      },
    );
  }
}
