import 'package:flutter/material.dart';

class EmailEditor extends StatefulWidget {
  const EmailEditor({Key key, this.emailAddress}) : super(key: key);

  final String emailAddress;

  static const routeName = '/email_editor';

  @override
  _EmailEditorState createState() => _EmailEditorState();
}

class _EmailEditorState extends State<EmailEditor> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
