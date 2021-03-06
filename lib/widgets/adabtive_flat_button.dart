import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdabtiveFlatButton extends StatelessWidget {
  final String text;
  final Function handler;
  AdabtiveFlatButton(
    this.text,
    this.handler,
  ) {
    print('Constructor AdabtiveFlatButton');
  }
  @override
  Widget build(BuildContext context) {
    print('build() AdabtiveFlatButton');
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: handler,
          )
        : FlatButton(
            onPressed: handler,
            textColor: Theme.of(context).primaryColor,
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          );
  }
}
