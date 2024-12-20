import 'package:flutter/material.dart';

void showSnakBar(BuildContext context, String text) {
  var snackBar = SnackBar(content: Text(text));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
