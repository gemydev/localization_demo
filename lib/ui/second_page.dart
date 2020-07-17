import 'package:flutter/material.dart';
import 'package:localization_demo/localization/keys.dart';
import 'package:localization_demo/localization/utils.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translateHere(context, SECOND_PAGE_TITLE)),
      ),
      body: Container(
        child: Center(
          child: Text(translateHere(context, SECOND_PAGE_MESSAGE)),
        ),
      ),
    );
  }
}
