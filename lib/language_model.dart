class Language {
  int id;
  String lang;

  Language(this.id, this.lang);

  factory Language.fromMap(Map<String, dynamic> json) =>
      Language(json["id"], json["lang"]);

  Map<String, dynamic> toMap() => {"id": id, "lang": lang};

  //this method gives language by the language code.
  //a table is going to be created in the db afterwards.
  static getLangByCode(String code) {
    switch (code) {
      case 'en':
        return 'English';
      case 'hi':
        return 'Hindi';
    }
  }
}
