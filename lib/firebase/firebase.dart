import 'dart:collection';

import 'package:english_turkish/models/word_pair.dart';
import 'package:firebase_database/firebase_database.dart';

var ref = FirebaseDatabase.instance.reference().child("words");

Future<List<Word>> ListenAndReadData() async {
  List<Word> words = [];
  ref.onValue.listen(
    (event) {
      var datas = event.snapshot.value;
      if (datas != null) {
        datas.forEach((key, nesne) {
          var word = Word.fromJson(key, nesne);
          words.add(word);
        });
      }
    },
  );
  return words;
}

Future<void> InsertData() async {
  var hmp = HashMap<String, dynamic>();
  hmp["English_word"] = "knight";
  hmp["Turkish_word"] = "şövalye";
  hmp["starred"] = 1;
  ref.push().set(hmp);
}
