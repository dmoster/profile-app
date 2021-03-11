import 'package:flutter/material.dart';

class ProfileListTile extends StatefulWidget {
  const ProfileListTile({
    Key key,
    @required this.label,
    @required this.content,
    @required this.onTap,
  }) : super(key: key);

  final String label;
  final String content;
  final VoidCallback onTap;

  @override
  _ProfileListTileState createState() => _ProfileListTileState();
}

class _ProfileListTileState extends State<ProfileListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black12),
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        isThreeLine: widget.content.length > 45 ? true : false,
        title: Text(
          widget.label,
          style: TextStyle(
            color: Colors.black26,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          widget.content,
          style: TextStyle(
            color: Color(0xff323232),
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Transform.scale(
          scale: 1.5,
          child: Icon(
            Icons.chevron_right_outlined,
            color: Colors.black26,
          ),
        ),
        onTap: widget.onTap,
      ),
    );
  }
}
