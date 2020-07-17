class Language {
  String name;
  String code;

  Language({this.name, this.code});

  static List<Language> getListOfLanguages() {
    List<Language> languages;
    languages = [
      Language(name: "العربية", code: 'ar'),
      Language(name: "English", code: 'en')
    ];
    return languages;
  }
}
