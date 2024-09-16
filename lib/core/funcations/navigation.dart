import 'package:flutter/material.dart';

Push(BuildContext context, Widget newScreen) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => newScreen,
  ));
}

PushWithReplacment(BuildContext context, Widget newScreen) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) => newScreen,
  ));
}
