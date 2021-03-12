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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32),
            Text(
              'Upload a photo of yourself:',
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
                    child: Image(
                      image: AssetImage(widget.imageUrl),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 64),
            Center(
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
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
