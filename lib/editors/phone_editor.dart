import 'dart:convert';

import 'package:flutter/material.dart';

class PhoneEditor extends StatefulWidget {
  const PhoneEditor({Key key, this.phoneNumber}) : super(key: key);

  final String phoneNumber;

  static const routeName = '/phone_editor';

  @override
  _PhoneEditorState createState() => _PhoneEditorState();
}

class _PhoneEditorState extends State<PhoneEditor> {
  TextEditingController _phoneNumberController;

  @override
  void initState() {
    super.initState();
    _phoneNumberController = TextEditingController();
    _phoneNumberController.text = widget.phoneNumber;
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
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
              'What\'s your phone number?',
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
                      controller: _phoneNumberController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        labelText: 'Your phone number',
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
                        'phoneNumber': _phoneNumberController.text,
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
