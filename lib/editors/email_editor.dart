import 'dart:convert';

import 'package:flutter/material.dart';

class EmailEditor extends StatefulWidget {
  const EmailEditor({Key key, this.emailAddress}) : super(key: key);

  final String emailAddress;

  static const routeName = '/email_editor';

  @override
  _EmailEditorState createState() => _EmailEditorState();
}

class _EmailEditorState extends State<EmailEditor> {
  TextEditingController _emailAddressController;

  @override
  void initState() {
    super.initState();
    _emailAddressController = TextEditingController();
    _emailAddressController.text = widget.emailAddress;
  }

  @override
  void dispose() {
    _emailAddressController.dispose();
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
              'What\'s your email?',
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
                      controller: _emailAddressController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        labelText: 'Your email address',
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
                        'emailAddress': _emailAddressController.text,
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
