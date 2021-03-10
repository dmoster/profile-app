import 'package:flutter/material.dart';

class BioEditor extends StatefulWidget {
  const BioEditor({Key key, this.bioText}) : super(key: key);

  final String bioText;

  static const routeName = '/bio_editor';

  @override
  _BioEditorState createState() => _BioEditorState();
}

class _BioEditorState extends State<BioEditor> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
