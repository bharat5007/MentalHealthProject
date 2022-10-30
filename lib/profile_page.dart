import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}


class _UserProfileState extends State<UserProfile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firebaseAuth.authStateChanges()
        .firstWhere((user) => user != null)
        .then((user) {
      String? user_Name = user?.displayName;
      String? image_Url = user?.photoURL;
      String? email_Id = user?.email;
      String? user_Uuid = user?.uid; // etc
  });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30,
            child: Container(
            ),
          )
        ],
      ),
    );
  }
}



