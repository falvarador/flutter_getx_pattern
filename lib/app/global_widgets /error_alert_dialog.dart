import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorAlertDialog extends StatelessWidget {
  const ErrorAlertDialog({Key key, @required this.message}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        title: Text("ERROR"),
        content: Text(message),
        actions: [
          FlatButton(
            child: Text("OK"),
            onPressed: () {
              Get.back();
            },
          )
        ],
      ),
    );
  }
}
