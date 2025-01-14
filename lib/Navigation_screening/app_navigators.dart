import 'package:flutter/material.dart';

class AppNavigators {
  static outscreen(BuildContext context, String login) {
    Navigator.pop(context);
  }

  static changescreen(BuildContext context, String page) {
    Navigator.pushReplacementNamed(context, page);
  }

  static nextscreen(BuildContext context, String page) {
    Navigator.pushNamed(context, page);
  }
}
