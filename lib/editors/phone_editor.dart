import 'package:flutter/material.dart';

class PhoneEditor extends StatefulWidget {
  const PhoneEditor({Key key, this.phoneNumber}) : super(key: key);

  final String phoneNumber;

  static const routeName = '/phone_editor';

  @override
  _PhoneEditorState createState() => _PhoneEditorState();
}

class _PhoneEditorState extends State<PhoneEditor> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
