import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomProgressDialog {
  BuildContext? context;

  void showProgressDialog(BuildContext context) {
    this.context = context;
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Center(
            child: SizedBox(
              height: 50,
              width: 50,
              child: Theme(
                data: Theme.of(context),
                child: Platform.isAndroid
                    ? const CircularProgressIndicator()
                    : const CupertinoActivityIndicator(),
              ),
            ),
          );
        });
  }

  void dismiss(BuildContext context) {
    Navigator.pop(context);
  }
}
