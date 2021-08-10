class Word {
  String key = '';
  String English_word = '';
  String Turkish_word = '';
  int starred = 1;

  Word(this.key, this.English_word, this.Turkish_word, this.starred);

  factory Word.fromJson(String key, Map<dynamic, dynamic> json) {
    return Word(key, json["English_word"] as String,
        json["Turkish_word"] as String, json["starred"] as int);
  }
}
