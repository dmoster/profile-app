import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:profile_app/editors/bio_editor.dart';
import 'package:profile_app/editors/email_editor.dart';
import 'package:profile_app/editors/image_editor.dart';
import 'package:profile_app/editors/name_editor.dart';
import 'package:profile_app/editors/phone_editor.dart';
import 'package:profile_app/profile.dart';
import 'package:profile_app/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Profile',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      onGenerateRoute: (settings) {
        if (settings.name == Profile.routeName) {
          return MaterialPageRoute(
            builder: (context) {
              return Profile();
            },
          );
        } else if (settings.name == ImageEditor.routeName) {
          final SingleStringArguments args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) {
              return ImageEditor(
                imageUrl: args.itemText,
              );
            },
          );
        } else if (settings.name == NameEditor.routeName) {
          final DualStringArguments args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) {
              return NameEditor(
                firstName: args.itemText1,
                lastName: args.itemText2,
              );
            },
          );
        } else if (settings.name == PhoneEditor.routeName) {
          final SingleStringArguments args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) {
              return PhoneEditor(
                phoneNumber: args.itemText,
              );
            },
          );
        } else if (settings.name == EmailEditor.routeName) {
          final SingleStringArguments args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) {
              return EmailEditor(
                emailAddress: args.itemText,
              );
            },
          );
        } else if (settings.name == BioEditor.routeName) {
          final SingleStringArguments args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) {
              return BioEditor(
                bioText: args.itemText,
              );
            },
          );
        }
        return null;
      },
      home: Profile(),
    );
  }
}
