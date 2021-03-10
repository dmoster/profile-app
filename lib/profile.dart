import 'package:flutter/material.dart';
import 'package:profile_app/widgets/profile_list_tile.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  static const routeName = '/profile';

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String imageUrl = 'assets/images/me_square.png';
  String firstName = 'Daniel';
  String lastName = 'Moster';
  String phoneNumber = '(513) 725-7100';
  String emailAddress = 'd.moster@me.com';
  String bioText =
      'Hi, my name is Daniel Moster. I am from Ohio but live in Nampa, ID.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 96),
              Text(
                'Edit Profile',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 72,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/me_square.png'),
                  radius: 66,
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 0),
                  children: [
                    ProfileListTile(
                      label: 'Name',
                      content: '$firstName $lastName',
                    ),
                    ProfileListTile(
                      label: 'Phone',
                      content: '$phoneNumber',
                    ),
                    ProfileListTile(
                      label: 'Email',
                      content: '$emailAddress',
                    ),
                    ProfileListTile(
                      label: 'Tell us about yourself',
                      content: '$bioText',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
