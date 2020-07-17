import 'package:flutter/material.dart';
import 'package:localization_demo/localization/app_localization.dart';

String translateHere(BuildContext context, String key) {
  return AppLocalization.of(context).translate(key);
}
