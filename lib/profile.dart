import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:profile_app/editors/bio_editor.dart';
import 'package:profile_app/editors/email_editor.dart';
import 'package:profile_app/editors/image_editor.dart';
import 'package:profile_app/editors/name_editor.dart';
import 'package:profile_app/editors/phone_editor.dart';
import 'package:profile_app/routes.dart';
import 'package:profile_app/widgets/profile_list_tile.dart';

class Profile extends StatefulWidget {
  const Profile(
      {Key key,
      this.imageUrl,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.emailAddress,
      this.bioText})
      : super(key: key);

  final String imageUrl;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String emailAddress;
  final String bioText;

  static const routeName = '/profile';

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String imageUrl;
  String firstName;
  String lastName;
  String phoneNumber;
  String emailAddress;
  String bioText;

  @override
  void initState() {
    super.initState();
    imageUrl = 'assets/images/me_square.png';
    firstName = 'Daniel';
    lastName = 'Moster';
    phoneNumber = '(513) 725-7100';
    emailAddress = 'd.moster@me.com';
    bioText =
        'Hi, my name is Daniel Moster. I am from Ohio but live in Nampa, ID.';
  }

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
              Stack(
                alignment: Alignment.topRight,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 72,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(imageUrl),
                      radius: 66,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      color: Colors.blue,
                      icon: Icon(Icons.edit),
                      onPressed: () => Navigator.pushNamed(
                        context,
                        ImageEditor.routeName,
                        arguments: SingleStringArguments(imageUrl),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 0),
                  children: [
                    ProfileListTile(
                      label: 'Name',
                      content: '$firstName $lastName',
                      onTap: () async {
                        final updatedNamesJson = await Navigator.pushNamed(
                          context,
                          NameEditor.routeName,
                          arguments: DualStringArguments(firstName, lastName),
                        );
                        Map<String, dynamic> updatedNames =
                            json.decode(updatedNamesJson);
                        setState(() {
                          firstName = updatedNames['firstName'];
                          lastName = updatedNames['lastName'];
                        });
                      },
                    ),
                    ProfileListTile(
                      label: 'Phone',
                      content: '$phoneNumber',
                      onTap: () async {
                        final updatedPhoneNumberJson =
                            await Navigator.pushNamed(
                          context,
                          PhoneEditor.routeName,
                          arguments: SingleStringArguments(phoneNumber),
                        );
                        Map<String, dynamic> updatedPhoneNumber =
                            json.decode(updatedPhoneNumberJson);
                        setState(() {
                          phoneNumber = updatedPhoneNumber['phoneNumber'];
                        });
                      },
                    ),
                    ProfileListTile(
                      label: 'Email',
                      content: '$emailAddress',
                      onTap: () async {
                        final updatedEmailAddressJson =
                            await Navigator.pushNamed(
                          context,
                          EmailEditor.routeName,
                          arguments: SingleStringArguments(emailAddress),
                        );
                        Map<String, dynamic> updatedEmailAddress =
                            json.decode(updatedEmailAddressJson);
                        setState(() {
                          emailAddress = updatedEmailAddress['emailAddress'];
                        });
                      },
                    ),
                    ProfileListTile(
                      label: 'Tell us about yourself',
                      content: '$bioText',
                      onTap: () async {
                        final updatedBioTextJson = await Navigator.pushNamed(
                          context,
                          BioEditor.routeName,
                          arguments: SingleStringArguments(bioText),
                        );
                        Map<String, dynamic> updatedBioText =
                            json.decode(updatedBioTextJson);
                        setState(() {
                          bioText = updatedBioText['bioText'];
                        });
                      },
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
