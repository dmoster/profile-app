import 'package:flutter/material.dart';

class ImageEditor extends StatefulWidget {
  const ImageEditor({Key key, this.imageUrl}) : super(key: key);

  final String imageUrl;

  static const routeName = '/image_editor';

  @override
  _ImageEditorState createState() => _ImageEditorState();
}

class _ImageEditorState extends State<ImageEditor> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
