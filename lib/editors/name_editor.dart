import 'package:flutter/material.dart';

class NameEditor extends StatefulWidget {
  const NameEditor({Key key, this.firstName, this.lastName}) : super(key: key);

  final String firstName;
  final String lastName;

  static const routeName = '/name_editor';

  @override
  _NameEditorState createState() => _NameEditorState();
}

class _NameEditorState extends State<NameEditor> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
