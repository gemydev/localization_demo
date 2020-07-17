import 'package:flutter/material.dart';
import 'package:localization_demo/localization/keys.dart';
import 'package:localization_demo/localization/utils.dart';
import 'package:localization_demo/model/language.dart';
import 'package:localization_demo/ui/second_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

String localLanguageCode;

class MyHomePage extends StatefulWidget {
  final Locale locale;

  MyHomePage({this.locale});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _select(Language language) async {
    Language _selectedLanguage;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _selectedLanguage = language;
      sharedPreferences.setString("localLanguage", language.code);
    });
    print(sharedPreferences.getString("localLanguage"));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translateHere(context, HOME_PAGE_TITLE)),
        actions: <Widget>[
          PopupMenuButton<Language>(
            icon: Icon(Icons.language),
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return Language.getListOfLanguages().map((Language language) {
                return PopupMenuItem<Language>(
                  value: language,
                  child: Text(language.name),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              translateHere(context, HOME_PAGE_MESSAGE),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SecondPage()));
              },
              child: Text(translateHere(context, RAISED_BUTTON_NAME)),
            )
          ],
        ),
      ),
    );
  }
}
