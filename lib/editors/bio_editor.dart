import 'dart:convert';

import 'package:flutter/material.dart';

class BioEditor extends StatefulWidget {
  const BioEditor({Key key, this.bioText}) : super(key: key);

  final String bioText;

  static const routeName = '/bio_editor';

  @override
  _BioEditorState createState() => _BioEditorState();
}

class _BioEditorState extends State<BioEditor> {
  TextEditingController _bioTextController;

  @override
  void initState() {
    super.initState();
    _bioTextController = TextEditingController();
    _bioTextController.text = widget.bioText;
  }

  @override
  void dispose() {
    _bioTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32),
            Text(
              'What type of passenger are you?',
              style: TextStyle(
                color: Color(0xff323232),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                    ),
                    child: TextFormField(
                      style: TextStyle(
                        color: Color(0xff323232),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      controller: _bioTextController,
                      maxLines: 6,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(0, 32, 0, 0),
                        labelText: 'Write a little about yourself',
                        labelStyle: TextStyle(color: Colors.black38),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(
                      'Update',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(16),
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        )),
                    onPressed: () {
                      Map<String, dynamic> data = {
                        'bioText': _bioTextController.text,
                      };
                      Navigator.pop(
                        context,
                        json.encode(data),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
