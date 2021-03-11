import 'dart:convert';

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
  TextEditingController _firstNameController;
  TextEditingController _lastNameController;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _firstNameController.text = widget.firstName;
    _lastNameController.text = widget.lastName;
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
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
              'What\'s your name?',
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
                      controller: _firstNameController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        labelText: 'First Name',
                        labelStyle: TextStyle(color: Colors.black38),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
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
                      controller: _lastNameController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        labelText: 'Last Name',
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
                        'firstName': _firstNameController.text,
                        'lastName': _lastNameController.text,
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
