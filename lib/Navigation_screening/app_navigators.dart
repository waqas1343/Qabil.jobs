import 'package:flutter/material.dart';

class AppNavigators {
  static outscreen(BuildContext context, String login) {
    Navigator.pop(context);
  }

  static nextscreen(BuildContext context, String page) {
    Navigator.pushNamed(context, page);
  }

  static changescreen(BuildContext context, String page) {
    Navigator.pushReplacementNamed(context, page);
  }
}
